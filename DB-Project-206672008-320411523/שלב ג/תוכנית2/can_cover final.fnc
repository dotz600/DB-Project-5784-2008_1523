CREATE OR REPLACE NONEDITIONABLE FUNCTION can_cover(p_account_id IN NUMBER)
RETURN BOOLEAN IS
    v_loan_amount NUMBER;
    v_account_balance NUMBER;
BEGIN
    
    SELECT MIN(Loan_Amount)
    INTO v_loan_amount
    FROM Loans
    WHERE account_id = p_account_id
      AND End_Date > SYSDATE;

    
    SELECT Balance
    INTO v_account_balance
    FROM Accounts
    WHERE account_id = p_account_id;

    
    IF v_account_balance >= v_loan_amount THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;  
END can_cover;
/
