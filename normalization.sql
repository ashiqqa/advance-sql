
--There are 6 way to normalize data

----1NF
--The data in each column should be atomic, no multiple value separated by comma.
--The table does'nt containg any repeating column groups
--Identify each record using UNIQUE PRIMARY KEY

----2NF
--The table should be meets all the condition of 1NF
--Move redundant data to a separate table
--Create relationship table between these tables using FOREIGN KEYs

----3NF
--The table should meets all the condition of 1NF and 2NF
--Does not contain columns that are not fully dependent upon the PRIMARY KEY                                 