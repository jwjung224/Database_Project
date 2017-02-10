DROP DATABASE IF EXISTS FAST3_DEALERSHIP;

CREATE SCHEMA IF NOT EXISTS FAST3_DEALERSHIP
  DEFAULT CHARACTER SET utf8;

USE FAST3_DEALERSHIP;

-- In 3NF
-- data complete
CREATE TABLE IF NOT EXISTS DEALERSHIP (
  dealership_id INT         NOT NULL AUTO_INCREMENT,
  name          VARCHAR(50) NOT NULL,
  address_id    INT         NOT NULL,
  manager_id    INT,
  phone_number  CHAR(10)    NOT NULL,
  PRIMARY KEY (dealership_id)
);

-- In 3NF
-- data complete
CREATE TABLE IF NOT EXISTS ADDRESS (
  address_id  INT         NOT NULL AUTO_INCREMENT,
  unit_number INT         NOT NULL,
  street      VARCHAR(50) NOT NULL,
  city        VARCHAR(50) NOT NULL,
  state       CHAR(2)     NOT NULL,
  zip_code    CHAR(5)     NOT NULL,
  PRIMARY KEY (address_id),
  UNIQUE (unit_number, street, city, state, zip_code)
);

-- In 3NF
-- data complete
-- TODO: Update foreign keys ( removed dealership ID from primary key)
CREATE TABLE IF NOT EXISTS VEHICLE_INVENTORY (
  vin           CHAR(17)       NOT NULL,
  dealership_id INT            NOT NULL,
  date_acquired DATE           NOT NULL,
  cost          DECIMAL(10, 2) NOT NULL,
  price         DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (vin)
);

-- In 3NF
-- data complete
CREATE TABLE IF NOT EXISTS VEHICLE (
  vin               CHAR(17)    NOT NULL,
  make              VARCHAR(20) NOT NULL,
  model             VARCHAR(50) NOT NULL,
  type              VARCHAR(20) NOT NULL,
  year_manufactured YEAR        NOT NULL,
  mileage           INT         NOT NULL,
  color             VARCHAR(50) NOT NULL,
  PRIMARY KEY (vin)
);

-- In 3NF
-- data complete
CREATE TABLE IF NOT EXISTS EMPLOYEE (
  employee_id   INT            NOT NULL AUTO_INCREMENT,
  ssn           CHAR(9)        NOT NULL,
  f_name        VARCHAR(20)    NOT NULL,
  m_initial     CHAR(1),
  l_name        VARCHAR(25)    NOT NULL,
  address_id    INT            NOT NULL,
  phone_number  CHAR(10)       NOT NULL,
  salary        DECIMAL(10, 2) NOT NULL,
  birth_date    DATE           NOT NULL,
  hire_date     DATE           NOT NULL,
  dealership_id INT            NOT NULL,
  PRIMARY KEY (employee_id),
  UNIQUE (ssn)
);

-- In 3NF
-- data complete
-- This assumes that a customer can only have one car.
-- Should we change that, It's not very realistic assumption.
CREATE TABLE IF NOT EXISTS CUSTOMER (
  customer_id  INT         NOT NULL AUTO_INCREMENT,
  f_name       VARCHAR(20) NOT NULL,
  m_initial    CHAR(1)     NOT NULL,
  l_name       VARCHAR(25) NOT NULL,
  address_id   INT         NOT NULL,
  phone_number CHAR(10)    NOT NULL,
  vin          CHAR(17),
  PRIMARY KEY (customer_id)
);

-- In 3NF
-- data complete
-- TODO: Correct trigger (type check no longer needed)
CREATE TABLE IF NOT EXISTS VENDOR (
  vendor_id    INT         NOT NULL AUTO_INCREMENT,
  name         VARCHAR(30) NOT NULL,
  address_id   INT         NOT NULL,
  phone_number CHAR(10)    NOT NULL,
  PRIMARY KEY (vendor_id)
);

-- In 3NF (Assumption: Get parts from a specific vender and only that vendor)
-- TODO: Add trgger for type and state
-- data complete
CREATE TABLE IF NOT EXISTS PART (
  part_id           INT            NOT NULL AUTO_INCREMENT,
  description       VARCHAR(50)    NOT NULL,
  type              VARCHAR(20)    NOT NULL,
  cost              DECIMAL(10, 2) NOT NULL,
  vendor_id         INT            NOT NULL,
  PRIMARY KEY (part_id)
);


-- Assumption: different dealerships can charde different prices for the same part
-- In 3NF
-- I moved year_manufactured and state to this table
-- data complete
CREATE TABLE IF NOT EXISTS PART_INVENTORY (
  part_id       INT            NOT NULL,
  dealership_id INT            NOT NULL,
  year_manufactured YEAR           NOT NULL,
  state             VARCHAR(4)     NOT NULL,
  price         DECIMAL(10, 2) NOT NULL,
  quantity      INT            NOT NULL,
  PRIMARY KEY (part_id, dealership_id)
);


