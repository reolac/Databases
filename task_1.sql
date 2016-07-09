# Q1
DROP TABLE `drinks`;
DROP TABLE `stage_show`;
DROP TABLE `theatre`;

CREATE TABLE `drinks`        
(
`name` VARCHAR(50) NOT NULL,
`creation time` TIME NOT NULL,
`creation instructions` TEXT(1000000) NOT NULL
);

INSERT INTO `drinks`
VALUES ('Long_Island_Ice_Tea', '00:03:00', '1 part vodka
1 part tequila
1 part rum
1 part gin
1 part triple sec
1 1/2 parts sweet and sour mix
1 splash Coca-Cola®

Mix ingredients together over ice in a glass. Pour into a shaker and give one brisk shake. Pour back into the glass and make sure there is a touch of fizz at the top. Garnish with lemon.');

# Q2
CREATE TABLE `theatre`        
(
`theatre_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(255) NOT NULL UNIQUE,
`city` VARCHAR(50) NOT NULL UNIQUE,
`capacity` INT,
`remodeled` BIT NOT NULL
);

CREATE TABLE `stage_show`        
(
`stage_show_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(255) NOT NULL,
`theatre` INT NOT NULL,
`date_opened` DATE NOT NULL,
`date_closed` DATE,
`average_rating` DECIMAL(3,1),
FOREIGN KEY (`theatre`) REFERENCES `theatre`(`theatre_id`)
UNIQUE INDEX `theatreFK` (`theatre` ASC),
);