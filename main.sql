-- ---- НАЧАЛЬНЫЙ ИНСТРУМЕНТАРИЙ ---- -- 
-- ---- ДЛЯ ВЗАИМОДЕЙСТВИЯ С SQL ---- --

-- ---- СОЗДАТЬ ТАБЛИЦУ ---- --
-- ---- CREATE TABLE shop (name VARCHAR(20)); ---- --

-- ---- ЗАПИСЬ ДАННЫХ В ТАБЛИЦУ ---- --
-- ---- INSERT INTO shop (name)
-- ---- VALUES ('привет'); ---- --

-- ---- ПОЛНОСТЬЮ ПРОСМОТРЕТЬ ТАБЛИЦУ ---- --
-- ---- SELECT * FROM shop; ---- --

-- ---- УСТАНОВИТЬ ПЕРВИЧНЫЙ КЛЮЧ ДЛЯ ТАБЛИЦЫ ---- --
-- ---- ID INTEGER PRIMARY KEY ---- --

-- ---- УСТАНОВИТЬ ВНЕШНИЙ КЛЮЧ ДЛЯ СВЯЗИ ---- --
-- ---- МЕЖДУ ТАБЛИЦАМИ (ГЛАВНОЙ И ЗАВИСИМОЙ) ---- --
-- ---- FOREIGN KEY (shop_id) REFERENCES shop (ID) ---- --

-- ---- УДАЛИТЬ ПОЛНОСТЬЮ ТАБЛИЦУ ---- --
-- ---- DROP TABLE IF EXISTS shop; ---- --

-- ---- УДАЛИТЬ СТРОКУ В СТОЛБЦЕ ---- --
-- ---- DELETE FROM shop WHERE ID = 2; ---- --

-- ---------------------------------------------------- --

-- ---- СОЗДАНИЕ ТАБЛИЦ ---- --
-- ---- И ИХ ИНИЦИАЛИЗАЦИЯ ---- --

CREATE TABLE shop (
    ID INTEGER PRIMARY KEY,
    name VARCHAR(20),
    address VARCHAR(20)
);

INSERT INTO shop (name, address)
VALUES ('Лерамерлин', 'Разбитых фонарей 12');

INSERT INTO shop (name, address)
VALUES ('ПятерочкаКосметик', 'Космонавтики 45');

INSERT INTO shop (name, address)
VALUES ('Карабарабах', 'Совсем не проехать 70');

INSERT INTO shop (name, address)
VALUES ('ЛарекУДОМУ', 'Сельская вип 11');

INSERT INTO shop (name, address)
VALUES ('ВсеЧтоНадо', 'Мороженщиков 36');


CREATE TABLE product (
    ID INTEGER PRIMARY KEY,
    name VARCHAR(20), 
    price INT, 
    count INT
    );

INSERT INTO product (name, price, count)
VALUES ('ДухиЗапахГор', 12000, 17);

INSERT INTO product (name, price, count)
VALUES ('МолотокОтбойный', 10000, 3);

INSERT INTO product (name, price, count)
VALUES ('КолбасаСлоновая', 5000, 25);

INSERT INTO product (name, price, count)
VALUES ('РыбныйТорт', 300, 4);

INSERT INTO product (name, price, count)
VALUES ('Салфетки', 250, 55);

-- -- ---- СОЗДАНИЕ ТАБЛИЦ, ИХ ИНИЦИАЛИЗАЦИЯ И ---- --
-- -- ---- УСТАНОВКА ЗАВИСИМОСТИ ТАБЛИЦ ---- ---

CREATE TABLE orders (
    ID INTEGER PRIMARY KEY,    
    created_at DATE,
    shop_id INTEGER NOT NULL,
    client_id INTEGER NOT NULL,
    FOREIGN KEY (shop_id) REFERENCES shop (ID) ON DELETE CASCADE
    FOREIGN KEY (client_id) REFERENCES client (ID) ON DELETE CASCADE
);

INSERT INTO orders (created_at, shop_id, client_id)
VALUES ('27-03-2023', 5, 2);

INSERT INTO orders (created_at, shop_id, client_id)
VALUES ('26-03-2023', 1, 1);

INSERT INTO orders (created_at, shop_id, client_id)
VALUES ('22-03-2023', 4, 4);

INSERT INTO orders (created_at, shop_id, client_id)
VALUES ('15-03-2023', 5, 3);

INSERT INTO orders (created_at, shop_id, client_id)
VALUES ('10-03-2023', 2, 5);


CREATE TABLE client (
    ID INTEGER PRIMARY KEY,
    phone INT UNIQUE, 
    name VARCHAR(20)
    );

INSERT INTO client (phone, name)
VALUES (88005553535, 'Светлана');

INSERT INTO client (phone, name)
VALUES (88005553030, 'Кирилл');

INSERT INTO client (phone, name)
VALUES (88005553131, 'Мария');

INSERT INTO client (phone, name)
VALUES (88005553232, 'Алена');

INSERT INTO client (phone, name)
VALUES (88005553333, 'Георгий');


CREATE TABLE order_product (
    ID INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    order_price INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (ID) ON DELETE CASCADE
    FOREIGN KEY (product_id) REFERENCES product (ID) ON DELETE CASCADE
    FOREIGN KEY (order_price) REFERENCES product (price) ON DELETE CASCADE
);

INSERT INTO order_product (order_id, product_id, order_price)
VALUES (1, 1, 12000);

INSERT INTO order_product (order_id, product_id, order_price)
VALUES (2, 2, 10000);

INSERT INTO order_product (order_id, product_id, order_price)
VALUES (4, 5, 5000);

INSERT INTO order_product (order_id, product_id, order_price)
VALUES (4, 4, 300);

INSERT INTO order_product (order_id, product_id, order_price)
VALUES (5, 5, 250);



