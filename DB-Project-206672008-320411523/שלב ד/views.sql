
--DROP VIEW receiveddbview;
--DROP VIEW OurDBView;


CREATE VIEW OurDBView AS
SELECT a.AccountID AS AccountID,
    a.Balance,
    a.DateOpened ,
    a.AccountStatus,
    a.BranchID,
    l.Loan_ID,
    l.Loan_Amount,
    l.Interest_Rate as L_Interest_Rate,
    l.Start_Date ,
    l.End_Date ,
    cc.Card_ID ,
    cc.Card_Number ,
    cc.Card_Type,
    cc.Expiration_Date ,
    cc.Credit_Limit ,
    t.TransactionID ,
    t.TransactionType ,
    t.Amount as t_amount,
    t.TransactionDate ,
    t.AccountID AS AccountID_t,
    d.DepositID ,
    d.Deposit_Amount ,
    d.Deposit_Date,
    d.Maturity_Date ,
    d.Interest_Rate AS InterestRate_d,
    ch.Check_ID ,
    ch.Check_Number ,
    ch.Amount AS Amount_ch,
    ch.Issue_Date ,
    ch.Clearing_Date
FROM Account a
LEFT JOIN Loans l ON a.AccountID = l.Account_ID
LEFT JOIN Credit_Cards cc ON a.AccountID = cc.Account_ID
LEFT JOIN transactions t ON a.AccountID = t.AccountID
LEFT JOIN deposits d ON a.AccountID = d.Account_ID
LEFT JOIN checks ch ON a.AccountID = ch.Account_ID;

--number1
SELECT 
    AccountID, 
    SUM(Loan_Amount) AS TotalLoanAmount,
    AVG(L_Interest_Rate) AS AvgLoanInterestRate, 
    SUM(Balance) AS TotalBalance,
    COUNT(transactionid) AS total_transaction
FROM 
    OurDBView
GROUP BY 
    AccountID;


--number 2
SELECT
    BranchID,
    SUM(Loan_Amount) AS TotalLoanAmount,
    AVG(L_Interest_Rate) AS AvgInterestRate
FROM OurDBView
GROUP BY BranchID
ORDER BY BranchID;
