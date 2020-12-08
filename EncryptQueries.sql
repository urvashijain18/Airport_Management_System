CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Airport@1';

SELECT name KeyName, 
    symmetric_key_id KeyID, 
    key_length KeyLength, 
    algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;

CREATE CERTIFICATE Encryption_Certificate WITH SUBJECT = 'Protect my data';
GO

SELECT name CertName, 
    certificate_id CertID, 
    pvt_key_encryption_type_desc EncryptType, 
    issuer_name Issuer
FROM sys.certificates;

CREATE SYMMETRIC KEY SymKey WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE Encryption_Certificate;

SELECT name KeyName, 
    symmetric_key_id KeyID, 
    key_length KeyLength, 
    algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;

ALTER TABLE passenger ADD passport_encrypt varbinary(MAX);
ALTER TABLE employee ADD SSN_encrypt varbinary(MAX);

OPEN SYMMETRIC KEY SymKey
DECRYPTION BY CERTIFICATE Encryption_Certificate;

UPDATE passenger
SET passport_encrypt = EncryptByKey (Key_GUID('SymKey'), passport_number)
FROM passenger;
GO

UPDATE employee
SET SSN_encrypt = EncryptByKey (Key_GUID('SymKey'), SSN)
FROM employee;
GO

CLOSE SYMMETRIC KEY SymKey;
GO

ALTER TABLE passenger DROP COLUMN passport_number;
ALTER TABLE employee DROP COLUMN SSN;

SELECT * from passenger;
SELECT * from employee;

OPEN SYMMETRIC KEY SymKey
DECRYPTION BY CERTIFICATE Encryption_Certificate;

SELECT passport_encrypt AS 'Encrypted data',
CONVERT(varchar, DecryptByKey(passport_encrypt)) AS 'Decrypted Passport number'
FROM passenger;

SELECT SSN_encrypt AS 'Encrypted data',
CONVERT(varchar, DecryptByKey(SSN_encrypt)) AS 'Decrypted SSN number'
FROM employee;

CLOSE SYMMETRIC KEY SymKey;
GO

USE [master]
GO
CREATE LOGIN [SQLUser] WITH PASSWORD=N'sqluser', DEFAULT_DATABASE=[Airport_Management_System], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Airport_Management_System]
GO
CREATE USER [SQLUser] FOR LOGIN [SQLUser]
GO
USE [Airport_Management_System]
GO
ALTER ROLE [db_datareader] ADD MEMBER [SQLUser]
GO