-- TODO: add trigger to update part inventory / verify enough parts in stock
-- TODO: type domain {body work, mechanical work, maintinence, etc} -- need to add check in trigger
-- In 3NF
-- data complete
CREATE TABLE IF NOT EXISTS SERVICE (
  service_id    INT            NOT NULL AUTO_INCREMENT,
  description   VARCHAR(512)   NOT NULL,
  stype         VARCHAR(20)    NOT NULL,
  cost          DECIMAL(10, 2) NOT NULL,
  time_estimate DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (service_id)
);

-- TODO: ADD f-keys
-- In 3NF
-- data complete
CREATE TABLE IF NOT EXISTS SERVICE_PARTS (
  service_id INT NOT NULL,
  part_id    INT NOT NULL,
  quantity   INT NOT NULL,
  PRIMARY KEY (service_id, part_id)
);

-- In 3NF
CREATE TABLE IF NOT EXISTS SERVICE_RECORD (
  record          INT            NOT NULL AUTO_INCREMENT,
  service_id      INT            NOT NULL,
  customer_id     INT            NOT NULL,
  vin             CHAR(17)       NOT NULL,
  scheduled_date  DATE           NOT NULL,
  balance         DECIMAL(10, 2) NOT NULL,
  amount_paid     DECIMAL(10, 2) NOT NULL,
  additional_note VARCHAR(512),
  dealership_id   INT            NOT NULL,
  PRIMARY KEY (record)
);


-- in 3NF
-- data complete
CREATE TABLE IF NOT EXISTS SALE (
  refrence_number INT            NOT NULL AUTO_INCREMENT,
  vin             CHAR(17)       NOT NULL,
  sale_price      DECIMAL(10, 2) NOT NULL,
  sale_date       DATE           NOT NULL,
  employee_id     INT            NOT NULL,
  customer_id     INT            NOT NULL,
  PRIMARY KEY (refrence_number)
);


