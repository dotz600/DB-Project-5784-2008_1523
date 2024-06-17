CREATE OR REPLACE PROCEDURE apply_discount(p_account_id IN NUMBER,p_discount IN NUMBER
) IS
    v_loan_id NUMBER;
    v_max_interest NUMBER;
    v_new_interest NUMBER;
BEGIN
   
    BEGIN
        SELECT loan_id, interest_rate
        INTO v_loan_id, v_max_interest
        FROM (
            SELECT loan_id, interest_rate
            FROM Loans
            WHERE account_id = p_account_id
            ORDER BY interest_rate DESC
        )
        WHERE ROWNUM = 1;

        
        v_new_interest := v_max_interest - p_discount;

  
        IF v_new_interest < 2 THEN
            v_new_interest := 2;
        END IF;

       
        UPDATE Loans
        SET interest_rate = v_new_interest
        WHERE loan_id = v_loan_id;

        DBMS_OUTPUT.PUT_LINE('Loan ID ' || v_loan_id || ' updated with new interest rate: ' || v_new_interest || '%');

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No loans found for account ID ' || p_account_id);
    END;
END;
/
