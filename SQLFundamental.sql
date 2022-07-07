-- SELECT + Condition

-- WHERE 1
-- menampilkan semua data baris dengan nilai "makanan" dikolom "category" 
SELECT * 
FROM purchases 
WHERE category = 'makanan';

-- WHERE 2
-- mendapatkan baris dengan nilai "2018-10-10" dikolom "purchased_at" 
SELECT * 
FROM purchases 
WHERE purchased_At = "2018-10-10";

-- mendapatkan baris dengan nilai "10" dikolom "price" 
SELECT * 
FROM purchases 
WHERE price = 10;

-- Operator Perbandingan
-- mengambil baris dengan nilai "10" atau lebih dari kolom "price" 
SELECT * 
FROM purchases 
WHERE price >= 10;

-- Like 1
-- mengambil baris dimana nilai "name" mengandung kata "puding"
SELECT * 
FROM purchases 
WHERE name 
LIKE "%puding%";

-- Like 2
-- mengambil baris dimana nilai "name" dimulai dengan kata "puding"
SELECT * 
FROM purchases 
WHERE name 
LIKE "puding%";
-- mengambil baris dimana nilai "name" diakhiri dengan kata "puding"
SELECT * 
FROM purchases 
WHERE name 
LIKE "%puding";

-- NOT
-- mendapatkan semua baris dimana kolom "character_name" tidak mengandung kata "Ninja Ken"
SELECT * 
FROM purchases 
WHERE NOT character_name = "Ninja Ken";
-- mendapatkan semua baris dimana kolom "name" tidak mengandung kata "puding"
SELECT * 
FROM purchases 
WHERE NOT name 
LIKE "%puding%";

-- IS NULL 
-- mengambil baris dimana kolom  "price" adalah NULL
SELECT * 
FROM purchases 
WHERE price 
IS NULL;

-- IS NOT NULL
-- mengambil baris dimana kolom "price" adalah NOT NULL
SELECT * 
FROM purchases 
WHERE price 
IS NOT NULL;

-- AND
-- mengambil baris dimana nilai kolom "category" adalah "makanan" dan nilai kolom "character_name" adalah "Guru Domba"
SELECT * 
FROM purchases 
WHERE category = "makanan" 
AND character_name ="Guru Domba";

-- OR
-- mengambil baris dimana nilai kolom "category" adalah "makanan" atau nilai kolom "character_name" adalah "Ninja Ken"
SELECT * 
FROM purchases 
WHERE category = "makanan" 
OR character_name ="Ninja Ken";

-- SORTING and LIMIT

-- ORDER BY
-- menampilkan baris dari nilai yang terbesar dikolom "price"
SELECT * 
FROM purchases 
ORDER BY price 
DESC;
-- menampilkan baris dari nilai terkecil dikolom "price"
SELECT * 
FROM purchases 
WHERE character_name = "Ninja Ken" 
ORDER BY price 
ASC;

-- LIMIT
-- menampilkan maksimum 5 baris hasil
SELECT * 
FROM purchases 
LIMIT 5;
-- menampilkan hasil maksimum 10 baris
SELECT * 
FROM purchases 
WHERE character_name = "Ninja Ken" 
LIMIT 10;

-- Function Aggregation

-- SUM
-- dapatkan total jumlah dari kolom price
SELECT SUM(price) 
FROM purchases;

-- dapatkan jumlah total dari kolom price dimana nilai character_name adalah "Ninja Ken"
SELECT SUM(price) 
FROM purchases 
WHERE character_name = "Ninja Ken";

-- AVG
-- dapatkan nilai rata-rata dari kolom price
SELECT AVG(price) 
FROM purchases;

-- dapatkan nilai rata-rata dari kolom price dimana nilai character_name adalah "Ninja Ken"
SELECT AVG(price) 
FROM purchases 
WHERE character_name = "Ninja Ken";

-- COUNT
-- dapatkan jumlah baris dikolom name dari table purchases 
SELECT COUNT(name) 
FROM purchases;
-- dapatkan jumlah baris di tabel purchases 
SELECT COUNT(*)
FROM purchases;
-- dapatkan jumlah total baris dimana nilai character_name adalah "Ninja Ken"
SELECT COUNT(*) 
FROM purchases
WHERE character_name = "Ninja Ken";

-- MAX - MIN
-- dapatkan harga tertinggi di kolom price
SELECT MAX(price)
FROM purchases;
-- dapatkan harga terendah dikolom price
SELECT MIN(price)
FROM purchases;
-- untuk baris dimana nilai character_name adalah "Ninja Ken" dapatkan harga tertinggi dari semua nilai dikolom price
SELECT MAX(price)
FROM purchases 
WHERE character_name = "Ninja Ken";

-- GROUP BY
-- dapatkan jumlah total uang yang dikeluarkan untuk setiap grup purchased_at 
SELECT SUM(price), purchased_at 
FROM purchases 
GROUP BY purchased_At;
-- dapatkan jumlah baris untuk setiap grup purchased_at 
SELECT COUNT(price), purchased_at 
FROM purchases 
GROUP BY purchased_at;

