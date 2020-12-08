OPEN SYMMETRIC KEY SymKey
DECRYPTION BY CERTIFICATE Encryption_Certificate;

CREATE or ALTER VIEW encrypted_decrypted_SSN AS
SELECT SSN_encrypt AS 'Encrypted SSN',
CONVERT(varchar, DecryptByKey(SSN_encrypt)) AS 'Decrypted SSN',
employee_id, first_name + ' ' + last_name AS 'Employee Name'
FROM employee;

Select * from encrypted_decrypted_SSN;

