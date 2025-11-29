import React, { createContext, useContext, useState } from 'react';

const AuthContext = createContext(null);

export const AuthProvider = ({ children }) => {
    // Diisi saat login berhasil, mengambil permissions dari respons backend
    const [userPermissions, setUserPermissions] = useState([]);
    const [isLoggedIn, setIsLoggedIn] = useState(false);

    // Fungsi ini dipanggil setelah API login berhasil
    const login = (userData, permissionsList) => {
        // Asumsi respons login dari backend: { user: {...}, permissions: [...] }
        setUserPermissions(permissionsList);
        setIsLoggedIn(true);
        // Simpan token ke localStorage/sessionStorage
    };

    const logout = () => {
        setUserPermissions([]);
        setIsLoggedIn(false);
        // Hapus token dari storage
    };

    return (
        <AuthContext.Provider value={{ userPermissions, isLoggedIn, login, logout }}>
            {children}
        </AuthContext.Provider>
    );
};

export const useAuth = () => useContext(AuthContext);