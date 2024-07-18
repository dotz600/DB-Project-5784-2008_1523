
CREATE OR REPLACE VIEW Team2DBView AS
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.DateOfBirth,
    c.Address AS CustomerAddress,
    c.ContactNumber,
    c.Email,
    a.AccountID,
    a.Balance,
    a.DateOpened,
    a.AccountStatus,
    a.Account_Type,
    b.BranchID,
    b.BranchName,
    b.BranchAddress,
    b.BranchPhoneNumber,
    CASE 
        WHEN v.AccountID IS NOT NULL THEN 'VIP'
        WHEN bl.AccountID IS NOT NULL THEN 'BlackList'
        ELSE 'Regular'
    END AS CustomerStatus,
    v.PositiveInterest,
    bl.NegetiveInterest,
    bl.MinimumMinus,
    dd.IDDebit,
    dd.StartDate AS DirectDebitStartDate,
    dd.TypeDebit,
    dd.Amount AS DirectDebitAmount,
    t.TransactionID,
    t.TransactionType,
    t.Amount AS TransactionAmount,
    t.TransactionDate
FROM 
    Customer c
JOIN Relationship r ON c.CustomerID = r.CustomerID
JOIN Account a ON r.AccountID = a.AccountID
JOIN Branch b ON a.BranchID = b.BranchID
LEFT JOIN Vip v ON a.AccountID = v.AccountID
LEFT JOIN BlackList bl ON a.AccountID = bl.AccountID
LEFT JOIN DirectDebit dd ON a.AccountID = dd.AccountID
LEFT JOIN Transactions t ON a.AccountID = t.AccountID;


SELECT * FROM Team2DBView FETCH FIRST 5000 ROWS ONLY;

-----qurey number 1
SELECT 
       
    BranchName,
    COUNT(DISTINCT CustomerID) AS TotalCustomers,
    AVG(Balance) AS AverageBalance,
    SUM(CASE WHEN CustomerStatus = 'VIP' THEN 1 ELSE 0 END) AS VIPCount,
    SUM(CASE WHEN CustomerStatus = 'BlackList' THEN 1 ELSE 0 END) AS BlackListCount
FROM 
    Team2DBView
GROUP BY 
    BranchName
HAVING 
    COUNT(DISTINCT CustomerID) > 10
    AND AVG(Balance) > (SELECT AVG(Balance) FROM Team2DBView)
ORDER BY 
    AverageBalance DESC;


--qurey number 2

SELECT 
       
    CustomerID,
    FirstName,
    COUNT(DISTINCT TransactionID) AS TransactionCount,
    SUM(CASE WHEN TransactionDate >= ADD_MONTHS(SYSDATE, -12) THEN TransactionAmount ELSE 0 END) AS TotalTransactionAmount,
    COUNT(DISTINCT IDDebit) AS DirectDebitCount,
    SUM(CASE WHEN DirectDebitStartDate >= ADD_MONTHS(SYSDATE, -12) THEN DirectDebitAmount ELSE 0 END) AS TotalDirectDebitAmount,
    CASE 
        WHEN COUNT(DISTINCT TransactionID) > 10 THEN 'High Activity'
        WHEN COUNT(DISTINCT TransactionID) > 5 THEN 'Medium Activity'
        ELSE 'Low Activity'
    END AS ActivityLevel
FROM 
    Team2DBView
GROUP BY 
    CustomerID, FirstName, LastName
HAVING 
    COUNT(DISTINCT TransactionID) > 0 or COUNT(DISTINCT IDDebit) > 0
ORDER BY 
    TotalTransactionAmount DESC, TotalDirectDebitAmount DESC;
