# Q1 A
CREATE TABLE `toy`        
(
`toy_id` INT AUTO_INCREMENT,
`owned_by` VARCHAR(50) NOT NULL,
`name` VARCHAR(50) NOT NULL,
`price` DECIMAL(5,2),
PRIMARY KEY (`toy_id`)
);
# B
CREATE TABLE `plant`
(
`plant_id` INT AUTO_INCREMENT,
`species` VARCHAR(50) NOT NULL,
`location` VARCHAR(50) NOT NULL,
`colour` VARCHAR(5) NOT NULL,
PRIMARY KEY (`plant_id`)
);
# C
CREATE TABLE `tool`
(
`tool_id` INT AUTO_INCREMENT,
`tool_type` VARCHAR(50) NOT NULL,
`name` VARCHAR(50) NOT NULL,
`price` DECIMAL(5,2) NOT NULL,
`size` DECIMAL(4,2),
`colour` VARCHAR(50),
PRIMARY KEY (`tool_id`)
);
# Q2
DESCRIBE `plant`;
DESCRIBE `tool`;

# Q3
ALTER TABLE `tool`
	CHANGE `name` `product_name` VARCHAR(50);										;	

# Q4 A
CREATE TABLE `animal`        
(
`animal_id` INT,
`species` VARCHAR(45) NOT NULL,
`keeper` VARCHAR(45) NOT NULL,
`location` VARCHAR(45) NOT NULL,
`favourite_food` VARCHAR(45),
PRIMARY KEY (`animal_id`)
);
# B
CREATE TABLE `part`        
(
`part_id` INT,
`bin_location` INT,
`keeper` VARCHAR(45) NOT NULL,
`location` VARCHAR(45) NOT NULL,
`favourite_food` VARCHAR(45),
PRIMARY KEY (`animal_id`)
);
