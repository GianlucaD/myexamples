create DATABASE test_db;
-- \use test_db

drop table bestellung;
drop table kunde ;
CREATE TABLE kunde(id SERIAL PRIMARY  KEY,
name VARCHAR(30),
STATUS text,
phone_num VARCHAR(12));

INSERT INTO kunde(name,STATUS,phone_num)
VALUES('joemarie','regular','0985959905'),
('shakhira','probationary','093948889487'),
('hyle','regular','095599093490'),
('kobe','probationary','097867556451'),
('nasty','regular','094458909099'),
('arianne','regular','097746890988');

select * from kunde;

CREATE TABLE bestellung(id SERIAL PRIMARY KEY, produkt VARCHAR(20), kunde_id INT4, 
CONSTRAINT fk_kunde FOREIGN KEY(kunde_id) 
REFERENCES kunde(id) on delete cascade 
)
;

INSERT INTO bestellung(produkt, kunde_id) VALUES ('Air pods', 1);
INSERT INTO bestellung(produkt, kunde_id) VALUES ('Air pods', 2);
INSERT INTO bestellung(produkt, kunde_id) VALUES ('Air pods', 3);
INSERT INTO bestellung(produkt, kunde_id) VALUES ('Air pods', 4);
INSERT INTO bestellung(produkt, kunde_id) VALUES ('Macbook Pro', 4);
INSERT INTO bestellung(produkt, kunde_id) VALUES ('Iphone 12 Pro', 4);
INSERT INTO bestellung(produkt, kunde_id) VALUES ('Lightning cable', 4);

select * from bestellung;
// 7 Bestellungen

delete from kunde where id = 4;


select * from bestellung;

// 3 Bestellungen
