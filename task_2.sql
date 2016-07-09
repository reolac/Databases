SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE `product`;
DROP TABLE `customers`;
DROP TABLE `supplier`;
DROP TABLE `invoice`;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `supplier` (
  `supplier_id` INT NOT NULL,
  `supplier_name` VARCHAR(45) NOT NULL,
  `supplier_telephoneNo` INT NOT NULL,
  `supplier_loc` VARCHAR(45) NOT NULL,
  `changed` TIMESTAMP NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE INDEX `supplier_name_UNIQUE` (`supplier_name` ASC),
  UNIQUE INDEX `supplier_telephoneNo_UNIQUE` (`supplier_telephoneNo` ASC),
  UNIQUE INDEX `supplier_id_UNIQUE` (`supplier_id` ASC));

CREATE TABLE `product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `product_price` DECIMAL(5,2) NOT NULL,
  `product_count` INT NOT NULL,
  `changed` TIMESTAMP NULL,
  `supplier_supplier_id` INT NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC),
  UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC),
  UNIQUE INDEX `supplier_supplier_id_UNIQUE` (`supplier_supplier_id` ASC),
  INDEX `fk_product_supplier_idx` (`supplier_supplier_id` ASC),
  CONSTRAINT `fk_product_supplier`
    FOREIGN KEY (`supplier_supplier_id`)
    REFERENCES `supplier` (`supplier_id`)
);

CREATE TABLE `customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_telephoneNo` INT NOT NULL,
  `customer_email` VARCHAR(45) NULL,
  `changed` TIMESTAMP NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC),
  UNIQUE INDEX `customer_telephoneNo_UNIQUE` (`customer_telephoneNo` ASC),
  UNIQUE INDEX `customer_email_UNIQUE` (`customer_email` ASC));

CREATE TABLE `invoice` (
  `invoice_id` INT NOT NULL AUTO_INCREMENT,
  `invoice_date` DATETIME NOT NULL,
  `invoice_amount` DECIMAL(5,3) NOT NULL,
  `changed` TIMESTAMP NULL,
  `product_product_id` INT NOT NULL,
  `customers_customer_id` INT NOT NULL,
  PRIMARY KEY (`invoice_id`),
  UNIQUE INDEX `invoice_id_UNIQUE` (`invoice_id` ASC),
  INDEX `fk_invoice_product1_idx` (`product_product_id` ASC),
  INDEX `fk_invoice_customers1_idx` (`customers_customer_id` ASC),
  CONSTRAINT `fk_invoice_product1`
    FOREIGN KEY (`product_product_id`)
    REFERENCES `product` (`product_id`),
  CONSTRAINT `fk_invoice_customers1`
    FOREIGN KEY (`customers_customer_id`)
    REFERENCES `customers` (`customer_id`)
    );