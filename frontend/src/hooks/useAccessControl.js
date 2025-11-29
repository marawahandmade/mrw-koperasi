// hooks/useAccessControl.js
import { useAuth } from '../context/AuthContext'; 

/**
 * Custom Hook untuk memeriksa apakah pengguna memiliki izin tertentu.
 * @returns {function(string): boolean} Fungsi canAccess(requiredPermission)
 */
export const useAccessControl = () => {
    const { userPermissions } = useAuth();

    /**
     * @param {string} requiredPermission - Izin yang dibutuhkan (misalnya 'read-member')
     * @returns {boolean} True jika pengguna memiliki izin tersebut.
     */
    const canAccess = (requiredPermission) => {
        if (!requiredPermission) {
            // Jika tidak ada izin yang diminta, anggap bisa diakses (misalnya menu Home)
            return true;
        }
        
        // Cek apakah izin yang diminta ada dalam daftar izin efektif pengguna
        return userPermissions.includes(requiredPermission);
    };

    return { canAccess };
};