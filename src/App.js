import React, { useEffect, useState } from 'react';
import axios from 'axios';
import logo from './logo.svg';
import './App.css';

const api = axios.create({
  baseURL: 'http://localhost:5000', // Update with your Flask backend URL
});

function App() {
  const [data, setData] = useState(null);

  useEffect(() => {
    api.get('/api/data')
      .then(response => {
        setData(response.data);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Welcome to InQUIZitive. today is wednesday
        </p>
      </header>
    </div>
  );
}

export default App;

