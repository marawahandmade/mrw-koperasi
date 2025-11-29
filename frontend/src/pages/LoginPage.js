import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext'; 

const API_URL = 'http://localhost:5000/api/auth'; // Ganti dengan URL backend Anda

const LoginPage = () => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');
    const [isLoading, setIsLoading] = useState(false);
    
    const navigate = useNavigate();
    const { login } = useAuth(); // Ambil fungsi login dari AuthContext

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError('');
        setIsLoading(true);

        try {
            const response = await axios.post(`${API_URL}/login`, {
                username,
                password,
            });

            const { token, user, permissions } = response.data;

            // 1. Simpan Token ke Local Storage
            localStorage.setItem('koperasi_token', token);
            
            // 2. Simpan Status User & Izin ke Global Context
            login(user, permissions); 

            // 3. Navigasi ke Dashboard
            navigate('/dashboard'); 

        } catch (err) {
            console.error("Login Gagal:", err);
            const message = err.response?.data?.message || "Gagal terhubung ke server.";
            setError(message);
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <div className="login-container">
            <form onSubmit={handleSubmit} className="login-form">
                <h2>Login Koperasi</h2>
                {error && <p className="error-message">{error}</p>}
                
                <div className="form-group">
                    <label htmlFor="username">Username</label>
                    <input
                        type="text"
                        id="username"
                        value={username}
                        onChange={(e) => setUsername(e.target.value)}
                        required
                    />
                </div>
                
                <div className="form-group">
                    <label htmlFor="password">Password</label>
                    <input
                        type="password"
                        id="password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        required
                    />
                </div>
                
                <button type="submit" disabled={isLoading}>
                    {isLoading ? 'Memuat...' : 'Login'}
                </button>
            </form>
        </div>
    );
};

export default LoginPage;