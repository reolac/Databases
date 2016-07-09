# T1 Q1
CREATE TABLE IF NOT EXISTS `dbms`.`winner`
(
	`winner_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `winner_name` VARCHAR(255) NOT NULL,
    `changed` TIMESTAMP
);

INSERT INTO `dbms`.`winner` (`winner_name`)
		VALUES ('Danny Bentley'), ('Huw Price');
     
DELETE FROM `dbms`.`winner`;

# T1 Q2

CREATE TABLE IF NOT EXISTS `dbms`.`member`
(
	`member_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `member_name` VARCHAR(255) NOT NULL,
    `status` VARCHAR(50),
    `last_paid` DATE,
    `changed` TIMESTAMP
);

INSERT INTO `dbms`.`member` (`member_name`, `last_paid`)
		VALUES ('Danny Bentley', '2014-05-22'), ('Huw Price', '2015-05-22'), ('Kieran Bold', NULL);
        
UPDATE `dbms`.`member`
SET `status` = 'DUE'
WHERE `last_paid` < CURRENT_DATE(); 
        
# T1 Q3

DELETE FROM `dbms`.`member` WHERE `status` IS NULL;
        
# T1 Q4

CREATE TABLE IF NOT EXISTS `dbms`.`boat`
(
	`boat_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `boat_name` VARCHAR(255) NOT NULL,
    `type` VARCHAR(50) NOT NULL,
    `changed` TIMESTAMP
);

INSERT INTO `dbms`.`boat` (`boat_name`, `type`)
		VALUES ('Yakky Yacht', 'Yacht'), ('Dingiest Dingy', 'Dingy'), ('Skiiii', 'Jet Ski');

UPDATE `dbms`.`boat`
SET `boat_name` = 'No longer Yakky Yacht'
WHERE (`type`) = 'Yacht'; 

# T1 Q5

CREATE TABLE IF NOT EXISTS `dbms`.`molecule` (
	`molecule_id` INT NOT NULL AUTO_INCREMENT,
	`atoms` INT NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`radioactive` BIT NOT NULL,
	`date_discovered` DATE NOT NULL,
	`discovered_by` INT NOT NULL,
	`class` INT,
	PRIMARY KEY (`molecule_id`)
);

INSERT INTO `dbms`.`molecule`(`atoms`, `name`, `radioactive`, `date_discovered`, `discovered_by`, `class`)
	VALUES('13', '2,4,6-Triclorophenol', 0, '1918-04-22', 45621, 743);
    
# T1 Q6

INSERT INTO `dbms`.`molecule`(`atoms`, `name`, `radioactive`, `date_discovered`, `discovered_by`, `class`)
	VALUES('9', 'Hydrogen', 0, '1999-11-15', 21278, 743),
	('15', 'Oxygen', 1, '2011-06-07', 1931, 5898),
    ('1', 'Carbon Dioxide', 0, '0000-01-01', 88123, 1);
    
# T1 Q7

SELECT `molecule_id` FROM `dbms`.`molecule`;

# T1 Q8

INSERT INTO `dbms`.`molecule`(`atoms`, `name`, `radioactive`, `date_discovered`, `discovered_by`, `class`)
SELECT `atoms`, 'Hydrochloride', `radioactive`, `date_discovered`, `discovered_by`, `class`
FROM `dbms`.`molecule`
WHERE `molecule_id` = 1;

# T2 Q9

SELECT `customer`.`name`, COUNT(`line_item`.`line_item_id`) 
FROM `customer`, `invoice`, `line_item` 
WHERE `customer`.`customer_id` = `invoice`.`customer` 
AND `invoice`.`customer` = `line_item`.`invoice_id`;

# T2 Q10

SELECT `supplier`.`name`, `product`.`name`, `supplier`.`last_invoice`, `product`.`last_order_date`
FROM `supplier`, `product`
WHERE `supplier`.`supplier_id` = `product`.`supplied_by`;









