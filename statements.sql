CREATE DATABASE project_equipment;
USE project_equipment;

-- Tables
CREATE TABLE categories
(
    category_ID INT AUTO_INCREMENT NOT NULL,
    catagory_name VARCHAR(255),
    catagory_description VARCHAR(255),
    category_type VARCHAR(255),

    PRIMARY KEY (category_ID)
);

CREATE TABLE type
(
    type_ID INT AUTO_INCREMENT NOT NULL,
    type_name VARCHAR(255),

    PRIMARY KEY (type_ID)
);

 
CREATE TABLE contacts
(
    contact_ID INT AUTO_INCREMENT NOT NULL,
    contact_email VARCHAR(255) UNIQUE,
    type_ID INT,

    PRIMARY KEY (contact_ID),
    FOREIGN KEY (type_ID) REFERENCES type(type_ID)
);

CREATE TABLE projects
(
    project_ID INT AUTO_INCREMENT NOT NULL,
    project_name VARCHAR(255),
    project_description VARCHAR(255),
    project_start_date DATE,
    project_end_date DATE,
    project_owner_ID INT,
    contact_ID INT,

    PRIMARY KEY (project_ID),
    FOREIGN KEY (contact_ID) REFERENCES contacts(contact_ID)
);

CREATE TABLE project_HR
(
    project_HR_ID INT AUTO_INCREMENT NOT NULL,
    project_ID INT,
    project_testimonial VARCHAR(255),

    PRIMARY KEY (project_HR_ID),
    FOREIGN KEY (project_ID) REFERENCES projects(project_ID)
);

CREATE TABLE contact_cat
(
    contact_cat_ID INT AUTO_INCREMENT NOT NULL,
    category_ID INT,
    contact_ID INT,
    project_HR_ID INT,

    PRIMARY KEY (contact_cat_ID),
    FOREIGN KEY (category_ID) REFERENCES categories(category_ID),
    FOREIGN KEY (contact_ID) REFERENCES contacts(contact_ID),
    FOREIGN KEY (project_HR_ID) REFERENCES project_HR(project_HR_ID)
);

CREATE TABLE status
(
    status_ID INT AUTO_INCREMENT NOT NULL,
    status_name VARCHAR(255),
    status_notes VARCHAR(255),

    PRIMARY KEY (status_ID)
);

CREATE TABLE equipment
(
    equipment_ID INT AUTO_INCREMENT NOT NULL,
    equipment_name VARCHAR(255),
    equipment_description VARCHAR(255),
    equipment_status_ID INT,
    status_ID INT,

    PRIMARY KEY (equipment_ID),
    FOREIGN KEY (status_ID) REFERENCES status(status_ID)
);

CREATE TABLE hire_rates
(
    hire_rate_ID INT AUTO_INCREMENT NOT NULL,
    hire_rate_rate INT,
    hire_rate_period DATE,

    PRIMARY KEY (hire_rate_ID)
);

CREATE TABLE equip_hire_rates
(
    equip_hire_rate_ID INT AUTO_INCREMENT NOT NULL,
    equipment_ID INT,
    hire_rate_ID INT,

    PRIMARY KEY (equip_hire_rate_ID),
    FOREIGN KEY (equipment_ID) REFERENCES equipment(equipment_ID),
    FOREIGN KEY (hire_rate_ID) REFERENCES hire_rates(hire_rate_ID)
);

CREATE TABLE equip_cat
(
    equip_cat_ID INT AUTO_INCREMENT NOT NULL,
    category_ID INT,
    equipment_ID INT,

    PRIMARY KEY (equip_cat_ID),
    FOREIGN KEY (category_ID) REFERENCES categories(category_ID),
    FOREIGN KEY (equipment_ID) REFERENCES equipment(equipment_ID)
);

CREATE TABLE project_equipment
(
    project_equip_ID INT AUTO_INCREMENT NOT NULL,
    project_ID INT,
    equipment_ID INT,
    proj_equip_booking_rate INT,

    PRIMARY KEY (project_equip_ID),
    FOREIGN KEY (project_ID) REFERENCES projects(project_ID),
    FOREIGN KEY (equipment_ID) REFERENCES equipment(equipment_ID)
);

CREATE TABLE calendar
(
    calander_ID INT NOT NULL,
    calander_date DATE,
    project_HR_ID INT,
    project_equip_ID INT,
    invoice_ID INT,
    calander_date_confirmed DATE,
    
    PRIMARY KEY (calander_ID),
    FOREIGN KEY (project_HR_ID) REFERENCES project_HR(project_HR_ID),
    FOREIGN KEY (project_equip_ID) REFERENCES project_equipment(project_equip_ID)
);