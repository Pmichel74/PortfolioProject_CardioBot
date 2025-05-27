import axios from 'axios';

const API_BASE_URL = 'https://api.example.com'; // Replace with actual API base URL

export const fetchDataFromApi = async (endpoint: string) => {
    try {
        const response = await axios.get(`${API_BASE_URL}/${endpoint}`);
        return response.data;
    } catch (error) {
        console.error('Error fetching data from API:', error);
        throw error;
    }
};

export const postDataToApi = async (endpoint: string, data: any) => {
    try {
        const response = await axios.post(`${API_BASE_URL}/${endpoint}`, data);
        return response.data;
    } catch (error) {
        console.error('Error posting data to API:', error);
        throw error;
    }
};

// Additional functions for interacting with other external APIs can be added here.