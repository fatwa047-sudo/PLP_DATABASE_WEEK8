-- Week 8 Assignment: MySQL Database Backup and Restore
-- Database: sales

-- =================================================================
-- QUESTION 1: Creating a Complete Database Backup
-- Task: Create a complete backup of the sales database
-- =================================================================

-- The mysqldump command to create a complete backup:
-- mysqldump -u root -p sales > sales_backup.sql

-- Explanation:
-- -u root : Uses root as the MySQL username as required
-- -p : Prompts for the database password for security
-- sales : The name of the database to backup
-- > sales_backup.sql : Saves the backup output into sales_backup.sql file
-- This command creates a full logical backup with both structure (CREATE TABLE)
-- and data (INSERT statements).

-- Why regular backups are important:
-- Regular backups protect against data loss from hardware failure,
-- accidental deletion, corruption, or cyber attacks. They enable disaster
-- recovery, allow point-in-time restore, and are essential before major
-- changes or server migrations.

-- =================================================================
-- QUESTION 2: Backing Up All Databases
-- Task: Complete backup of every database on the server before migration
-- =================================================================

-- The mysqldump command to back up all databases:
-- mysqldump -u root -p --all-databases > all_databases_backup.sql

-- Explanation:
-- --all-databases : The appropriate option to export every database on the server
-- -u root : Uses root as the MySQL username
-- -p : Prompts for password
-- > all_databases_backup.sql : Saves all databases into one file
-- This is required for planned server migration to ensure no database is left behind
-- and the entire MySQL instance can be recreated on the new server.

-- =================================================================
-- QUESTION 3: Generating Data-Only Backup
-- Task: Create a data-only backup (common Question 3 for Week 8)
-- =================================================================

-- The mysqldump command for data-only backup:
-- mysqldump -u root -p --no-create-info sales > sales_data_only.sql

-- Explanation:
-- --no-create-info : Option that skips CREATE TABLE statements, backs up data only
-- This generates only INSERT statements
-- Useful when the table structure already exists on the destination and you
-- only need to migrate or restore the data without recreating tables.

-- How to restore backups (for testing):
-- mysql -u root -p sales < sales_backup.sql
-- mysql -u root -p < all_databases_backup.sql
-- mysql -u root -p sales < sales_data_only.sql
