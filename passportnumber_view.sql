OPEN SYMMETRIC KEY SymKey
DECRYPTION BY CERTIFICATE Encryption_Certificate;

CREATE or ALTER VIEW encrypted_decrypted_passport AS
SELECT passport_encrypt AS 'Encrypted data',
CONVERT(varchar, DecryptByKey(passport_encrypt)) AS 'Decrypted Passport number',
passenger_id, first_name + ' ' + last_name AS 'Passenger name'
FROM passenger;

Select * from encrypted_decrypted_passport;