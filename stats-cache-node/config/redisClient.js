const redis = require('redis');
const client = redis.createClient(); // Configure si besoin d'hôte/mot de passe

client.connect();

client.on('error', (err) => console.error('Redis Client Error', err));

module.exports = client;
