

--stage4 
--rename our table 
rename accounts to accounts1;
rename checks to checks1;
rename transactions to transactions1;
rename loans to loans1;
rename credit_cards to credit_cards1;
rename deposits to deposits1;

--select all check
select * from accounts1;
select * from checks1;
select * from transactions1;
select * from loans1;
select * from credit_cards1;
select * from deposits1;

--check after adding team2 backup
SELECT * FROM Transactions;
SELECT * FROM DirectDebit;
SELECT * FROM Relationship;
SELECT * FROM BlackList;
SELECT * FROM Vip;
SELECT * FROM Account;
SELECT * FROM Customer;
SELECT * FROM Branch;

--integration command
--transaction
ALTER TABLE transactions1 ADD transactiontype VARCHAR(20);

UPDATE transactions1 t1
SET t1.transactiontype = (
    SELECT t.transactiontype
    FROM transactions t
    ORDER BY DBMS_RANDOM.VALUE
    FETCH FIRST 1 ROWS ONLY
);

--account integratin
ALTER TABLE accounts1 ADD branchid NUMBER(38);
ALTER TABLE accounts1 ADD AccountStatus VARCHAR2(20);
ALTER TABLE account ADD account_type varchar2(10);

UPDATE account a
SET a.account_type = (
    SELECT a1.account_type
    FROM accounts1 a1
    ORDER BY DBMS_RANDOM.VALUE
    FETCH FIRST 1 ROWS ONLY
);

UPDATE accounts1 a1
SET a1.branchid = (
    SELECT a.branchid
    FROM account a
    ORDER BY DBMS_RANDOM.VALUE
    FETCH FIRST 1 ROWS ONLY
);

UPDATE accounts1 a1
SET a1.AccountStatus = (
    SELECT a.AccountStatus
    FROM account a
    ORDER BY DBMS_RANDOM.VALUE
    FETCH FIRST 1 ROWS ONLY
);

INSERT INTO account (accountid, balance, dateopened, accountstatus, branchid, account_type)
SELECT a1.account_id, a1.balance, a1.account_opening_date, a1.accountstatus, a1.branchid, a1.account_type
FROM accounts1 a1
WHERE NOT EXISTS (
    SELECT 1
    FROM account a
    WHERE a.accountid = a1.account_id
);

select * from account;
select count(*) from account


--end of transaction integration
INSERT INTO transactions (transactionid, transactiontype,amount, transactiondate,accountid)
SELECT t1.transaction_id, t1.transactiontype, t1.amount, t1.transaction_date, t1.account_id
FROM transactions1 t1
WHERE t1.transaction_id not in (select t2.transactionid from Transactions t2);


select * from transactions;

--loans integration
ALTER TABLE loans1 DROP CONSTRAINT SYS_C008666;


ALTER TABLE loans1
ADD CONSTRAINT SYS_C008666
FOREIGN KEY (account_id)
REFERENCES account (accountid);

-- data generator commands.


---credis_card integration
SELECT constraint_name
FROM user_constraints
WHERE table_name = 'CREDIT_CARDS1' AND constraint_type = 'R';


ALTER TABLE credit_cards1 DROP CONSTRAINT SYS_C008673;


ALTER TABLE credit_cards1
ADD CONSTRAINT SYS_C008673
FOREIGN KEY (account_id)
REFERENCES account (accountid);
--adding data with data generator

--check integration
SELECT constraint_name
FROM user_constraints
WHERE table_name = 'CHECKS1' AND constraint_type = 'R';

ALTER TABLE CHECKS1 DROP CONSTRAINT SYS_C008681;


ALTER TABLE CHECKS1
ADD CONSTRAINT SYS_C008681
FOREIGN KEY (account_id)
REFERENCES account (accountid);

--deposits integration
SELECT constraint_name
FROM user_constraints
WHERE table_name = 'DEPOSITS1' AND constraint_type = 'R';

ALTER TABLE DEPOSITS1 DROP CONSTRAINT SYS_C008689;


ALTER TABLE DEPOSITS1
ADD CONSTRAINT SYS_C008689
FOREIGN KEY (account_id)
REFERENCES account (accountid);


--rnaming to orignal names
rename checks1 to checks;
rename loans1 to loans;
rename credit_cards1 to credit_cards;
rename deposits1 to deposits;

--delete the unneccery tabels
drop table transactions1 ;
drop table accounts1 ;