-- GROUP BY lebih dari satu
-- dapatkan total harga purchases berdasarkan purchased_at dan character_name
SELECT SUM(price), purchased_at, character_name 
FROM purchases 
GROUP BY purchased_at, character_name;
-- dapatkan total berapa kali purchases terjadi berdasarkan purchased_at and character_name
SELECT COUNT(*), purchased_at, character_name 
FROM purchases 
GROUP BY purchased_at, character_name;

-- GROUP BY (WHERE)
-- tambahkan aturan di klausa WHERE untuk mengelompokkan baris, dimana character_name adalah "Ninja Ken"
SELECT SUM(price), purchased_at, character_name
FROM purchases
WHERE character_name = "Ninja Ken"
GROUP BY purchased_at, character_name;
/*Tambahkan klausa WHERE untuk mendapatkan baris dengan category "makanan"setelah itu, kelompokkan hasilnya berdasarkan 
kolompurchased_at dan character_name*/
SELECT SUM(price), purchased_at, character_name
FROM purchases
WHERE category = "makanan"
GROUP BY purchased_at, character_name
;

-- HAVING
/*dapatkan total harga, lalu kelompokkan hasilnya berdasarkan tanggal, 
hanya untuk grup yang memiliki total harga lebih dari 20*/
SELECT SUM(price), purchased_at
FROM purchases
GROUP BY purchased_at
HAVING SUM(price) > 20
;
-- dapatkan total berdasarkan tanggal dan karakter dimana totalnya lebih dari 30
SELECT SUM(price), purchased_at, character_name
FROM purchases
GROUP BY purchased_at, character_name
HAVING SUM(price) > 30
;

-- DISTINCT
-- dapatkan baris dari kolom character_name dengan duplikat dihilangkan
SELECT DISTINCT(character_name) 
FROM purchases;

-- dapatkan baris dari kolom name tanpa duplikat
SELECT DISTINCT(name) 
FROM purchases;

-- SUB QUERI
-- Tabel Players
-- skor pemain dengan nama Will
SELECT goals 
FROM players 
WHERE name = "Will";
-- lihat pemain mana yang jumlah golnya lebih tinggi dari Will.
SELECT * 
FROM players 
WHERE goals > 14;

-- Subkueri
-- menggunakan subkueri untuk mendapatkan skor pemain yang lebih tinggi dari Will.
SELECT name 
FROM players 
WHERE goals > (
  -- Ketik statement SQL untuk mendapatkan skor milik Will dibaris bawah
  SELECT goals
  FROM players
  WHERE name = 'Will'
);

-- Selanjutnya, dapatkan nama pemain yang memiliki skor di atas rata-rata.
SELECT name,goals 
FROM players 
WHERE goals > (
  SELECT AVG(goals)
  FROM players
);

-- AS (alias)
-- Pertama gunakan AS dengan kueri untuk mendapatkan data pemain dengan tinggi badan (height) 180 cm atau lebih.
-- Gunakan AS untuk menamai kolom "180 cm atau lebih"
SELECT name AS "180 cm atau lebih"
FROM players
WHERE height >= 180
;
-- Sekarang gunakan AS dan dapatkan skor total untuk seluruh tim.
-- Gunakan AS untuk menamai kolom "total skor tim"
SELECT SUM(goals) AS "total skor tim"
FROM players
;

-- Tabel Countries
-- Sekarang, coba kita lihat negara mana yang peringkatnya lebih tinggi dari Jepang.
-- Menggunakan subkueri, dapatkan baris yang peringkatnya lebih tinggi dari Jepang
SELECT *
FROM countries
WHERE rank < (
  SELECT rank
  FROM countries
  WHERE name = "Jepang"
)
;

-- Menggabungkan Tabel
-- Dapatkan total   goals dari kolom  country_id dengan menggunakan GROUP BY 
-- Bandingkan country_id dengan ID di tabel countries dan periksa total untuk setiap negara.
SELECT SUM(goals), country_id
FROM players
GROUP BY country_id
;

-- JOIN 1
-- Dalam latihan ini, kita akan mempraktikkan penggunaan JOIN untuk menggabungkan dua tabel.
-- Menggunakan JOIN, gabungkan tabel countries dengan tabel players.
SELECT *
FROM players
-- Tambahkan nama ke tabel gabungan
JOIN countries
-- Tambahkan kondisi join setelah ON
ON players.country_id = countries.id;

-- JOIN 2
/*Menggunakan JOIN, gabungkan tabel 
countries
 dengan tabel pemain, lalu dapatkan berikut ini:
  ① kolom name dari tabel players
  ② kolom name dari tabel countries*/
SELECT players.name, countries.name
FROM players
JOIN countries
ON players.country_id = countries.id
;

-- Selanjutnya, coba kita dapatkan skor total untuk setiap negara.
/*Menggunakan JOIN, gabungkan tabel 
countries
 dengan tabel players, lalu dapatkan berikut ini:
   ① kolom name dari tabel countries
   ② jumlah dari kolom 
goals
.
Selain itu, gunakan GROUP BY untuk membuat grup menggunakan 
countries.name
.*/
SELECT countries.name, SUM(goals)
FROM players
JOIN countries
ON players.country_id = countries.id
GROUP BY countries.name
;

