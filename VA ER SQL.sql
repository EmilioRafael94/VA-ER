-- Drop existing foreign key constraint on invoice table
ALTER TABLE invoice DROP FOREIGN KEY invoice_ibfk_1;

-- Add a new foreign key constraint to invoice table with ON DELETE CASCADE
ALTER TABLE invoice ADD CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES client(id) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS client (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create table for services
CREATE TABLE IF NOT EXISTS service (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    rate DOUBLE NOT NULL
);

-- Create table for invoices
CREATE TABLE IF NOT EXISTS invoice (
    id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_number INT NOT NULL,
    client_id INT,
    total_amount DOUBLE,
    date DATE,
    FOREIGN KEY (client_id) REFERENCES client(id) ON DELETE CASCADE
);

-- Create table for invoice details
CREATE TABLE IF NOT EXISTS invoice_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT,
    service_id INT,
    hours DOUBLE,
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);