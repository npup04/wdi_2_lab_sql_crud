-- In case there is already a bank_homework database, drop it
DROP DATABASE IF EXISTS bank_homework;

-- Create a bank_homework database
CREATE DATABASE bank_homework;

-- Connect to the bank_homework databases
\c bank_homework

-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes
CREATE TABLE payments (
  id serial PRIMARY KEY,
  created_at DATE,
  amount NUMERIC(3,2),
  payer_name TEXT,
  recipient_name TEXT,
  description TEXT
);

-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made
ALTER TABLE payments ADD zipcode NUMERIC;

-- Insert 5 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.
INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode)
  VALUES ('2014-01-22', 9.99, 'Nicole Pupillo', 'David Fisher', 'deposit', 02169);

INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode)
  VALUES ('2014-02-22', 8.99, 'Fred Pupillo', 'Mark Fisher', 'deposit', 02678);

INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode)
  VALUES ('2014-03-22', 7.99, 'Bart Pupillo', 'Steve Fisher', 'deposit', 03567);

INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode)
  VALUES ('2014-04-22', 6.99, 'Bart Simpson', 'Steve O', 'withdrawal', 04948);

INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode)
  VALUES ('2014-06-22', 0.10, 'Marge Simpson', 'Sherlock Holmes', 'withdrawal', 99999);

INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode)
  VALUES ('2014-07-22', 1.50, 'Maggie Simpson', 'Winston Churchill', '', 88653);

INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode)
  VALUES ('2014-08-22', 2.50, 'Santas Little Helper', 'Mother Theresa', '', 43612);

-- You receive notice that the payment with id of 4 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments SET amount = 1.00 WHERE id = 4;

-- Delete all payments with an amount under $2
DELETE FROM payments WHERE amount < 0.50;

-- Select all entries from the payments table
SELECT * from payments;

-- In a single query, output all payments ordered from the largest to the smallest
SELECT * from payments ORDER BY amount DESC;

-- In a single query, output the names of all distinct recipients
SELECT recipient_name from payments;

-- In a single query, select all payments created in the past week
SELECT * from payments where created_at < current_date;

-- In a single query, select all payments with a blank description
SELECT * from payments where description = '';

-- In a single query, select all payments matching the name of one of the payers (choose any single one)
SELECT * from payments where payer_name LIKE '%Helper%';
