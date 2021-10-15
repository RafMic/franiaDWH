ALTER TABLE frania200507
ALTER COLUMN ID INT NOT NULL

ALTER TABLE frania200507
ALTER COLUMN ilosc INT

ALTER TABLE frania200507
ALTER COLUMN cena_hurt MONEY

UPDATE frania200507
SET obrot = REPLACE(obrot, ',', '.')

ALTER TABLE frania200507
ALTER COLUMN obrot MONEY
GO

ALTER TABLE frania200507
ADD CONSTRAINT pk_frania PRIMARY KEY (ID)

UPDATE frania200507  
SET region =  CASE  
	WHEN region = 'Others' THEN 'Pozostale' 
	WHEN region = 'Południe' THEN 'Poludnie' 
	WHEN region = 'Zachód' THEN 'Zachod' 
	ELSE region
	END 
WHERE region IN ('Others', 'Południe', 'Zachód')