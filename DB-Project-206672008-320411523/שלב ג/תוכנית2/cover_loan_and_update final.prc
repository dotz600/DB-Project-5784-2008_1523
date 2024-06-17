create or replace procedure cover_loan_and_update(p_account_id in Number) is
    v_loan_amount NUMBER;
    v_loan_id NUMBER;       
       
begin
       
    update accounts a
    set a.balance = a.balance - ( SELECT MIN(Loan_Amount)
    FROM Loans
    WHERE account_id = p_account_id
      AND End_Date > SYSDATE) 
    where a.account_id = p_account_id;
    
    
    --find loan_id of the minmal loan
    SELECT loan_id, Loan_Amount
    INTO v_loan_id, v_loan_amount
    FROM Loans
    WHERE account_id = p_account_id
      AND End_Date > SYSDATE
    ORDER BY Loan_Amount ASC
    FETCH FIRST 1 ROWS ONLY;
    
    update loans l
    set loan_amount = 0,
    l.end_date = SYSDATE
    where l.account_id = p_account_id
    And l.loan_id = v_loan_id;
    
    commit;
     DBMS_OUTPUT.PUT_LINE('Loan covered and database updated successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No eligible loan found or insufficient balance.');
        
end cover_loan_and_update;
/
