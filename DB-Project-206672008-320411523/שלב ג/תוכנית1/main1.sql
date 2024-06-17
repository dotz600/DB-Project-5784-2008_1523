
create or replace noneditionable function is_active10(p_account_id IN NUMBER) return boolean is
  FunctionResult boolean;
    v_transfers_count integer;
    v_checks_count integer;
    v_deposits_count integer;
begin
  SELECT COUNT(*) INTO v_transfers_count
    FROM Transactions t
    WHERE account_id = p_account_id
      AND t.transaction_date >= ADD_MONTHS(SYSDATE, -24);


    dbms_output.put_line(p_account_id);
    SELECT COUNT(*) INTO v_checks_count
    FROM Checks ch
    WHERE ch.account_id = p_account_id
      AND ch.clearing_date >= ADD_MONTHS(SYSDATE, -12);

    SELECT COUNT(*) INTO v_deposits_count
    FROM Deposits dp
    WHERE dp.account_id = p_account_id;

    IF v_transfers_count >= 0 AND v_checks_count >= 0 AND v_deposits_count >= 0 THEN
        FunctionResult := TRUE;
    ELSE
        FunctionResult :=  FALSE;
    END IF;
  return(FunctionResult);
end is_active1;

---main
DECLARE
    CURSOR customer_cursor IS
        SELECT account_ID FROM Accounts;
BEGIN
    FOR customer_record IN customer_cursor LOOP
        if is_active10(customer_record.account_id) then
          dbms_output.put_line(customer_record);
          end if;
    END LOOP;
END;



