
INSERT INTO Accounts (Account_ID, Customer_ID, Account_Type, Balance, Account_Opening_Date)
VALUES (1, 10, 'Savings', 1000, DATE '2024-05-20');

INSERT INTO Accounts (Account_ID, Customer_ID, Account_Type, Balance, Account_Opening_Date)
VALUES (2, 20, 'Checking', 2000, DATE '2024-05-15');

INSERT INTO Accounts (Account_ID, Customer_ID, Account_Type, Balance, Account_Opening_Date)
VALUES (3, 30, 'Checking', 2555, DATE '2024-05-16');

INSERT INTO Accounts (Account_ID, Customer_ID, Account_Type, Balance, Account_Opening_Date)
VALUES (4, 40, 'Checking', 2040, DATE '2024-05-19');
INSERT INTO Accounts (Account_ID, Customer_ID, Account_Type, Balance, Account_Opening_Date)
VALUES (5, 50, 'Savings', 2900, DATE '2024-05-18');
INSERT INTO Accounts (Account_ID, Customer_ID, Account_Type, Balance, Account_Opening_Date)
VALUES (6, 60, 'Checking', 9999, DATE '2024-05-12');
INSERT INTO Accounts (Account_ID, Customer_ID, Account_Type, Balance, Account_Opening_Date)
VALUES (7, 70, 'Savings', 1542, DATE '2024-05-07');
INSERT INTO Accounts (Account_ID, Customer_ID, Account_Type, Balance, Account_Opening_Date)
VALUES (8, 80, 'Checking', 8521, DATE '2024-05-06');
INSERT INTO Accounts (Account_ID, Customer_ID, Account_Type, Balance, Account_Opening_Date)
VALUES (9, 90, 'Savings', 4523, DATE '2024-05-05');
INSERT INTO Accounts (Account_ID, Customer_ID, Account_Type, Balance, Account_Opening_Date)
VALUES (10, 100, 'Checking', 4658, DATE '2024-05-01');


INSERT INTO Transactions (Transaction_ID, Amount, Account_ID, Transaction_Date)
VALUES (101, 500, 1, DATE '2024-05-18');

INSERT INTO Transactions (Transaction_ID, Amount, Account_ID, Transaction_Date)
VALUES (102, 410, 2, DATE '2024-05-18');

INSERT INTO Transactions (Transaction_ID, Amount, Account_ID, Transaction_Date)
VALUES (103, 487, 3, DATE '2024-05-18');

INSERT INTO Transactions (Transaction_ID, Amount, Account_ID, Transaction_Date)
VALUES (104, 250, 4, DATE '2024-05-18');
INSERT INTO Transactions (Transaction_ID, Amount, Account_ID, Transaction_Date)
VALUES (105, 452, 5, DATE '2024-05-18');

INSERT INTO Transactions (Transaction_ID, Amount, Account_ID, Transaction_Date)
VALUES (106, 250, 6, DATE '2024-05-18');
INSERT INTO Transactions (Transaction_ID, Amount, Account_ID, Transaction_Date)
VALUES (107, 553, 7, DATE '2024-05-18');

INSERT INTO Transactions (Transaction_ID, Amount, Account_ID, Transaction_Date)
VALUES (108, 255, 8, DATE '2024-05-18');
INSERT INTO Transactions (Transaction_ID, Amount, Account_ID, Transaction_Date)
VALUES (109, 550, 9, DATE '2024-05-18');

INSERT INTO Transactions (Transaction_ID, Amount, Account_ID, Transaction_Date)
VALUES (110, 111, 10, DATE '2024-05-18');



INSERT INTO Loans (Loan_ID, Loan_Amount, Interest_Rate, Start_Date, End_Date, Account_ID)
VALUES (201, 10000, 7, DATE '2023-05-20', DATE '2024-05-20', 1);

INSERT INTO Loans (Loan_ID, Loan_Amount, Interest_Rate, Start_Date, End_Date, Account_ID)
VALUES (202, 5000, 8, DATE '2022-05-20', DATE '2023-05-20', 2);

INSERT INTO Loans (Loan_ID, Loan_Amount, Interest_Rate, Start_Date, End_Date, Account_ID)
VALUES (203, 10000, 7, DATE '2023-05-20', DATE '2024-05-20', 3);

