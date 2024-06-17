create or replace noneditionable function is_active5(p_account_id IN NUMBER) return boolean is
  FunctionResult boolean;
    v_transfers_count integer;
    v_checks_count integer;
    v_deposits_count integer;
begin
  SELECT COUNT(*) INTO v_transfers_count
    FROM Transactions t
    WHERE account_id = p_account_id
      AND t.transaction_date >= ADD_MONTHS(SYSDATE, -24);

    SELECT COUNT(*) INTO v_checks_count
    FROM Checks ch
    WHERE ch.account_id = p_account_id
      AND ch.clearing_date >= ADD_MONTHS(SYSDATE, -12);

    SELECT COUNT(*) INTO v_deposits_count
    FROM Deposits dp
    WHERE dp.account_id = p_account_id;

    IF v_transfers_count >= 5 AND v_checks_count >= 5 AND v_deposits_count >= 5 THEN
        FunctionResult := TRUE;
    ELSE
        FunctionResult :=  FALSE;
    END IF;
  return(FunctionResult);
end is_active5;
/
