const redisClient = require('../config/redisClient');

// Simule une fonction d'accès aux vraies stats (BD ou API)
async function fetchStatsFromSource() {
    // Simule une base de données ou calcul
    return {
        usersOnline: Math.floor(Math.random() * 100),
        pageViews: Math.floor(Math.random() * 1000),
        timestamp: new Date().toISOString()
    };
}

class StatsDAO {
    static CACHE_KEY = 'stats:data';

    // Méthode de récupération (depuis Redis ou source)
    static async getStats() {
        const cached = await redisClient.get(StatsDAO.CACHE_KEY);

        if (cached) {
            return JSON.parse(cached);
        }

        // Si jamais expiré ou non trouvé, on va chercher et on met en cache
        const stats = await fetchStatsFromSource();
        await redisClient.set(StatsDAO.CACHE_KEY, JSON.stringify(stats), {
            EX: 900 // 15 minutes en secondes
        });
        return stats;
    }

    // Rafraîchit manuellement le cache
    static async refreshStats() {
        const stats = await fetchStatsFromSource();
        await redisClient.set(StatsDAO.CACHE_KEY, JSON.stringify(stats), {
            EX: 900
        });
        console.log('[StatsDAO] Stats refreshed in cache at', new Date().toISOString());
    }
}

module.exports = StatsDAO;