INSERT INTO Loans (Loan_ID, Loan_Amount, Interest_Rate, Start_Date, End_Date, Account_ID)
VALUES (204, 5000, 8, DATE '2022-05-20', DATE '2023-05-20', 4);

INSERT INTO Loans (Loan_ID, Loan_Amount, Interest_Rate, Start_Date, End_Date, Account_ID)
VALUES (205, 10000, 7, DATE '2023-05-20', DATE '2024-05-20', 5);

INSERT INTO Loans (Loan_ID, Loan_Amount, Interest_Rate, Start_Date, End_Date, Account_ID)
VALUES (206, 5000, 8, DATE '2022-05-20', DATE '2023-05-20', 6);

INSERT INTO Loans (Loan_ID, Loan_Amount, Interest_Rate, Start_Date, End_Date, Account_ID)
VALUES (207, 10000, 7, DATE '2023-05-20', DATE '2024-05-20', 7);

INSERT INTO Loans (Loan_ID, Loan_Amount, Interest_Rate, Start_Date, End_Date, Account_ID)
VALUES (208, 5000, 8, DATE '2022-05-20', DATE '2023-05-20', 8);

INSERT INTO Loans (Loan_ID, Loan_Amount, Interest_Rate, Start_Date, End_Date, Account_ID)
VALUES (209, 10000, 7, DATE '2023-05-20', DATE '2024-05-20', 9);

INSERT INTO Loans (Loan_ID, Loan_Amount, Interest_Rate, Start_Date, End_Date, Account_ID)
VALUES (210, 5000, 8, DATE '2022-05-20', DATE '2023-05-20', 10);



INSERT INTO Credit_Cards (Card_ID, Card_Number, Card_Type, Expiration_Date, Credit_Limit, Account_ID)
VALUES (301, 123456789012, 'Visa', DATE '2027-05-20', 15000, 1);

INSERT INTO Credit_Cards (Card_ID, Card_Number, Card_Type, Expiration_Date, Credit_Limit, Account_ID)
VALUES (302, 987654321012, 'Mastercard', DATE '2026-05-20', 10000, 2);

INSERT INTO Credit_Cards (Card_ID, Card_Number, Card_Type, Expiration_Date, Credit_Limit, Account_ID)
VALUES (303, 111122223333, 'Visa', DATE '2028-06-30', 12000, 3);

INSERT INTO Credit_Cards (Card_ID, Card_Number, Card_Type, Expiration_Date, Credit_Limit, Account_ID)
VALUES (304, 444455556666, 'Mastercard', DATE '2025-04-15', 8000, 4);

INSERT INTO Credit_Cards (Card_ID, Card_Number, Card_Type, Expiration_Date, Credit_Limit, Account_ID)
VALUES (305, 777788889999, 'Visa', DATE '2027-08-22', 9000, 5);

INSERT INTO Credit_Cards (Card_ID, Card_Number, Card_Type, Expiration_Date, Credit_Limit, Account_ID)
VALUES (306, 123443215678, 'Mastercard', DATE '2026-12-31', 11000, 6);

INSERT INTO Credit_Cards (Card_ID, Card_Number, Card_Type, Expiration_Date, Credit_Limit, Account_ID)
VALUES (307, 876543219876, 'Visa', DATE '2029-01-01', 14000, 7);

INSERT INTO Credit_Cards (Card_ID, Card_Number, Card_Type, Expiration_Date, Credit_Limit, Account_ID)
VALUES (308, 112233445566, 'Mastercard', DATE '2026-07-20', 13000, 8);

INSERT INTO Credit_Cards (Card_ID, Card_Number, Card_Type, Expiration_Date, Credit_Limit, Account_ID)
VALUES (309, 998877665544, 'Visa', DATE '2027-11-25', 16000, 9);

INSERT INTO Credit_Cards (Card_ID, Card_Number, Card_Type, Expiration_Date, Credit_Limit, Account_ID)
VALUES (310, 334455667788, 'Mastercard', DATE '2025-05-30', 7000, 10);


INSERT INTO Checks (Check_ID, Check_Number, Amount, Issue_Date, Clearing_Date, Account_ID)
VALUES (401, 98765, 200, DATE '2024-05-18', DATE '2024-05-21', 1);

INSERT INTO Checks (Check_ID, Check_Number, Amount, Issue_Date, Clearing_Date, Account_ID)
VALUES (402, 12345, 150, DATE '2024-05-17', DATE '2024-05-20', 2);

