create  DATABASE test_db;

drop table mytable;
CREATE TABLE mytable(id SERIAL PRIMARY  KEY,
name VARCHAR(30),
STATUS text,
phone_num VARCHAR(12),
date_created TIMESTAMP,
date_updated TIMESTAMP,
user_created VARCHAR(20),
user_updated VARCHAR(20));

CREATE OR REPLACE FUNCTION logdm()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
begin
	
	if TG_OP = 'INSERT' then 
		new.date_created = CURRENT_TIMESTAMP;
		new.user_created = user;   RETURN NEW;  -- depends!
	ELSIF TG_OP = 'UPDATE' THEN  
		new.date_updated = CURRENT_TIMESTAMP;
		new.user_updated = user;   RETURN NEW;  -- depends!
   RETURN NEW; 
END IF;
	
END;
$$

DROP TRIGGER mytable_insert ON public.mytable;
DROP TRIGGER mytable_update ON public.mytable;
CREATE TRIGGER mytable_insert
    BEFORE insert  ON mytable
    FOR EACH ROW
    EXECUTE PROCEDURE logdm();
CREATE TRIGGER mytable_update
    BEFORE  update ON mytable
    FOR EACH ROW
    EXECUTE PROCEDURE logdm();
   
   
delete from mytable;
select * from mytable;




INSERT INTO mytable(name,STATUS,phone_num)
VALUES('joemarie','regular','0985959905');
update mytable set name = 'changed'
where name = 'joemarie';
select * from mytable;

