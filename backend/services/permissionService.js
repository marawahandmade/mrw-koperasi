// services/permissionService.js
const { User, Role, Permission, UserPermission } = require('../models'); // Sesuaikan path

/**
 * Mengambil daftar izin efektif pengguna dari DB (Role + Override)
 * @param {number} userId - ID pengguna yang sedang login
 * @returns {Array<string>} Daftar nama izin efektif (misalnya: ['read-member', 'create-pinjaman'])
 */
async function getEffectivePermissionsFromDB(userId) {
    let permissionsSet = new Set();
    const deniedPermissions = [];

    // 1. Ambil Izin dari Role
    const userWithRoles = await User.findByPk(userId, {
        attributes: ['id'],
        include: [{
            model: Role,
            attributes: ['id'],
            through: { attributes: [] },
            include: [{
                model: Permission,
                attributes: ['name'],
                through: { attributes: [] }
            }]
        }]
    });

    if (userWithRoles && userWithRoles.Roles) {
        userWithRoles.Roles.forEach(role => {
            role.Permissions.forEach(perm => {
                permissionsSet.add(perm.name);
            });
        });
    }

    // 2. Ambil Izin Override (Allow & Deny)
    const overrides = await UserPermission.findAll({
        where: { user_id: userId }, // Perhatikan nama foreign key (user_id)
        attributes: ['type'], 
        include: [{ model: Permission, attributes: ['name'] }]
    });

    // 3. Terapkan Logika Override (Deny > Allow > Role)
    overrides.forEach(override => {
        const permissionName = override.Permission.name;
        
        if (override.type === 'allow') {
            permissionsSet.add(permissionName); // Tambahkan yang diizinkan (override positif)
        } else if (override.type === 'deny') {
            deniedPermissions.push(permissionName); // Kumpulkan yang ditolak (override negatif)
        }
    });

    // 4. Final Filter: Hapus semua izin yang secara eksplisit DITOLAK
    const finalPermissions = Array.from(permissionsSet).filter(
        name => !deniedPermissions.includes(name)
    );

    return finalPermissions;
}

module.exports = {
    getEffectivePermissionsFromDB
};