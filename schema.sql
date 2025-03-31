CREATE TABLE Warehouse (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    PIC VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL,
    reviewer_status BOOLEAN NOT NULL
);

CREATE TABLE Vendor (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    nation VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    PIC VARCHAR(255) NOT NULL,
    created_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL
);

CREATE TABLE Unit (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    information TEXT
);

CREATE TABLE ItemCategory (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50) NOT NULL
);

CREATE TABLE Item (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    category_id INT REFERENCES ItemCategory(id),
    unit_id INT REFERENCES Unit(id),
    price DECIMAL(10,2),
    minimum_stock INT,
    reorder_point INT,
    unique_code VARCHAR(255),
    status VARCHAR(50)
);

CREATE TABLE Inventory (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id),
    warehouse_id INT REFERENCES Warehouse(id),
    quantity INT NOT NULL,
    last_updated DATE NOT NULL
);

CREATE TABLE Sales (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id),
    quantity_sold INT NOT NULL,
    sale_date DATE NOT NULL
);