-- FOREIGN KEYS --
-- FK DEALERSHIP -------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE DEALERSHIP ADD CONSTRAINT fkey_dealership_address FOREIGN KEY (address_id) REFERENCES ADDRESS (address_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE DEALERSHIP ADD CONSTRAINT fkey_dealership_manager FOREIGN KEY (manager_id) REFERENCES EMPLOYEE (employee_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- FK VEHICLE_INVENTORY -------------------------------------------------------------------------------------------------------------------------
ALTER TABLE VEHICLE_INVENTORY ADD CONSTRAINT fkey_vehicleInventory_dealership FOREIGN KEY (dealership_id) REFERENCES DEALERSHIP (dealership_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE VEHICLE_INVENTORY ADD CONSTRAINT fkey_vehicleInventory_vin FOREIGN KEY (vin) REFERENCES VEHICLE (vin)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- FK EMPLOYEE -------------------------------------------------------------------------------------------------------------------------
ALTER TABLE EMPLOYEE ADD CONSTRAINT fkey_employee_dealership FOREIGN KEY (dealership_id) REFERENCES DEALERSHIP (dealership_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE EMPLOYEE ADD CONSTRAINT fkey_employee_address FOREIGN KEY (address_id) REFERENCES ADDRESS (address_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- FK CUSTOMER -------------------------------------------------------------------------------------------------------------------------
ALTER TABLE CUSTOMER ADD CONSTRAINT fkey_customer_vin FOREIGN KEY (vin) REFERENCES VEHICLE (vin)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE CUSTOMER ADD CONSTRAINT fkey_customer_address FOREIGN KEY (address_id) REFERENCES ADDRESS (address_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- FK PART -------------------------------------------------------------------------------------------------------------------------
ALTER TABLE PART ADD CONSTRAINT fkey_part_id FOREIGN KEY (vendor_id) REFERENCES VENDOR (vendor_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- FK PART_INVENTORY -------------------------------------------------------------------------------------------------------------------------
ALTER TABLE PART_INVENTORY ADD CONSTRAINT fkey_partInventory_id FOREIGN KEY (part_id) REFERENCES PART (part_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE PART_INVENTORY ADD CONSTRAINT fkey_partInventory_dealership FOREIGN KEY (dealership_id) REFERENCES DEALERSHIP (dealership_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- FK SERVICE -------------------------------------------------------------------------------------------------------------------------
ALTER TABLE SERVICE_PARTS ADD CONSTRAINT fkey_service_part_service FOREIGN KEY (service_id) REFERENCES SERVICE (service_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE SERVICE_PARTS ADD CONSTRAINT fkey_service_part_part FOREIGN KEY (part_id) REFERENCES PART (part_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- FK SESERVICE_RECORDRVICE -------------------------------------------------------------------------------------------------------------------------
ALTER TABLE SERVICE_RECORD ADD CONSTRAINT fkey_serviceRecord_service FOREIGN KEY (service_id) REFERENCES SERVICE (service_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE SERVICE_RECORD ADD CONSTRAINT fkey_serviceRecord_customer FOREIGN KEY (customer_id) REFERENCES CUSTOMER (customer_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE SERVICE_RECORD ADD CONSTRAINT fkey_serviceRecord_vehicle FOREIGN KEY (vin) REFERENCES VEHICLE (vin)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- FK SALES -------------------------------------------------------------------------------------------------------------------------
ALTER TABLE SALE ADD CONSTRAINT fkey_sale_vehicle FOREIGN KEY (vin) REFERENCES VEHICLE (vin)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE SALE ADD CONSTRAINT fkey_sale_employee FOREIGN KEY (employee_id) REFERENCES EMPLOYEE (employee_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE SALE ADD CONSTRAINT fkey_sale_customer FOREIGN KEY (customer_id) REFERENCES CUSTOMER (customer_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

-- END FK --

-- Triggers
-- Do we need to verify foreign keys? I added triggers, but I'm not sure if we need ot have them
DELIMITER $$

-- Dealership triggers
CREATE TRIGGER trigger_dealership BEFORE INSERT ON DEALERSHIP
FOR EACH ROW
  BEGIN
    /*Check address*/
    IF NEW.address_id NOT IN (SELECT address_id
                              FROM ADDRESS)
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid Address';
    END IF;
    /*check manager ID -- assumption: dealership must have a manager*/
    IF NEW.manager_id IS NOT NULL AND NEW.manager_id NOT IN (SELECT employee_id
                                                             FROM EMPLOYEE)
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid Manager';
    END IF;
  END $$

-- Address Trigger
CREATE TRIGGER trigger_address BEFORE INSERT ON ADDRESS
FOR EACH ROW
  BEGIN
    /*Check if state is valid*/
    IF NEW.State NOT IN
       ('AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL',
              'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA',
                    'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 'MT', 'NC', 'ND', 'NE',
                          'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'RI',
                                'SC', 'SD', 'TN', 'TX', 'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY')
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid state';
    END IF;
  END $$

-- Vehicle Inventory trigger
CREATE TRIGGER trigger_vehicle_inventory BEFORE INSERT ON VEHICLE_INVENTORY
FOR EACH ROW
  BEGIN
    /*check if dealership is valid*/
    IF NEW.dealership_id NOT IN (SELECT dealership_id
                                 FROM DEALERSHIP)
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid dealership';
    END IF;
    /*check if vin exists in inventory*/
    /*Vehicle needs to be added to vehicle table before being added to inventory*/
    IF NEW.vin NOT IN (SELECT vin
                       FROM VEHICLE)
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid VIN';
    END IF;
  END $$

-- Vehicle trigger
CREATE TRIGGER trigger_vehicle BEFORE INSERT ON VEHICLE
FOR EACH ROW
  BEGIN
    /*Should we verify if vin conforms to ISO 3779?
     It seems like it might take some doing*/

    /*Verify if vehicle type is valid*/
    IF NEW.type NOT IN ('Compact', 'Luxury', 'SUV', 'Truck', 'Van')
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid vehicle type';
    END IF;
    /*verify year is in valid range*/
    IF NEW.year_manufactured > YEAR(CURDATE()) OR NEW.year_manufactured < '1900'
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid year manufactured';
    END IF;
  END $$

-- Employee trigger
CREATE TRIGGER trigger_employee BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
  BEGIN
    /*Check address*/
    IF NEW.address_id NOT IN (SELECT address_id
                              FROM ADDRESS)
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid Address';
    END IF;
    /*verify age -- constraint Must be at least 18*/
    IF floor(DATEDIFF(CURDATE(), NEW.birth_date) / 365) < 18
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid employee age';
    END IF;
    /*verify hire date*/
    IF NEW.hire_date > CURDATE()
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid hire date';
    END IF;
    /*check if dealership is valid*/
    IF NEW.dealership_id NOT IN (SELECT dealership_id
                                 FROM DEALERSHIP)
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid dealership';
    END IF;
  END $$

-- customer trigger
CREATE TRIGGER trigger_customer BEFORE INSERT ON CUSTOMER
FOR EACH ROW
  BEGIN
    /*Check address*/
    IF NEW.address_id NOT IN (SELECT address_id
                              FROM ADDRESS)
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid Address';
    END IF;
  END $$

-- vendor trigger
CREATE TRIGGER trigger_vendor BEFORE INSERT ON VENDOR
FOR EACH ROW
  BEGIN
    /*Check address*/
    IF NEW.address_id NOT IN (SELECT address_id
                              FROM ADDRESS)
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Invalid Address';
    END IF;

  END $$

DELIMITER ;
