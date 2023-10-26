-- Задача 1. Вывести среднюю реакцию по треку 1.
db.reactions.aggregate([
    {$match: {track_id: 1}},
    {$group: {_id: null, average_reaction: { $avg: "$value" }}}
])

-- Задача 2. Увеличить баланс всех незаблокированных юзеров на 0.5%.
db.users.updateMany(
    { is_blocked: { $ne: true }},
    { $mul: { balance: 1.005 }}
)

-- Задача 3. Вывести ко-во реакций с оценкой 4.
db.reactions.aggregate([
    {$match: {value: 4}},
    { $count: "reaction_4_count"}
])

-- Задача 4. Вывести названия треков, принадлежащих юзеру 4.
db.tracks.aggregate([
    {$match: {author_id: 4}},
    {$project: {title: 1, _id: 0 }}])
)

-- Задача 5. С помощью инструмента онлайн-проектирования опишите схему БД поликлиника
https://dbdiagram.io/d/6538eeadffbf5169f06b7624