-- Tabel teams
-- Coba kita lihat apa yang terjadi jika menggunakan JOIN dengan data yang mencakup nilai NULL.
-- Menggunakan JOIN, gabungkan tabel teams dengan tabel players, lalu dapatkan baris tabel tersebut
SELECT *
FROM players
JOIN teams
ON players.previous_team_id = teams.id
;
/*Menggunakan JOIN, gabungkan tabel teams dengan tabel players, lalu dapatkan hal berikut ini:
   ① kolom name dari tabel players
   ② kolom name dari tabel teams
Selain itu, tandai kolom sebagai berikut:
   • Untuk ①, gunakan nama pemain
   • Untuk ②, gunakan tim (tahun lalu)
*/
SELECT players.name AS "nama pemain", teams.name AS "tim (tahun lalu)"
FROM players
JOIN teams
ON players.previous_team_id = teams.id
;

-- Left Join
-- Menggunakan LEFT JOIN, gabungkan tabel teams dengan tabel players, lalu dapatkan baris tabel.
SELECT *
FROM players
LEFT JOIN teams
ON players.previous_team_id = teams.id
;
/* Menggunakan LEFT JOIN, gabungkan tabel teams dengan tabel players, lalu dapatkan berikut ini:
   ① kolom name dari tabel players
   ② kolom name dari tabel teams
Selain itu, tandai kolom sebagai berikut:
   • Untuk ①, gunakan nama pemain
   • Untuk ②, gunakan  tim (tahun lalu) 
*/
SELECT players.name AS "nama pemain", teams.name AS "tim (tahun lalu)"
FROM players
LEFT JOIN teams
ON players.previous_team_id = teams.id
;

-- Menggabungkan 3 Tabel
/*Tambahkan tabel berikut ke tabel players:
   ① tabel countries
   ② tabel teams
Tetapi, untuk ① gunakan JOIN dan untuk ② gunakan LEFT JOIN
*/
SELECT *
FROM players
JOIN countries
ON players.country_id = countries.id
LEFT JOIN teams
ON players.previous_team_id = teams.id
;

-- Mempraktikan keterampilan anda
/*Gunakan subkueri untuk mendapatkan nilai kolom height yang lebih tinggi dari tinggi rata-rata dan dapatkan berikut ini:
   ① nama pemain
   ② tinggi pemain
Tetapi, tandai kolom yang dihasilkan sebagai berikut:
   • Untuk ①, gunakan nama pemain
   • Untuk ②, gunakan tinggi pemain
*/
SELECT players.name AS "nama pemain", players.height AS "tinggi pemain"
FROM players
WHERE height > (
  SELECT AVG(height)
  FROM players
)
;

/*Menggunakan JOIN, dapatkan baris yang memenuhi kondisi berikut:
   ① Dari negara Jepang
   ② Setidaknya memiliki tinggi 180 cm
*/
SELECT *
FROM players
JOIN countries
ON countries.id = players.country_id
WHERE countries.name = "Jepang"
AND players.height >= 180
;

/*Menggunakan JOIN, dapatkan berikut ini:
   ① nama negara
   ② skor rata-rata untuk setiap negara
Selain itu, tandai kolom yang dihasilkan sebagai berikut:
   • Untuk ①, gunakan nama negara
   • Untuk ②, gunakan skor rata-rata
*/
SELECT countries.name AS "nama negara", AVG(goals) AS "skor rata-rata"
FROM players
JOIN countries
ON countries.id = players.country_id
GROUP BY countries.name
;

-- DML

-- 1. Insert
-- Tambahkan data ke tabel students
INSERT INTO students (name, course)
VALUES ('Kate', 'Java');

-- Jangan menghapus kueri dibawah
select * from students;

-- 2. UPDATE
/*Perbarui data di tabel students yang nilai kolom id-nya 6, seperti berikut.
name: Jordan
course: HTML
*Jangan lupa dengan klausa WHERE.*/
-- Di dalam tabel student, perbarui kolom name ke Jordan dan kolom course ke HTML untuk data dengan id 6
UPDATE students
SET name = "Jordan", course ="HTML"
WHERE id = 6;

-- 3. DELETE
-- Hapus data yang ber-id 7 di tabel student
DELETE FROM students
WHERE id = 7;

-- 4. Mempraktikan yang telah diajari
-- Tambahkan data baru ke tabel students, dimana nilai name adalah Katy dan nilai course-nya adalah HTML
INSERT INTO students (name, course)
VALUES ("Katy", "HTML");

-- Di dalam tabel students, perbarui kolom name menjadi Juliet dan kolom course-nya menjadi Ruby, untuk data yang ber id 6
UPDATE students
SET name = "Juliet", course = "Ruby"
WHERE id = 6;

-- Di dalam tabel students, hapus data yang ber id 2
DELETE FROM students
WHERE id = 2;
