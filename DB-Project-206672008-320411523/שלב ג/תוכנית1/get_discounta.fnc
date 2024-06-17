CREATE OR REPLACE FUNCTION get_discount(p_account_id IN NUMBER)
RETURN NUMBER IS
    v_checks_sum NUMBER;
    v_deposits_sum NUMBER;
    v_account_open_date DATE;
    v_months_open NUMBER;
    func_result NUMBER;
BEGIN
   
    SELECT NVL(SUM(ch.amount),0) INTO v_checks_sum
    FROM Checks ch
    WHERE ch.account_id = p_account_id
          AND ch.clearing_date >= ADD_MONTHS(SYSDATE, -12);


   
    SELECT NVL(SUM(dep.Deposit_Amount),0) INTO v_deposits_sum
    FROM Deposits dep
    WHERE dep.account_id = p_account_id
          AND dep.deposit_date >= ADD_MONTHS(SYSDATE, -12);

    
    select a.account_opening_date
    INTO v_account_open_date
     from accounts a 
     where a.account_id = p_account_id;
     
     
     v_months_open := MONTHS_BETWEEN(SYSDATE, v_account_open_date);

  
    func_result := ((v_deposits_sum + v_checks_sum) / v_months_open) *0.01;
    

    IF func_result > 5 THEN
      func_result := 5;
      END IF;
      
    RETURN ROUND (NVL(func_result,0),2);
    
END get_discount;
/
