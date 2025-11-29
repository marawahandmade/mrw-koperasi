// components/Sidebar.js
import React from 'react';
import { useAccessControl } from '../hooks/useAccessControl';
import { Link } from 'react-router-dom';

// 1. Definisikan Struktur Menu dengan Izin yang Dibutuhkan
const sidebarMenu = [
    { 
        title: "Dashboard", 
        path: "/dashboard", 
        requiredPermission: null // Tidak memerlukan izin khusus (untuk semua user login)
    },
    { 
        title: "Anggota", 
        path: "/members", 
        requiredPermission: "read-member" // Hanya tampil jika punya izin read-member
    },
    { 
        title: "Simpan Pinjam", 
        path: "/finances", 
        requiredPermission: "read-simpanan" // Hanya tampil jika punya izin read-simpanan
    },
    { 
        title: "Penjualan & Stok", 
        path: "/sales", 
        requiredPermission: "read-penjualan" // Hanya tampil jika punya izin read-penjualan
    },
    { 
        title: "Manajemen Pengguna", 
        path: "/users", 
        requiredPermission: "read-user" // Hanya tampil jika punya izin read-user
    },
];


const Sidebar = () => {
    // Ambil fungsi pemeriksaan izin
    const { canAccess } = useAccessControl();

    // 2. Filter Menu Berdasarkan Izin
    const filteredMenu = sidebarMenu.filter(item => {
        // Cek apakah pengguna memiliki izin yang dibutuhkan untuk item menu ini
        return canAccess(item.requiredPermission);
    });

    return (
        <div className="sidebar">
            <ul>
                {filteredMenu.map(item => (
                    <li key={item.path}>
                        <Link to={item.path}>{item.title}</Link>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default Sidebar;