
DECLARE
    CURSOR customer_cursor IS
        SELECT account_ID FROM Accounts;
BEGIN
    FOR customer_record IN customer_cursor LOOP
        if can_cover(customer_record.account_id) then
          cover_loan_and_update(customer_record.account_id);
          end if;
    END LOOP;
END;