INSERT INTO Checks (Check_ID, Check_Number, Amount, Issue_Date, Clearing_Date, Account_ID)
VALUES (403, 67890, 250, DATE '2024-05-19', DATE '2024-05-22', 3);

INSERT INTO Checks (Check_ID, Check_Number, Amount, Issue_Date, Clearing_Date, Account_ID)
VALUES (404, 23456, 300, DATE '2024-05-20', DATE '2024-05-23', 4);

INSERT INTO Checks (Check_ID, Check_Number, Amount, Issue_Date, Clearing_Date, Account_ID)
VALUES (405, 34567, 450, DATE '2024-05-21', DATE '2024-05-24', 5);

INSERT INTO Checks (Check_ID, Check_Number, Amount, Issue_Date, Clearing_Date, Account_ID)
VALUES (406, 45678, 500, DATE '2024-05-22', DATE '2024-05-25', 6);

INSERT INTO Checks (Check_ID, Check_Number, Amount, Issue_Date, Clearing_Date, Account_ID)
VALUES (407, 56789, 550, DATE '2024-05-23', DATE '2024-05-26', 7);

INSERT INTO Checks (Check_ID, Check_Number, Amount, Issue_Date, Clearing_Date, Account_ID)
VALUES (408, 67891, 600, DATE '2024-05-24', DATE '2024-05-27', 8);

INSERT INTO Checks (Check_ID, Check_Number, Amount, Issue_Date, Clearing_Date, Account_ID)
VALUES (409, 78912, 650, DATE '2024-05-25', DATE '2024-05-28', 9);

INSERT INTO Checks (Check_ID, Check_Number, Amount, Issue_Date, Clearing_Date, Account_ID)
VALUES (410, 89012, 700, DATE '2024-05-26', DATE '2024-05-29', 10);


INSERT INTO Deposits (DepositID, Deposit_Amount, Deposit_Date, Maturity_Date, Interest_Rate, Account_ID)
VALUES (501, 3000, DATE '2024-05-15', DATE '2025-05-20', 3, 1);

INSERT INTO Deposits (DepositID, Deposit_Amount, Deposit_Date, Maturity_Date, Interest_Rate, Account_ID)
VALUES (502, 2000, DATE '2024-05-10', DATE '2025-05-10', 

INSERT INTO Deposits (DepositID, Deposit_Amount, Deposit_Date, Maturity_Date, Interest_Rate, Account_ID)
VALUES (503, 3500, DATE '2024-05-16', DATE '2025-05-21', 3.5, 3);

INSERT INTO Deposits (DepositID, Deposit_Amount, Deposit_Date, Maturity_Date, Interest_Rate, Account_ID)
VALUES (504, 4000, DATE '2024-05-17', DATE '2025-05-22', 3.7, 4);

INSERT INTO Deposits (DepositID, Deposit_Amount, Deposit_Date, Maturity_Date, Interest_Rate, Account_ID)
VALUES (505, 4500, DATE '2024-05-18', DATE '2025-05-23', 3.9, 5);

INSERT INTO Deposits (DepositID, Deposit_Amount, Deposit_Date, Maturity_Date, Interest_Rate, Account_ID)
VALUES (506, 5000, DATE '2024-05-19', DATE '2025-05-24', 4.0, 6);

INSERT INTO Deposits (DepositID, Deposit_Amount, Deposit_Date, Maturity_Date, Interest_Rate, Account_ID)
VALUES (507, 5500, DATE '2024-05-20', DATE '2025-05-25', 4.2, 7);

INSERT INTO Deposits (DepositID, Deposit_Amount, Deposit_Date, Maturity_Date, Interest_Rate, Account_ID)
VALUES (508, 6000, DATE '2024-05-21', DATE '2025-05-26', 4.3, 8);

INSERT INTO Deposits (DepositID, Deposit_Amount, Deposit_Date, Maturity_Date, Interest_Rate, Account_ID)
VALUES (509, 6500, DATE '2024-05-22', DATE '2025-05-27', 4.5, 9);

INSERT INTO Deposits (DepositID, Deposit_Amount, Deposit_Date, Maturity_Date, Interest_Rate, Account_ID)
VALUES (510, 7000, DATE '2024-05-23', DATE '2025-05-28', 4.7, 10);
