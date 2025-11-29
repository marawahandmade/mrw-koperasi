// models/index.js (Contoh bagian asosiasi)
// ... import models (User, Role, Permission, dll.)

// Hubungan User - Role (Many-to-Many)
db.User.belongsToMany(db.Role, { through: 'UserRole', foreignKey: 'user_id', otherKey: 'role_id' });
db.Role.belongsToMany(db.User, { through: 'UserRole', foreignKey: 'role_id', otherKey: 'user_id' });

// Hubungan Role - Permission (Many-to-Many)
db.Role.belongsToMany(db.Permission, { through: 'RolePermission', foreignKey: 'role_id', otherKey: 'permission_id' });
db.Permission.belongsToMany(db.Role, { through: 'RolePermission', foreignKey: 'permission_id', otherKey: 'role_id' });

// Hubungan User - Permission (Override Many-to-Many)
db.User.belongsToMany(db.Permission, { through: db.UserPermission, foreignKey: 'user_id', otherKey: 'permission_id' });
db.Permission.belongsToMany(db.User, { through: db.UserPermission, foreignKey: 'permission_id', otherKey: 'user_id' });

// Juga, buat asosiasi langsung pada UserPermission agar bisa di-query
db.UserPermission.belongsTo(db.User, { foreignKey: 'user_id' });
db.UserPermission.belongsTo(db.Permission, { foreignKey: 'permission_id' });