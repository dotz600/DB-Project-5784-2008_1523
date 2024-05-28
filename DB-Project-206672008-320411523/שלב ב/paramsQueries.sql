DECLARE
    p_Balance NUMBER := 10000; 
    CURSOR c_Accounts IS
        SELECT Account_ID, Customer_ID, Account_Type, Balance, Account_Opening_Date
        FROM Accounts
        WHERE Balance > p_Balance;
BEGIN
    FOR rec IN c_Accounts LOOP
        DBMS_OUTPUT.PUT_LINE('Account ID: ' || rec.Account_ID || ', Customer ID: ' || rec.Customer_ID || 
                             ', Account Type: ' || rec.Account_Type || ', Balance: ' || rec.Balance || 
                             ', Opening Date: ' || rec.Account_Opening_Date);
    END LOOP;
END;
/

DECLARE
    p_Start_Date DATE := TO_DATE('2022-01-01', 'YYYY-MM-DD');
    p_End_Date DATE := TO_DATE('2026-12-31', 'YYYY-MM-DD');  
    CURSOR c_Loans IS
        SELECT Loan_ID, Loan_Amount, Interest_Rate, Start_Date, End_Date, Account_ID
        FROM Loans
        WHERE Start_Date BETWEEN p_Start_Date AND p_End_Date;
BEGIN
    FOR rec IN c_Loans LOOP
        DBMS_OUTPUT.PUT_LINE('Loan ID: ' || rec.Loan_ID ||', Loan Amount: ' ||
         rec.Loan_Amount || ', Interest Rate: ' || rec.Interest_Rate || 
                             ', Start Date: ' || rec.Start_Date || ', End Date: ' || rec.End_Date || 
                             ', Account ID: ' || rec.Account_ID);
    END LOOP;
END;
/


DECLARE
    p_Account_Type VARCHAR2(10) := 'Savings'; 
    CURSOR c_Transactions IS
        SELECT t.Transaction_ID, t.Amount, t.Account_ID, t.Transaction_Date
        FROM Transactions t
        JOIN Accounts a ON t.Account_ID = a.Account_ID
        WHERE a.Account_Type = p_Account_Type;
BEGIN
    FOR rec IN c_Transactions LOOP
        DBMS_OUTPUT.PUT_LINE('Transaction ID: ' || rec.Transaction_ID);
        DBMS_OUTPUT.PUT_LINE('Amount: ' || rec.Amount);
        DBMS_OUTPUT.PUT_LINE('Account ID: ' || rec.Account_ID);
        DBMS_OUTPUT.PUT_LINE('Transaction Date: ' || rec.Transaction_Date);
    END LOOP;
END;
/



DECLARE
    p_Start_Expiration DATE := TO_DATE('2022-01-01', 'YYYY-MM-DD'); 
    p_End_Expiration DATE := TO_DATE('2024-12-31', 'YYYY-MM-DD');   
    CURSOR c_Credit_Cards IS
        SELECT Card_ID, Card_Number, Card_Type, Expiration_Date, Credit_Limit, Account_ID
        FROM Credit_Cards
        WHERE Expiration_Date BETWEEN p_Start_Expiration AND p_End_Expiration;
BEGIN
    FOR rec IN c_Credit_Cards LOOP
        DBMS_OUTPUT.PUT_LINE('Card ID: ' || rec.Card_ID);
        DBMS_OUTPUT.PUT_LINE('Card Number: ' || rec.Card_Number);
        DBMS_OUTPUT.PUT_LINE('Card Type: ' || rec.Card_Type);
        DBMS_OUTPUT.PUT_LINE('Expiration Date: ' || rec.Expiration_Date);
        DBMS_OUTPUT.PUT_LINE('Credit Limit: ' || rec.Credit_Limit);
        DBMS_OUTPUT.PUT_LINE('Account ID: ' || rec.Account_ID);
    END LOOP;
END;
/
