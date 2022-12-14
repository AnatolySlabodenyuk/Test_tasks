CREATE TABLE RPLS
(
	R_ID INT,
	R_DATE1 DATE,
	R_DATE2 DATE,
	R_DAYS VARCHAR(30),
	R_FLD7 VARCHAR(30),
	R_FLD13 VARCHAR(30),	
	R_FLD16 VARCHAR(30),
	PRIMARY KEY (R_ID)
);


INSERT INTO RPLS
VALUES 
(31590, '2022-03-29', '2022-10-28', '0234500', 'AUL717', 'ULLA1500', 'ULLI0130'),
(31591, '2022-03-28', '2022-10-27', '1234000', 'AUL213', 'UMMS0940', 'ULPB0130'),
(31592, '2022-03-28', '2022-10-24', '1000000', 'AUL444', 'ULPB0940', 'ULLI0130'),
(31597, '2022-04-02', '2022-10-29', '0000060', 'AUL6530', 'UUYY0900', 'ULLA0130'),
(31594, '2022-08-01', '2022-10-24', '1000000', 'TUP9558', 'ULLI0630', 'ULLW0140'),
(31595, '2022-05-23', '2022-07-27', '1030000', 'TUP957', 'ULLP0710', 'UMMS0140'),
(31599, '2022-08-03', '2022-10-26', '0030000', 'TUP4286', 'ULLW1230', 'UUYY0140');

SELECT * FROM RPLS
WHERE 
	R_FLD7 IN (
		SELECT R_FLD7 FROM RPLS GROUP BY R_FLD7 HAVING COUNT(*) > 1
		)
ORDER BY
	R_FLD7;