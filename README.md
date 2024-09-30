Приверы:
Запрос POST для добавления статистики
URL: http://localhost:3000/players/:player_id/stats
{
"stat": {
"goals": 2,
"assists": 1,
"shots": 3,
"passes": 5,
"saves": 0
}
}

Запрос GET для получения рейтинга
URL: http://localhost:3000/players/:player_id/rating

Запрос GET для игроков с пагинацией
URL: http://localhost:3000/players/?page=1