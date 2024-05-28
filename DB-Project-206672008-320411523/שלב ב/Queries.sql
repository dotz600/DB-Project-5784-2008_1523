
SELECT Customer_ID, COUNT(Account_ID) AS Num_Accounts, AVG(Balance) AS Avg_Balance
FROM Accounts
GROUP BY Customer_ID
ORDER BY Num_Accounts DESC;



SELECT Account_ID, Account_Type, Balance
FROM Accounts
WHERE Account_Opening_Date < TO_DATE('2024-05-20', 'YYYY-MM-DD')
AND Account_ID NOT IN (
    SELECT DISTINCT Account_ID FROM Transactions);
    
    
select A.account_Id, 
       max(D.Deposit_Amount) as maxDeposit, 
       max(L.Loan_Amount) as maxLoan   
from accounts A 
Join Loans L on A.ACCOUNT_ID = L.Account_id
Join Deposits D on A.ACCOUNT_ID = D.Account_id
Group BY A.ACCOUNT_ID;


SELECT A.Account_ID, 
       CC.Card_Number,
       CC.Expiration_Date AS Card_Expiration_Date,
       L.Loan_ID,
       L.Interest_Rate AS Loan_Interest_Rate
FROM Accounts A
LEFT JOIN Credit_Cards CC ON A.Account_ID = CC.Account_ID AND
      CC.Expiration_Date <= ADD_MONTHS(SYSDATE, 1)
LEFT JOIN Loans L ON A.Account_ID = L.Account_ID AND
      L.End_Date <= ADD_MONTHS(SYSDATE, 1);
      
      
DELETE FROM Credit_Cards
WHERE Expiration_Date < SYSDATE;

ROLLBACK;

DELETE FROM Loans
WHERE End_Date < SYSDATE;

ROLLBACK;

UPDATE Credit_Cards
SET Expiration_Date = ADD_MONTHS(Expiration_Date, 12);

ROLLBACK;

select * from Credit_Cards
WHERE End_Date < SYSDATE;


UPDATE Loans
SET Interest_Rate = Interest_Rate + 0.5;
