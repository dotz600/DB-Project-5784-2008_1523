prompt PL/SQL Developer Export Tables for user SYS@XE
prompt Created by ohevd on יום שלישי 21 מאי 2024
set feedback off
set define off

prompt Dropping ACCOUNTS...
drop table ACCOUNTS cascade constraints;
prompt Dropping CHECKS...
drop table CHECKS cascade constraints;
prompt Dropping CREDIT_CARDS...
drop table CREDIT_CARDS cascade constraints;
prompt Dropping DEPOSITS...
drop table DEPOSITS cascade constraints;
prompt Dropping LOANS...
drop table LOANS cascade constraints;
prompt Dropping TRANSACTIONS...
drop table TRANSACTIONS cascade constraints;
prompt Creating ACCOUNTS...
create table ACCOUNTS
(
  account_id           INTEGER not null,
  customer_id          INTEGER not null,
  account_type         VARCHAR2(10),
  balance              INTEGER not null,
  account_opening_date DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACCOUNTS
  add primary key (ACCOUNT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CHECKS...
create table CHECKS
(
  check_id      INTEGER not null,
  check_number  INTEGER not null,
  amount        INTEGER not null,
  issue_date    DATE not null,
  clearing_date DATE not null,
  account_id    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CHECKS
  add primary key (CHECK_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CHECKS
  add foreign key (ACCOUNT_ID)
  references ACCOUNTS (ACCOUNT_ID);

prompt Creating CREDIT_CARDS...
create table CREDIT_CARDS
(
  card_id         INTEGER not null,
  card_number     INTEGER not null,
  card_type       VARCHAR2(10),
  expiration_date DATE not null,
  credit_limit    INTEGER not null,
  account_id      INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CREDIT_CARDS
  add primary key (CARD_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CREDIT_CARDS
  add foreign key (ACCOUNT_ID)
  references ACCOUNTS (ACCOUNT_ID);

prompt Creating DEPOSITS...
create table DEPOSITS
(
  depositid      INTEGER not null,
  deposit_amount INTEGER not null,
  deposit_date   DATE not null,
  maturity_date  DATE not null,
  interest_rate  INTEGER not null,
  account_id     INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DEPOSITS
  add primary key (DEPOSITID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DEPOSITS
  add foreign key (ACCOUNT_ID)
  references ACCOUNTS (ACCOUNT_ID);

prompt Creating LOANS...
create table LOANS
(
  loan_id       INTEGER not null,
  loan_amount   INTEGER not null,
  interest_rate INTEGER not null,
  start_date    DATE not null,
  end_date      DATE not null,
  account_id    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LOANS
  add primary key (LOAN_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LOANS
  add foreign key (ACCOUNT_ID)
  references ACCOUNTS (ACCOUNT_ID);

prompt Creating TRANSACTIONS...
create table TRANSACTIONS
(
  transaction_id   INTEGER not null,
  amount           INTEGER not null,
  account_id       INTEGER not null,
  transaction_date DATE
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRANSACTIONS
  add primary key (TRANSACTION_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRANSACTIONS
  add foreign key (ACCOUNT_ID)
  references ACCOUNTS (ACCOUNT_ID);

prompt Disabling triggers for ACCOUNTS...
alter table ACCOUNTS disable all triggers;
prompt Disabling triggers for CHECKS...
alter table CHECKS disable all triggers;
prompt Disabling triggers for CREDIT_CARDS...
alter table CREDIT_CARDS disable all triggers;
prompt Disabling triggers for DEPOSITS...
alter table DEPOSITS disable all triggers;
prompt Disabling triggers for LOANS...
alter table LOANS disable all triggers;
prompt Disabling triggers for TRANSACTIONS...
alter table TRANSACTIONS disable all triggers;
prompt Disabling foreign key constraints for CHECKS...
alter table CHECKS disable constraint SYS_C008483;
prompt Disabling foreign key constraints for CREDIT_CARDS...
alter table CREDIT_CARDS disable constraint SYS_C008512;
prompt Disabling foreign key constraints for DEPOSITS...
alter table DEPOSITS disable constraint SYS_C008520;
prompt Disabling foreign key constraints for LOANS...
alter table LOANS disable constraint SYS_C008505;
prompt Disabling foreign key constraints for TRANSACTIONS...
alter table TRANSACTIONS disable constraint SYS_C008497;
prompt Loading ACCOUNTS...
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (1, 10, 'Savings', 1000, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (2, 20, 'Checking', 2000, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (3, 30, 'Checking', 2555, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (4, 40, 'Checking', 2040, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (5, 50, 'Savings', 2900, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (6, 60, 'Checking', 9999, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (7, 70, 'Savings', 1542, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (8, 80, 'Checking', 8521, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (9, 90, 'Savings', 4523, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (10, 100, 'Checking', 4658, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (172, 374, 'Checking', 445328, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (171, 361, 'Checking', 753590, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (170, 323, 'Savings', 470082, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (169, 289, 'Checking', 319222, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (168, 260, 'Checking', 305194, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (167, 228, 'Checking', 61503, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (166, 206, 'Savings', 140007, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (165, 187, 'Checking', 975649, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (164, 175, 'Savings', 389426, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (163, 160, 'Checking', 915437, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (162, 154, 'Checking', 532065, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (161, 147, 'Checking', 908596, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (160, 143, 'Checking', 793615, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (159, 140, 'Checking', 858005, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (158, 136, 'Checking', 871347, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (157, 133, 'Checking', 12497, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (156, 131, 'Checking', 744735, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (155, 130, 'Checking', 23160, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (154, 130, 'Savings', 250366, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (153, 130, 'Savings', 783778, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (152, 129, 'Savings', 4376, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (151, 131, 'Checking', 733164, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (150, 131, 'Savings', 921553, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (149, 136, 'Checking', 892744, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (148, 139, 'Checking', 894760, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (147, 144, 'Savings', 48356, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (146, 149, 'Savings', 422020, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (145, 157, 'Checking', 87111, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (144, 174, 'Checking', 637112, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (143, 185, 'Checking', 380458, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (142, 196, 'Savings', 174840, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (141, 206, 'Checking', 663557, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (140, 217, 'Savings', 503101, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (139, 225, 'Savings', 178613, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (138, 234, 'Checking', 801899, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (137, 243, 'Savings', 873397, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (136, 249, 'Savings', 233246, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (135, 253, 'Checking', 696326, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (134, 255, 'Savings', 108926, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (133, 259, 'Checking', 790434, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (132, 259, 'Savings', 626171, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (131, 260, 'Savings', 262280, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (130, 262, 'Savings', 163296, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (129, 262, 'Savings', 227713, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (128, 260, 'Checking', 709452, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (127, 259, 'Checking', 69099, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (125, 258, 'Checking', 182356, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (124, 256, 'Checking', 592665, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (123, 253, 'Savings', 677440, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (122, 249, 'Checking', 644566, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (121, 243, 'Savings', 719188, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (120, 237, 'Checking', 128551, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (119, 229, 'Savings', 739416, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (118, 221, 'Checking', 472299, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (117, 212, 'Checking', 827573, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (116, 202, 'Checking', 161179, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (115, 192, 'Savings', 541472, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (114, 183, 'Savings', 324460, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (112, 174, 'Checking', 778467, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (111, 167, 'Checking', 393954, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (110, 160, 'Checking', 714063, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (109, 155, 'Checking', 818093, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (108, 150, 'Savings', 796969, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (107, 148, 'Savings', 843448, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (106, 145, 'Savings', 811577, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (105, 143, 'Savings', 354683, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (104, 143, 'Checking', 999892, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (103, 143, 'Checking', 777953, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (102, 143, 'Checking', 859055, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (101, 142, 'Checking', 887739, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (100, 143, 'Checking', 64702, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (99, 146, 'Checking', 19690, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (98, 148, 'Savings', 505330, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (97, 153, 'Checking', 481924, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (96, 158, 'Checking', 537819, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (95, 164, 'Checking', 885492, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (94, 173, 'Savings', 412240, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (93, 195, 'Savings', 724566, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (92, 207, 'Checking', 315679, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (91, 220, 'Savings', 432336, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (90, 234, 'Checking', 429494, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (89, 247, 'Checking', 427249, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (88, 270, 'Savings', 676697, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (87, 280, 'Savings', 403589, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (86, 288, 'Savings', 924237, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (85, 300, 'Checking', 952996, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (84, 305, 'Checking', 800462, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (83, 307, 'Savings', 412020, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (82, 311, 'Checking', 203558, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (81, 310, 'Savings', 601707, to_date('20-05-2024', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (80, 310, 'Savings', 401159, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (79, 308, 'Checking', 31531, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (78, 299, 'Savings', 83010, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (77, 293, 'Checking', 815381, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (76, 276, 'Savings', 933909, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (75, 254, 'Checking', 168288, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (74, 227, 'Checking', 439270, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (73, 216, 'Savings', 665634, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (72, 209, 'Checking', 362354, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (71, 208, 'Checking', 958166, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (70, 233, 'Savings', 489926, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (69, 241, 'Savings', 223218, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (68, 248, 'Savings', 617539, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (67, 300, 'Savings', 688399, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (838, 188, 'Checking', 340784, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (845, 190, 'Savings', 377484, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (23, 190, 'Savings', 896961, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (979, 193, 'Checking', 971542, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (559, 194, 'Savings', 779581, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (741, 199, 'Savings', 12809, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (939, 204, 'Savings', 379732, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (357, 209, 'Checking', 445241, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (342, 214, 'Savings', 131468, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (63, 220, 'Checking', 655686, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (404, 226, 'Savings', 377208, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (703, 233, 'Savings', 718238, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (289, 241, 'Checking', 134066, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (256, 249, 'Checking', 4339, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (504, 262, 'Checking', 278388, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (791, 269, 'Checking', 817710, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (459, 273, 'Savings', 3212, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (500, 283, 'Checking', 175762, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (960, 285, 'Checking', 473522, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (564, 288, 'Savings', 735366, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (243, 290, 'Savings', 351793, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (363, 291, 'Savings', 538258, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (610, 292, 'Checking', 309590, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (286, 293, 'Savings', 757770, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (727, 293, 'Savings', 112717, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (276, 293, 'Savings', 909313, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (783, 298, 'Checking', 135510, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (291, 303, 'Checking', 42129, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (600, 312, 'Checking', 158273, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (930, 322, 'Checking', 942418, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (637, 333, 'Checking', 774048, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (503, 344, 'Savings', 806073, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (281, 354, 'Savings', 207463, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (321, 363, 'Checking', 285564, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (333, 367, 'Checking', 700101, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (402, 370, 'Savings', 595619, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (497, 372, 'Checking', 584121, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (47, 374, 'Savings', 30956, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (892, 372, 'Savings', 501261, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (786, 371, 'Savings', 815284, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (376, 367, 'Checking', 780811, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (731, 364, 'Checking', 380313, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (569, 360, 'Savings', 313742, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (886, 357, 'Savings', 451223, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (64, 351, 'Savings', 363528, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (621, 329, 'Checking', 727866, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (522, 319, 'Checking', 624009, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (562, 310, 'Checking', 650253, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (633, 299, 'Checking', 227216, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (668, 288, 'Checking', 124765, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (554, 264, 'Savings', 26695, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (654, 241, 'Savings', 504938, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (422, 230, 'Savings', 584727, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (674, 221, 'Checking', 188413, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (585, 211, 'Checking', 51495, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (781, 203, 'Checking', 961095, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (311, 195, 'Savings', 602161, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (880, 185, 'Checking', 4307, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (685, 179, 'Checking', 343801, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (29, 176, 'Savings', 975067, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (876, 173, 'Checking', 566796, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (556, 171, 'Savings', 14004, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (944, 170, 'Savings', 918413, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (854, 168, 'Savings', 866651, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (216, 168, 'Checking', 302198, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (210, 166, 'Savings', 471515, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (700, 168, 'Checking', 676273, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (48, 167, 'Checking', 609193, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (179, 169, 'Checking', 990984, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (39, 169, 'Checking', 661061, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (970, 170, 'Savings', 449286, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (519, 171, 'Checking', 986337, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (816, 172, 'Checking', 831849, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (644, 174, 'Checking', 58920, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (891, 175, 'Savings', 703286, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (905, 176, 'Savings', 479848, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (874, 178, 'Savings', 78154, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (474, 185, 'Checking', 949619, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (196, 188, 'Savings', 762454, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (965, 190, 'Checking', 609789, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (771, 195, 'Checking', 885697, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (325, 199, 'Checking', 194197, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (833, 204, 'Savings', 597993, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (355, 209, 'Savings', 450031, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (477, 227, 'Checking', 864322, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (697, 233, 'Savings', 743124, to_date('16-05-2024', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (421, 240, 'Savings', 476208, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (916, 246, 'Savings', 205853, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (393, 252, 'Savings', 114835, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (388, 259, 'Checking', 783848, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (491, 268, 'Checking', 150593, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (809, 273, 'Checking', 836408, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (704, 281, 'Checking', 25581, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (206, 288, 'Savings', 501543, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (308, 295, 'Checking', 99538, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (239, 301, 'Savings', 894949, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (523, 309, 'Checking', 232890, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (612, 320, 'Checking', 476893, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (846, 326, 'Checking', 693809, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (387, 329, 'Checking', 278147, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (343, 335, 'Checking', 636708, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (857, 339, 'Checking', 148997, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (38, 342, 'Checking', 457797, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (744, 347, 'Savings', 652088, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (813, 349, 'Checking', 122534, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (659, 352, 'Savings', 76978, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (907, 355, 'Savings', 265357, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (375, 357, 'Savings', 175787, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (65, 360, 'Savings', 875006, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (485, 362, 'Savings', 124566, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (837, 363, 'Checking', 193626, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (849, 363, 'Checking', 192195, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (441, 365, 'Checking', 497687, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (398, 365, 'Checking', 889216, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (609, 365, 'Checking', 963968, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (617, 367, 'Checking', 317891, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (620, 367, 'Savings', 969221, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (859, 367, 'Checking', 426021, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (827, 367, 'Checking', 173128, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (893, 368, 'Checking', 39718, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (430, 369, 'Savings', 924418, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (550, 381, 'Savings', 454493, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (575, 398, 'Checking', 339240, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (761, 404, 'Savings', 998005, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (799, 403, 'Savings', 601181, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (770, 395, 'Savings', 605455, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (692, 387, 'Checking', 727034, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (777, 379, 'Checking', 934620, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (812, 370, 'Checking', 995361, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (822, 360, 'Savings', 949763, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (973, 346, 'Savings', 86670, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (285, 335, 'Checking', 299130, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (346, 324, 'Checking', 335387, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (233, 314, 'Savings', 738733, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (307, 307, 'Savings', 104304, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (843, 300, 'Savings', 982582, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (418, 291, 'Savings', 920691, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (261, 289, 'Savings', 269662, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (284, 289, 'Savings', 474376, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (747, 289, 'Savings', 404596, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (855, 287, 'Checking', 174128, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (55237, 253, 'Savings', 344658, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (58276, 252, 'Checking', 145323, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (30635, 246, 'Savings', 523362, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (42448, 232, 'Checking', 284475, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (80080, 215, 'Checking', 977390, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (22252, 202, 'Savings', 33328, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (44336, 197, 'Checking', 410380, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (66696, 195, 'Savings', 143376, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (5179, 194, 'Checking', 797394, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (36530, 195, 'Checking', 470258, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (98328, 197, 'Checking', 665603, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (31048, 200, 'Checking', 67107, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (60628, 201, 'Checking', 178362, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (31916, 203, 'Savings', 43503, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (97364, 203, 'Checking', 94849, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (3334, 202, 'Savings', 681623, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (60488, 204, 'Savings', 16120, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (28548, 207, 'Checking', 333256, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (49249, 211, 'Savings', 141249, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (98352, 218, 'Checking', 244559, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (56892, 225, 'Savings', 859597, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (31739, 233, 'Checking', 210474, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (83978, 242, 'Savings', 604668, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (85401, 248, 'Checking', 595269, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (66404, 252, 'Checking', 712623, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (41547, 255, 'Savings', 920734, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (95077, 256, 'Checking', 417376, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (77969, 256, 'Savings', 543663, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (42220, 256, 'Checking', 749247, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (64954, 256, 'Checking', 661363, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (84596, 252, 'Checking', 697203, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (63532, 250, 'Checking', 941315, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (69603, 249, 'Savings', 459459, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (65893, 247, 'Checking', 639777, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (73549, 247, 'Savings', 732444, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (50997, 248, 'Checking', 252046, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (61709, 251, 'Savings', 15161, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (94833, 252, 'Savings', 993995, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (34032, 257, 'Savings', 321913, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (11525, 265, 'Savings', 417291, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (90590, 271, 'Checking', 570797, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (63381, 278, 'Savings', 751653, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (60340, 283, 'Checking', 452184, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (26080, 287, 'Savings', 598289, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (69644, 287, 'Savings', 166189, to_date('01-05-2024', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (73412, 287, 'Savings', 324823, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (58350, 288, 'Checking', 38322, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (79938, 286, 'Savings', 363797, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (3310, 277, 'Checking', 16398, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (17380, 259, 'Savings', 435086, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (11929, 244, 'Savings', 694317, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (44351, 235, 'Savings', 758011, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (67619, 231, 'Savings', 499451, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (75962, 231, 'Savings', 27172, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (93415, 232, 'Savings', 40283, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (63101, 234, 'Checking', 993975, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (78617, 237, 'Savings', 337139, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (21101, 241, 'Checking', 871813, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (5953, 248, 'Checking', 391644, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (6224, 257, 'Checking', 245595, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (96941, 267, 'Checking', 656628, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (65414, 279, 'Checking', 510229, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (20539, 293, 'Checking', 869081, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (33391, 309, 'Checking', 544640, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (44367, 323, 'Checking', 611814, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (92458, 335, 'Savings', 334112, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (77451, 346, 'Checking', 379270, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (59685, 356, 'Checking', 718168, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (95107, 361, 'Checking', 967904, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (21813, 365, 'Checking', 629189, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (37587, 368, 'Savings', 620286, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (64575, 370, 'Checking', 528291, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (45428, 370, 'Checking', 818166, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (36660, 371, 'Savings', 685848, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (22716, 368, 'Savings', 67191, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (79839, 362, 'Checking', 435486, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (4798, 351, 'Checking', 199664, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (27909, 344, 'Savings', 56611, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (22091, 341, 'Savings', 977103, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (20125, 342, 'Checking', 242186, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (41440, 341, 'Checking', 22366, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (66645, 340, 'Savings', 672211, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (55595, 340, 'Checking', 855711, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (27201, 339, 'Savings', 540370, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (94616, 338, 'Checking', 130676, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (46450, 338, 'Checking', 165782, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (22684, 337, 'Savings', 761151, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (41621, 336, 'Savings', 426437, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (23273, 333, 'Checking', 610807, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (91608, 330, 'Checking', 903227, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (26127, 327, 'Savings', 161158, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (15015, 324, 'Checking', 146676, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (74337, 322, 'Savings', 680239, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (66485, 317, 'Checking', 342806, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (3420, 314, 'Savings', 654492, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (52521, 308, 'Savings', 224704, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (83324, 304, 'Savings', 487441, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (75380, 298, 'Checking', 923263, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (93977, 291, 'Checking', 541457, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (33817, 286, 'Checking', 36075, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (44734, 278, 'Savings', 990594, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (46563, 271, 'Checking', 139601, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (41329, 263, 'Checking', 808338, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (76627, 256, 'Checking', 797415, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (29880, 249, 'Savings', 44203, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (26507, 240, 'Checking', 416456, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (38641, 231, 'Savings', 443784, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (3532, 224, 'Checking', 591846, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (75510, 214, 'Checking', 974204, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (26599, 206, 'Savings', 551644, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (53773, 199, 'Savings', 989135, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (16585, 191, 'Savings', 271226, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (91677, 184, 'Checking', 221852, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (89463, 176, 'Savings', 682331, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (94580, 170, 'Savings', 514349, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (9651, 164, 'Checking', 364450, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (62246, 158, 'Savings', 806512, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (67121, 151, 'Savings', 28923, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (527, 147, 'Checking', 418034, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (72917, 141, 'Checking', 339847, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (36541, 138, 'Checking', 705143, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (28103, 133, 'Savings', 887598, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (71427, 130, 'Savings', 747731, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (69467, 127, 'Checking', 830435, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (35548, 124, 'Checking', 401078, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (35808, 123, 'Checking', 624087, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (69493, 121, 'Checking', 945454, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (88425, 119, 'Savings', 689534, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (21106, 116, 'Savings', 178426, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (65227, 115, 'Savings', 624140, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (55280, 114, 'Checking', 196152, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (4544, 115, 'Savings', 974030, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (1498, 114, 'Savings', 945152, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (50224, 114, 'Checking', 466766, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (43767, 114, 'Savings', 797572, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (98716, 113, 'Checking', 719495, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (97709, 114, 'Savings', 785753, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (44289, 115, 'Savings', 913635, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (69406, 116, 'Savings', 194466, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (43978, 120, 'Savings', 133956, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (57611, 124, 'Checking', 769014, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (64989, 130, 'Checking', 498414, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (55472, 138, 'Checking', 890799, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (33813, 146, 'Savings', 977709, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (19245, 158, 'Checking', 528837, to_date('01-05-2024', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (22823, 170, 'Checking', 479153, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (10265, 183, 'Savings', 864123, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (14577, 198, 'Checking', 743419, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (71815, 211, 'Savings', 865056, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (1736, 225, 'Checking', 869374, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (33388, 236, 'Checking', 575536, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (26057, 247, 'Savings', 332319, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (22775, 256, 'Savings', 882665, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (23257, 264, 'Savings', 611365, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (25726, 270, 'Savings', 372699, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (94040, 277, 'Savings', 655363, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (99501, 279, 'Checking', 381901, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (48239, 280, 'Checking', 841716, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (87284, 280, 'Savings', 132909, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (80563, 280, 'Savings', 831589, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (20170, 281, 'Checking', 204534, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (12905, 282, 'Savings', 41182, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (31798, 283, 'Savings', 69831, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (51596, 286, 'Savings', 190960, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (89825, 289, 'Checking', 65244, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (69873, 293, 'Checking', 774095, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (61391, 300, 'Savings', 429904, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (95935, 307, 'Savings', 271900, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (74263, 316, 'Checking', 633781, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (52753, 323, 'Checking', 697735, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (32912, 333, 'Savings', 647114, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (15638, 340, 'Savings', 716428, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (85386, 348, 'Checking', 483978, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (4032, 352, 'Checking', 65410, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (88406, 357, 'Savings', 709075, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (11861, 362, 'Checking', 955805, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (5364, 364, 'Savings', 100404, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (23591, 366, 'Checking', 468144, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (33993, 366, 'Checking', 916702, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (39364, 366, 'Savings', 261946, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (2716, 367, 'Checking', 737217, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (48017, 366, 'Savings', 534776, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (98095, 365, 'Savings', 794867, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (31429, 364, 'Savings', 509743, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (7670, 360, 'Checking', 134515, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (81776, 355, 'Checking', 797785, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (97652, 349, 'Checking', 823143, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (40487, 340, 'Checking', 167330, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (82081, 330, 'Checking', 231189, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (65831, 319, 'Checking', 544138, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (84617, 306, 'Checking', 517195, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (46038, 291, 'Savings', 97783, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (57457, 274, 'Savings', 56854, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (6310, 258, 'Checking', 285513, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (69100, 242, 'Checking', 711641, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (7566, 226, 'Savings', 121297, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (38851, 210, 'Checking', 744932, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (56143, 197, 'Savings', 865503, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (39491, 186, 'Checking', 945324, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (67646, 176, 'Savings', 281905, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (57890, 168, 'Savings', 650761, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (35664, 161, 'Checking', 962788, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (1633, 156, 'Checking', 495865, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (78449, 154, 'Checking', 234019, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (25091, 151, 'Savings', 300684, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (55149, 151, 'Savings', 152217, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (26691, 151, 'Checking', 277602, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (88793, 149, 'Savings', 963036, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (97954, 149, 'Savings', 879587, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (23726, 150, 'Savings', 749364, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (82673, 151, 'Savings', 529046, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (39773, 152, 'Checking', 830871, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (84225, 154, 'Checking', 675194, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (34334, 156, 'Savings', 874564, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (43928, 159, 'Checking', 464368, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (76377, 162, 'Checking', 614971, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (26598, 164, 'Savings', 67357, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (89250, 169, 'Checking', 634133, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (23675, 173, 'Savings', 14272, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (98281, 178, 'Savings', 591797, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (66065, 185, 'Savings', 629612, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (32274, 192, 'Savings', 643111, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (79358, 200, 'Checking', 949366, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (6901, 207, 'Checking', 254564, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (68742, 217, 'Savings', 978970, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (21745, 226, 'Checking', 134015, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (12587, 235, 'Checking', 541419, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (52304, 246, 'Savings', 137294, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (77992, 256, 'Checking', 43580, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (45426, 268, 'Savings', 812539, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (5468, 279, 'Savings', 610893, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (12241, 289, 'Checking', 315026, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (48749, 298, 'Checking', 990873, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (88163, 308, 'Savings', 763248, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (57150, 318, 'Savings', 712408, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (76180, 328, 'Savings', 372300, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (56105, 334, 'Checking', 66293, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (38324, 342, 'Checking', 804729, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (75096, 349, 'Checking', 792178, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (33130, 357, 'Savings', 886712, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (95452, 362, 'Savings', 786569, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (43919, 365, 'Checking', 988398, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (821, 370, 'Savings', 939178, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (86343, 372, 'Checking', 730143, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (16289, 376, 'Checking', 275091, to_date('19-05-2024', 'dd-mm-yyyy'));
commit;
prompt 500 records committed...
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (54429, 378, 'Savings', 149909, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (74774, 381, 'Checking', 87551, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (43677, 381, 'Savings', 723971, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (56860, 383, 'Checking', 670852, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (9166, 384, 'Savings', 682888, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (70177, 385, 'Savings', 772531, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (56722, 385, 'Checking', 458360, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (71981, 385, 'Checking', 581764, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (1531, 385, 'Checking', 502854, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (83253, 383, 'Checking', 75118, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (57103, 382, 'Checking', 710218, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (55775, 380, 'Checking', 265256, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (11597, 378, 'Checking', 287793, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (96971, 374, 'Checking', 654494, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (28468, 372, 'Checking', 83236, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (51373, 366, 'Savings', 580574, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (33232, 360, 'Savings', 383649, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (76177, 354, 'Checking', 646839, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (38916, 348, 'Savings', 931020, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (43615, 339, 'Savings', 996206, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (1319, 333, 'Checking', 367816, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (7790, 327, 'Savings', 726787, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (34293, 320, 'Savings', 120289, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (42594, 317, 'Savings', 113847, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (26113, 312, 'Savings', 50404, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (21229, 309, 'Savings', 509837, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (98228, 305, 'Savings', 790064, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (33736, 304, 'Savings', 139458, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (19591, 304, 'Savings', 176349, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (33005, 302, 'Savings', 300060, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (63305, 302, 'Checking', 584312, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (17506, 302, 'Checking', 503842, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (41433, 302, 'Savings', 78261, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (99626, 298, 'Savings', 968387, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (7280, 292, 'Savings', 86786, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (75842, 281, 'Checking', 506091, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (40933, 267, 'Savings', 779367, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (55962, 250, 'Checking', 974019, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (25250, 233, 'Checking', 992756, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (62620, 219, 'Checking', 236009, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (48503, 208, 'Savings', 895272, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (70473, 202, 'Savings', 628974, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (40947, 199, 'Checking', 166932, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (81271, 197, 'Savings', 250290, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (24217, 198, 'Checking', 700760, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (26245, 197, 'Checking', 669921, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (46916, 195, 'Checking', 472740, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (40596, 191, 'Checking', 217962, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (82757, 184, 'Checking', 136507, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (97346, 178, 'Savings', 209228, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (21433, 170, 'Checking', 351259, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (65311, 162, 'Checking', 646656, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (35698, 159, 'Savings', 890414, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (94900, 157, 'Savings', 234488, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (57772, 156, 'Checking', 376991, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (57149, 157, 'Checking', 278069, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (53248, 154, 'Checking', 992150, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (87489, 148, 'Checking', 581774, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (58472, 139, 'Checking', 445346, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (56176, 132, 'Checking', 943700, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (22909, 130, 'Savings', 572983, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (97631, 130, 'Checking', 105967, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (16683, 130, 'Checking', 968178, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (78080, 132, 'Savings', 454994, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (34356, 134, 'Checking', 895129, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (81223, 138, 'Savings', 651850, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (76825, 141, 'Checking', 402201, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (99367, 146, 'Checking', 421738, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (79357, 154, 'Savings', 476239, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (68088, 164, 'Savings', 151941, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (58338, 174, 'Savings', 385429, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (8180, 183, 'Savings', 227209, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (91432, 195, 'Checking', 682204, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (38494, 204, 'Savings', 422171, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (93608, 213, 'Checking', 112667, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (55456, 221, 'Checking', 389166, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (62516, 226, 'Savings', 508147, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (78460, 230, 'Checking', 996985, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (56419, 233, 'Savings', 706057, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (6752, 237, 'Checking', 21520, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (15938, 238, 'Savings', 687721, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (84853, 237, 'Checking', 239993, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (78790, 237, 'Savings', 872378, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (61756, 238, 'Savings', 460553, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (32236, 237, 'Savings', 138946, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (16553, 240, 'Checking', 692047, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (43231, 240, 'Checking', 941160, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (94622, 242, 'Savings', 238195, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (90498, 243, 'Checking', 332814, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (33385, 246, 'Savings', 428633, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (95891, 250, 'Savings', 560191, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (8802, 254, 'Checking', 921308, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (50238, 260, 'Savings', 214262, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (26243, 264, 'Savings', 3082, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (83973, 272, 'Checking', 438286, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (28033, 280, 'Savings', 993080, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (63028, 286, 'Savings', 789319, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (25548, 295, 'Checking', 148742, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (23299, 302, 'Savings', 632175, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (66897, 313, 'Checking', 433907, to_date('18-05-2024', 'dd-mm-yyyy'));
commit;
prompt 600 records committed...
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (28014, 321, 'Savings', 466819, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (3662, 330, 'Savings', 155359, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (11589, 337, 'Savings', 830094, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (27977, 346, 'Savings', 267198, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (92738, 353, 'Savings', 456512, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (71126, 358, 'Savings', 751868, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (80181, 364, 'Checking', 792444, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (92083, 371, 'Savings', 439852, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (86587, 373, 'Savings', 825921, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (96493, 378, 'Savings', 414717, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (93109, 380, 'Checking', 996355, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (18826, 383, 'Checking', 517303, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (97585, 383, 'Savings', 874179, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (29310, 385, 'Savings', 695484, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (16937, 387, 'Savings', 783708, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (99474, 386, 'Checking', 929769, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (28683, 387, 'Checking', 747778, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (31032, 386, 'Checking', 99427, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (9607, 387, 'Savings', 942850, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (56240, 385, 'Savings', 436422, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (67435, 383, 'Checking', 36193, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (68165, 384, 'Checking', 935533, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (73242, 381, 'Savings', 432039, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (19043, 379, 'Savings', 502242, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (74679, 376, 'Checking', 759300, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (27179, 371, 'Savings', 775809, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (45206, 368, 'Savings', 184913, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (31951, 363, 'Savings', 81168, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (21059, 357, 'Checking', 387989, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (46901, 344, 'Checking', 907853, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (73766, 337, 'Savings', 579008, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (12055, 329, 'Savings', 879697, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (43050, 318, 'Savings', 75870, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (94436, 310, 'Checking', 258853, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (51745, 300, 'Savings', 397349, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (57740, 289, 'Checking', 905764, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (44032, 279, 'Savings', 818644, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (24487, 268, 'Checking', 712644, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (21541, 257, 'Savings', 696039, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (80906, 247, 'Savings', 64451, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (45906, 237, 'Checking', 879812, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (13940, 228, 'Checking', 752056, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (81105, 218, 'Checking', 573483, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (43236, 211, 'Checking', 679369, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (13271, 202, 'Checking', 918042, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (48175, 196, 'Checking', 713675, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (36975, 190, 'Savings', 692597, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (6748, 184, 'Checking', 674222, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (13222, 179, 'Savings', 633371, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (17512, 176, 'Savings', 919536, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (66260, 171, 'Savings', 663978, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (72682, 168, 'Checking', 235513, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ACCOUNTS (account_id, customer_id, account_type, balance, account_opening_date)
values (800, 8000, ' "Savings"', 4000, to_date('23-05-2024', 'dd-mm-yyyy'));
commit;
prompt 653 records loaded
prompt Loading CHECKS...
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (401, 98765, 200, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('21-05-2024', 'dd-mm-yyyy'), 1);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (402, 12345, 150, to_date('17-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 2);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (403, 67890, 250, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('22-05-2024', 'dd-mm-yyyy'), 3);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (404, 23456, 300, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('23-05-2024', 'dd-mm-yyyy'), 4);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (405, 34567, 450, to_date('21-05-2024', 'dd-mm-yyyy'), to_date('24-05-2024', 'dd-mm-yyyy'), 5);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (406, 45678, 500, to_date('22-05-2024', 'dd-mm-yyyy'), to_date('25-05-2024', 'dd-mm-yyyy'), 6);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (407, 56789, 550, to_date('23-05-2024', 'dd-mm-yyyy'), to_date('26-05-2024', 'dd-mm-yyyy'), 7);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (408, 67891, 600, to_date('24-05-2024', 'dd-mm-yyyy'), to_date('27-05-2024', 'dd-mm-yyyy'), 8);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (409, 78912, 650, to_date('25-05-2024', 'dd-mm-yyyy'), to_date('28-05-2024', 'dd-mm-yyyy'), 9);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (410, 89012, 700, to_date('26-05-2024', 'dd-mm-yyyy'), to_date('29-05-2024', 'dd-mm-yyyy'), 10);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1177, 272, 80, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 31916);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1235, 326, 337, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 504);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1653, 289, 421, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 41433);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1156, 166, 22, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 91677);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1674, 341, 596, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 77969);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1190, 114, 483, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 64575);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1407, 132, 997, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 95107);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1851, 347, 625, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 781);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1104, 282, 102, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 98);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1373, 326, 333, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 393);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1985, 245, 1, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 519);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1848, 74, 195, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 66696);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1304, 63, 666, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 57150);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1378, 332, 305, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 93109);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1064, 220, 346, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 833);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1316, 34, 576, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 79839);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1509, 251, 623, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 75510);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1809, 47, 166, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 31429);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1797, 123, 882, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 96493);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1935, 37, 291, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 930);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1576, 282, 530, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 146);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1480, 398, 995, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 148);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1391, 199, 476, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 741);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1179, 133, 642, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 18826);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1437, 18, 691, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 33005);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1382, 208, 811, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 822);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1964, 219, 243, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 84225);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1958, 46, 669, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 64989);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1969, 25, 974, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 14577);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1679, 36, 797, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 35664);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1086, 295, 693, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 73412);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1682, 167, 801, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 430);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1361, 189, 653, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 56240);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1202, 29, 772, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 907);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1739, 92, 29, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 497);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1036, 257, 952, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 777);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1358, 115, 336, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 53248);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1427, 36, 149, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 28683);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1974, 56, 998, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 97364);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1349, 189, 756, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 83978);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1072, 375, 524, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 55595);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1364, 211, 443, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 654);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1528, 217, 979, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 28683);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1526, 213, 848, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 477);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1871, 277, 727, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 70);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1026, 333, 846, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 97709);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1482, 322, 628, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 19245);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1539, 343, 226, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 74679);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1323, 160, 150, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 39);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1457, 263, 858, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 210);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1992, 92, 101, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 48017);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1489, 68, 665, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 46450);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1213, 212, 933, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 130);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1310, 319, 990, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 40487);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1078, 7, 820, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 88163);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1219, 397, 190, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 98);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1610, 218, 960, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 55237);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1008, 375, 516, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 474);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1484, 210, 814, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 106);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1502, 211, 626, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 94616);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1999, 223, 225, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 74774);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1454, 83, 302, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 3310);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1585, 338, 622, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 256);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1780, 163, 196, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 41440);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1483, 133, 769, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 68165);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1300, 236, 688, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 2);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1370, 280, 753, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 69644);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1473, 84, 185, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 892);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1045, 232, 171, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 61391);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1795, 27, 433, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 69467);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1486, 264, 712, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 72917);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1864, 226, 602, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 35548);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1174, 265, 732, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 21059);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1335, 255, 588, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 26243);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1449, 217, 332, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 114);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1701, 12, 449, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 3662);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1635, 89, 278, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 157);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1245, 295, 204, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 308);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1095, 62, 259, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 26691);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1351, 178, 495, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 73766);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1850, 29, 406, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 5364);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1698, 154, 832, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 685);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1434, 246, 912, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 91);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1147, 213, 662, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 75);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1062, 175, 286, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 491);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1617, 319, 464, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 47);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1058, 274, 83, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 196);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1735, 279, 181, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 67121);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1725, 291, 655, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 93415);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1196, 139, 934, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 57740);
commit;
prompt 100 records committed...
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1718, 177, 146, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 35698);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1760, 180, 775, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 42448);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1957, 228, 920, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 148);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1945, 5, 106, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 33232);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1326, 145, 578, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 46450);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1237, 158, 551, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 930);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1940, 294, 698, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 564);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1083, 225, 884, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 99474);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1206, 175, 786, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 29310);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1813, 10, 243, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 16683);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1534, 146, 878, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 10);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1444, 73, 423, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 56860);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1230, 356, 241, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 22091);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1579, 45, 346, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 562);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1438, 137, 884, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 44336);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1837, 15, 40, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 93);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1181, 25, 828, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 63381);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1533, 15, 684, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 93109);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1549, 290, 571, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 98716);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1700, 65, 535, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 168);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1608, 366, 48, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 75962);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1199, 359, 231, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 94900);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1399, 228, 781, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 61709);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1297, 120, 689, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 2);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1259, 208, 894, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 44734);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1941, 201, 773, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 71);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1359, 287, 848, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 6224);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1425, 340, 770, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 26599);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1612, 24, 100, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 67435);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1400, 294, 662, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 21745);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1732, 15, 901, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 23591);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1899, 343, 624, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 93977);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1126, 26, 218, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 153);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1724, 291, 822, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 930);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1624, 189, 922, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 22091);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1887, 31, 282, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 139);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1129, 77, 716, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 3);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1178, 221, 984, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 15938);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1927, 207, 651, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 58338);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1499, 214, 570, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 75380);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1754, 307, 705, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 75962);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1678, 344, 888, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 45906);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1507, 42, 406, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 43928);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1918, 327, 25, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 50238);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1429, 327, 764, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 17506);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1916, 233, 559, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 34356);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1748, 324, 378, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 55472);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1257, 398, 462, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 59685);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1971, 148, 767, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 747);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1900, 312, 381, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 38916);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1266, 176, 268, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 127);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1831, 273, 240, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 75510);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1669, 358, 79, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 286);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1233, 24, 362, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 813);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1031, 258, 264, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 24487);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1719, 362, 572, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 14577);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1942, 214, 817, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 85401);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1476, 149, 979, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 123);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1053, 126, 87, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 52521);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1405, 107, 393, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 116);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1541, 80, 172, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 43767);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1557, 28, 578, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 43919);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1333, 169, 795, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 57103);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1253, 126, 332, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 22716);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1099, 386, 420, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 289);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1379, 390, 5, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 44289);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1639, 19, 240, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 3310);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1729, 310, 771, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 64989);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1329, 397, 263, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 22252);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1243, 151, 971, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 79);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1144, 257, 869, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 17380);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1527, 32, 115, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 41547);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1767, 229, 452, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 7670);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1280, 138, 469, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 34032);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1317, 387, 692, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 61756);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1792, 360, 147, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 73766);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1162, 249, 718, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 65831);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1426, 357, 792, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 907);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1451, 120, 615, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 79358);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1163, 349, 620, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 18826);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1168, 309, 786, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 163);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1314, 265, 351, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 42448);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1931, 258, 94, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 54429);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1120, 327, 228, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 26598);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1276, 353, 125, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 886);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1169, 290, 4, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 94436);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1084, 310, 542, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 144);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1933, 117, 998, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 28548);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1531, 228, 541, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 148);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1472, 213, 639, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 36975);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1303, 158, 686, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 491);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1764, 125, 751, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 37587);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1228, 338, 555, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 285);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1487, 127, 452, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 45206);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1745, 331, 227, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 25250);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1289, 218, 71, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 122);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1180, 158, 348, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 23299);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1214, 220, 100, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 127);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1835, 347, 770, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 55237);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1296, 267, 997, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 81223);
commit;
prompt 200 records committed...
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1175, 155, 781, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 94436);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1028, 296, 594, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 84);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1801, 396, 997, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 95);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1714, 69, 607, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 22716);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1759, 390, 517, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 3420);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1471, 307, 335, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 92);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1978, 366, 52, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 58338);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1464, 71, 475, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 69603);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1717, 270, 83, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 48749);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1387, 264, 414, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 697);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1417, 43, 70, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 56419);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1946, 47, 380, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 136);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1068, 286, 605, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 81223);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1881, 321, 6, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 22091);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1687, 267, 593, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 37587);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1866, 51, 80, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 837);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1490, 294, 472, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 63028);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1914, 90, 835, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 12905);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1406, 288, 357, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 75962);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1905, 43, 594, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 87);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1121, 16, 536, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 357);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1227, 263, 781, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 11929);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1034, 302, 592, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 11525);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1295, 135, 502, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 23257);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1712, 164, 752, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 813);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1421, 209, 191, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 786);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1374, 29, 95, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 74263);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1135, 141, 548, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 33130);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1478, 192, 888, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 19043);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1934, 28, 801, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 375);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1862, 282, 127, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 17506);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1056, 130, 683, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 93608);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1812, 113, 240, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 51596);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1823, 63, 942, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 206);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1819, 109, 159, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 140);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1143, 42, 953, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 12055);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1415, 189, 944, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 111);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1519, 53, 4, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 846);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1898, 205, 305, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 17380);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1273, 304, 820, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 51745);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1385, 94, 530, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 45426);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1059, 93, 621, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 45906);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1842, 282, 323, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 125);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1803, 127, 117, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 692);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1251, 222, 805, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 644);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1929, 371, 649, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 29);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1029, 106, 742, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 85);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1659, 344, 354, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 51596);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1836, 241, 144, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 103);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1446, 327, 718, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 83973);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1569, 353, 132, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 321);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1108, 230, 892, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 43677);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1902, 39, 579, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 55237);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1726, 359, 631, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 86);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1082, 377, 640, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 781);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1994, 19, 779, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 26080);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1501, 41, 904, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 77451);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1939, 395, 889, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 48749);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1543, 8, 543, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 66065);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1722, 175, 121, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 838);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1574, 194, 292, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 78790);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1857, 239, 22, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 92738);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1782, 97, 964, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 66485);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1996, 120, 272, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 727);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1861, 67, 636, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 771);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1859, 248, 841, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 53773);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1352, 300, 985, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 522);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1122, 96, 148, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 100);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1103, 98, 903, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 69);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1928, 275, 254, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 42594);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1629, 267, 367, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 70177);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1877, 194, 835, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 102);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1855, 108, 729, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 69644);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1200, 221, 817, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 56143);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1167, 16, 426, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 63532);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1459, 290, 48, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 92083);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1133, 379, 904, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 74);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1751, 262, 638, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 519);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1715, 115, 349, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 58472);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1398, 195, 328, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 26245);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1556, 310, 243, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 527);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1445, 361, 908, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 92458);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1912, 347, 389, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 29);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1197, 350, 987, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 91677);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1260, 109, 667, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 3662);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1244, 397, 48, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 621);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1986, 91, 788, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 477);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1160, 203, 592, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 55456);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1923, 341, 689, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 674);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1741, 287, 827, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 45428);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1388, 362, 460, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 32274);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1572, 380, 406, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 97364);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1176, 323, 917, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 747);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1909, 171, 110, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 69493);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1628, 88, 218, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 28548);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1203, 143, 929, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 880);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1354, 120, 207, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 7670);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1152, 284, 510, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 55962);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1066, 262, 539, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 98228);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1272, 208, 483, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 82081);
commit;
prompt 300 records committed...
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1189, 193, 656, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 52521);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1402, 250, 522, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 979);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1829, 294, 835, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 58276);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1731, 238, 641, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 109);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1602, 9, 481, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 659);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1728, 8, 906, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 342);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1512, 172, 275, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 73);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1993, 319, 354, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 357);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1054, 368, 562, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 57611);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1138, 166, 840, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 171);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1132, 341, 658, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 60340);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1344, 1, 417, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 6310);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1395, 344, 658, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 837);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1885, 383, 672, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 28014);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1621, 172, 85, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 74);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1422, 57, 628, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 55962);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1907, 285, 763, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 97631);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1311, 347, 933, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 66696);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1262, 149, 398, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 42594);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1614, 24, 514, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 167);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1810, 284, 537, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 48239);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1079, 97, 453, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 6748);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1014, 340, 864, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 80080);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1737, 99, 941, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 56143);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1961, 62, 243, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 41440);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1021, 392, 9, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 134);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1755, 325, 52, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 17506);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1778, 96, 367, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 485);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1865, 292, 637, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 85401);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1932, 356, 29, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 95452);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1035, 210, 969, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 135);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1110, 230, 92, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 48239);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1319, 313, 992, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 98352);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1709, 42, 635, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 48);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1766, 223, 772, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 88793);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1661, 238, 698, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 5364);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1496, 101, 557, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 98352);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1770, 128, 243, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 21059);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1330, 360, 393, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 43236);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1442, 297, 919, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 29310);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1485, 382, 678, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 876);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1606, 360, 159, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 97);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1611, 317, 162, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 91432);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1915, 92, 332, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 13271);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1616, 56, 673, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 418);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1981, 391, 194, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 31798);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1247, 148, 781, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 333);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1265, 298, 404, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 46450);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1822, 125, 522, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 15638);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1544, 280, 90, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 125);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1615, 87, 298, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 131);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1131, 177, 334, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 41547);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1640, 188, 935, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 770);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1594, 371, 50, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 38);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1456, 185, 112, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 75);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1552, 90, 923, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 172);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1953, 221, 2, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 799);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1802, 177, 796, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 23299);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1962, 340, 324, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 36975);
insert into CHECKS (check_id, check_number, amount, issue_date, clearing_date, account_id)
values (1625, 382, 465, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 43919);
commit;
prompt 360 records loaded
prompt Loading CREDIT_CARDS...
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (301, 123456789012, 'Visa', to_date('20-05-2027', 'dd-mm-yyyy'), 15000, 1);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (302, 987654321012, 'Mastercard', to_date('20-05-2026', 'dd-mm-yyyy'), 10000, 2);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (303, 111122223333, 'Visa', to_date('30-06-2028', 'dd-mm-yyyy'), 12000, 3);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (304, 444455556666, 'Mastercard', to_date('15-04-2025', 'dd-mm-yyyy'), 8000, 4);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (305, 777788889999, 'Visa', to_date('22-08-2027', 'dd-mm-yyyy'), 9000, 5);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (306, 123443215678, 'Mastercard', to_date('31-12-2026', 'dd-mm-yyyy'), 11000, 6);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (307, 876543219876, 'Visa', to_date('01-01-2029', 'dd-mm-yyyy'), 14000, 7);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (308, 112233445566, 'Mastercard', to_date('20-07-2026', 'dd-mm-yyyy'), 13000, 8);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (309, 998877665544, 'Visa', to_date('25-11-2027', 'dd-mm-yyyy'), 16000, 9);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (310, 334455667788, 'Mastercard', to_date('30-05-2025', 'dd-mm-yyyy'), 7000, 10);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (76249, 9427907, 'mastercard', to_date('01-05-2024', 'dd-mm-yyyy'), 6290, 65893);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (19012, 9252370, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 6262, 14577);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (33795, 1634604, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 6157, 163);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (75548, 1953775, 'mastercard', to_date('07-05-2024', 'dd-mm-yyyy'), 5938, 500);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (64505, 7537240, 'visa', to_date('06-05-2024', 'dd-mm-yyyy'), 5593, 22252);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (92580, 5919936, 'mastercard', to_date('07-05-2024', 'dd-mm-yyyy'), 5157, 421);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (56128, 3997988, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 4721, 69603);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (40997, 4120698, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 4375, 91608);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (98262, 3428629, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 4158, 46450);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (46826, 2613711, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 4051, 66065);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (61247, 2340738, 'debit', to_date('05-05-2024', 'dd-mm-yyyy'), 4025, 98328);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (32218, 4390922, 'visa', to_date('12-05-2024', 'dd-mm-yyyy'), 4025, 42594);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (95792, 9617656, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 3946, 130);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (82866, 5777780, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 3610, 167);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (21725, 6925616, 'mastercard', to_date('05-05-2024', 'dd-mm-yyyy'), 3095, 22252);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (473, 3575655, 'mastercard', to_date('06-05-2024', 'dd-mm-yyyy'), 2759, 25726);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (47890, 3846814, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 2681, 57103);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (21503, 5207811, 'visa', to_date('05-05-2024', 'dd-mm-yyyy'), 2681, 109);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (22662, 4721521, 'visa', to_date('16-05-2024', 'dd-mm-yyyy'), 2720, 46038);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (56002, 2238491, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 2864, 97585);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (23780, 2228725, 'visa', to_date('01-05-2024', 'dd-mm-yyyy'), 3159, 821);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (95453, 6813395, 'mastercard', to_date('15-05-2024', 'dd-mm-yyyy'), 3639, 89);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (37255, 5070376, 'debit', to_date('12-05-2024', 'dd-mm-yyyy'), 4301, 13222);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (62639, 8854234, 'mastercard', to_date('15-05-2024', 'dd-mm-yyyy'), 5078, 89250);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (6769, 7147218, 'visa', to_date('15-05-2024', 'dd-mm-yyyy'), 5856, 92458);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (60791, 6083984, 'visa', to_date('06-05-2024', 'dd-mm-yyyy'), 6516, 79357);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (97300, 2090589, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 6996, 13271);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (44013, 1508977, 'visa', to_date('06-05-2024', 'dd-mm-yyyy'), 7291, 33813);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (69910, 3704136, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 7435, 95935);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (4993, 7534934, 'visa', to_date('15-05-2024', 'dd-mm-yyyy'), 7474, 25548);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (54866, 3273686, 'mastercard', to_date('06-05-2024', 'dd-mm-yyyy'), 7475, 67121);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (86538, 6891610, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 7496, 132);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (27236, 2727917, 'visa', to_date('06-05-2024', 'dd-mm-yyyy'), 7587, 56176);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (67744, 4633012, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 7727, 36530);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (61103, 8730953, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 7819, 157);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (43214, 8832169, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 7840, 36541);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (28735, 6118056, 'debit', to_date('12-05-2024', 'dd-mm-yyyy'), 7840, 72);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (96500, 9771131, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 7827, 1736);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (29057, 9967894, 'visa', to_date('06-05-2024', 'dd-mm-yyyy'), 7780, 55280);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (14308, 9531472, 'mastercard', to_date('16-05-2024', 'dd-mm-yyyy'), 7687, 19591);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (19763, 1947613, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 7535, 485);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (34531, 8212897, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 7318, 7790);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (94396, 5953434, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 7037, 56419);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (58017, 2515140, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 6709, 43677);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (3270, 1098948, 'mastercard', to_date('07-05-2024', 'dd-mm-yyyy'), 6362, 485);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (76991, 6007478, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 6033, 859);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (14843, 8258190, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 5752, 84596);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (35363, 4764287, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 5534, 170);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (40864, 7051292, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 5384, 68088);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (92241, 4626580, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 5291, 692);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (17781, 4713929, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 5242, 67);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (28966, 7667641, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 5230, 143);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (97434, 1053679, 'debit', to_date('06-05-2024', 'dd-mm-yyyy'), 5229, 46901);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (35378, 8579848, 'visa', to_date('07-05-2024', 'dd-mm-yyyy'), 5205, 13222);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (64568, 9157317, 'mastercard', to_date('06-05-2024', 'dd-mm-yyyy'), 5104, 85401);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (61747, 1965390, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 4948, 497);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (32626, 4180327, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 4844, 874);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (95584, 2073317, 'visa', to_date('12-05-2024', 'dd-mm-yyyy'), 4821, 206);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (92082, 9328807, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 4820, 179);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (28019, 4601408, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 4799, 78790);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (13374, 4073023, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 4715, 620);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (23388, 1184935, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 4545, 838);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (29578, 6160140, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 4267, 40487);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (43816, 2392922, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 3886, 57150);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (56015, 8888290, 'mastercard', to_date('06-05-2024', 'dd-mm-yyyy'), 3437, 66645);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (71166, 7035783, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 2988, 43767);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (91958, 1068354, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 2607, 285);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (64573, 9768939, 'visa', to_date('19-05-2024', 'dd-mm-yyyy'), 2331, 69406);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (74284, 7144581, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 2159, 747);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (26597, 4452982, 'visa', to_date('15-05-2024', 'dd-mm-yyyy'), 2075, 74);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (6117, 6201725, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 2052, 156);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (57376, 9108574, 'mastercard', to_date('01-05-2024', 'dd-mm-yyyy'), 2053, 838);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (38582, 3011872, 'visa', to_date('07-05-2024', 'dd-mm-yyyy'), 2141, 46916);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (13670, 9754414, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 2497, 26127);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (68907, 3447235, 'mastercard', to_date('05-05-2024', 'dd-mm-yyyy'), 3213, 66260);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (14452, 2330245, 'mastercard', to_date('01-05-2024', 'dd-mm-yyyy'), 4113, 905);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (47125, 2918202, 'visa', to_date('05-05-2024', 'dd-mm-yyyy'), 4828, 761);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (59999, 1389733, 'mastercard', to_date('15-05-2024', 'dd-mm-yyyy'), 5185, 41329);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (4979, 2876162, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 5272, 45428);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (67406, 5274263, 'debit', to_date('06-05-2024', 'dd-mm-yyyy'), 5272, 19043);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (51392, 5622204, 'visa', to_date('05-05-2024', 'dd-mm-yyyy'), 5240, 89825);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (20204, 2973428, 'mastercard', to_date('01-05-2024', 'dd-mm-yyyy'), 5104, 97346);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (79154, 9949553, 'visa', to_date('19-05-2024', 'dd-mm-yyyy'), 4890, 92);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (14679, 4783764, 'visa', to_date('01-05-2024', 'dd-mm-yyyy'), 4753, 82081);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (12731, 9378477, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 4722, 73549);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (4548, 5356766, 'visa', to_date('15-05-2024', 'dd-mm-yyyy'), 4722, 94436);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (98012, 4333702, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 4787, 668);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (50478, 9382970, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 5068, 52753);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (2308, 2769805, 'mastercard', to_date('07-05-2024', 'dd-mm-yyyy'), 5502, 15938);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (19725, 7695721, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 5784, 99474);
commit;
prompt 100 records committed...
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (64588, 3650487, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 5851, 78790);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (90799, 5785340, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 5850, 4798);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (22299, 6834394, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 5765, 21745);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (75022, 3477717, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 5401, 45906);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (719, 9110637, 'visa', to_date('05-05-2024', 'dd-mm-yyyy'), 4837, 857);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (88692, 4293231, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 4473, 893);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (14039, 9757756, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 4386, 5468);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (83767, 1492453, 'visa', to_date('12-05-2024', 'dd-mm-yyyy'), 4386, 98095);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (60568, 4691558, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 4415, 67121);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (50673, 5773494, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 4526, 80906);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (54263, 9481165, 'debit', to_date('12-05-2024', 'dd-mm-yyyy'), 4754, 56419);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (72351, 4022868, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 5079, 95891);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (74904, 8580381, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 5405, 44367);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (27108, 4368128, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 5634, 58472);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (4835, 2513219, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 5772, 564);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (87108, 5561195, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 5773, 770);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (58741, 4056593, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 5746, 96);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (75777, 4677173, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 5636, 3662);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (43494, 5778314, 'mastercard', to_date('01-05-2024', 'dd-mm-yyyy'), 5406, 33130);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (95476, 1468598, 'mastercard', to_date('06-05-2024', 'dd-mm-yyyy'), 5060, 876);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (16330, 3346087, 'visa', to_date('12-05-2024', 'dd-mm-yyyy'), 4658, 65831);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (63580, 8757742, 'debit', to_date('12-05-2024', 'dd-mm-yyyy'), 4308, 550);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (19113, 1398332, 'mastercard', to_date('16-05-2024', 'dd-mm-yyyy'), 4082, 11589);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (20742, 5203057, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 3971, 20170);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (16694, 8028156, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 3943, 98);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (76350, 1724104, 'visa', to_date('12-05-2024', 'dd-mm-yyyy'), 3942, 150);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (985, 3322344, 'debit', to_date('06-05-2024', 'dd-mm-yyyy'), 3928, 146);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (25957, 2444519, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 3866, 93);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (32649, 6844179, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 3768, 621);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (84609, 6084528, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 3705, 63101);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (97209, 1498858, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 3691, 67619);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (2039, 2421837, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 3690, 66260);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (58139, 7002631, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 3720, 5179);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (21308, 1150493, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 3831, 135);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (10622, 6710886, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 4063, 66485);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (27687, 3215248, 'visa', to_date('15-05-2024', 'dd-mm-yyyy'), 4427, 23726);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (30822, 6237624, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 4889, 65311);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (43021, 2910156, 'visa', to_date('16-05-2024', 'dd-mm-yyyy'), 5352, 22716);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (45038, 6225090, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 5717, 3310);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (57836, 1841188, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 5948, 9607);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (59745, 2261858, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 6061, 169);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (70970, 3847046, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 6089, 39364);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (55649, 9723457, 'debit', to_date('12-05-2024', 'dd-mm-yyyy'), 6090, 159);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (98104, 5746548, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 6105, 136);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (8919, 4759652, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 6158, 90498);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (88018, 4571296, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 6262, 87284);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (44409, 1532605, 'visa', to_date('12-05-2024', 'dd-mm-yyyy'), 6430, 559);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (52451, 4975050, 'debit', to_date('05-05-2024', 'dd-mm-yyyy'), 6671, 36530);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (60984, 7488605, 'visa', to_date('07-05-2024', 'dd-mm-yyyy'), 6990, 89463);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (82365, 6923675, 'debit', to_date('06-05-2024', 'dd-mm-yyyy'), 7370, 22684);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (78955, 3020226, 'visa', to_date('16-05-2024', 'dd-mm-yyyy'), 7788, 585);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (45163, 9701373, 'debit', to_date('06-05-2024', 'dd-mm-yyyy'), 8207, 13222);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (51644, 1522731, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 8588, 88);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (52298, 7105804, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 8905, 880);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (85639, 9665861, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 9149, 95);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (14213, 3534825, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 9315, 69406);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (64457, 6940040, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 9420, 7);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (44926, 7792940, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 9474, 880);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (50841, 5930119, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 9487, 777);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (7019, 8695615, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 9487, 61709);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (35350, 7080567, 'mastercard', to_date('16-05-2024', 'dd-mm-yyyy'), 9469, 124);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (94498, 2395983, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 9406, 43928);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (11282, 2762990, 'mastercard', to_date('07-05-2024', 'dd-mm-yyyy'), 9281, 809);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (45728, 7549034, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 9074, 398);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (62065, 8441228, 'mastercard', to_date('06-05-2024', 'dd-mm-yyyy'), 8781, 357);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (38067, 9296462, 'visa', to_date('19-05-2024', 'dd-mm-yyyy'), 8410, 51373);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (96723, 3650354, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 7990, 93608);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (41654, 6143929, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 7570, 39491);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (80408, 2104493, 'visa', to_date('01-05-2024', 'dd-mm-yyyy'), 7199, 40933);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (88609, 5565000, 'mastercard', to_date('05-05-2024', 'dd-mm-yyyy'), 6906, 33736);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (68656, 4686871, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 6700, 827);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (39621, 4927223, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 6575, 15638);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (25150, 7925218, 'mastercard', to_date('06-05-2024', 'dd-mm-yyyy'), 6511, 89463);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (24585, 6036384, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 6494, 28468);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (36453, 2280647, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 6493, 668);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (22238, 8181029, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 6553, 83978);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (50729, 3978071, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 6805, 973);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (36293, 3649169, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 7196, 97);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (38906, 7842847, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 7447, 125);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (6422, 5578293, 'mastercard', to_date('01-05-2024', 'dd-mm-yyyy'), 7507, 79839);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (9087, 4453661, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 7506, 38851);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (42463, 3908315, 'debit', to_date('06-05-2024', 'dd-mm-yyyy'), 7487, 33388);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (67626, 7175620, 'visa', to_date('12-05-2024', 'dd-mm-yyyy'), 7421, 61391);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (69110, 7425754, 'visa', to_date('01-05-2024', 'dd-mm-yyyy'), 7293, 48175);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (56729, 7912035, 'mastercard', to_date('15-05-2024', 'dd-mm-yyyy'), 7083, 89463);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (73700, 6975500, 'debit', to_date('06-05-2024', 'dd-mm-yyyy'), 6780, 48503);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (83618, 8535088, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 6385, 93109);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (2660, 8696965, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 5908, 42594);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (5856, 4143292, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 5387, 11525);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (97249, 4899179, 'mastercard', to_date('15-05-2024', 'dd-mm-yyyy'), 4866, 26691);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (95416, 8772875, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 4390, 100);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (85819, 2280828, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 3992, 94833);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (8161, 5768695, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 3691, 137);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (6984, 1784067, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 3482, 668);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (68713, 5109250, 'mastercard', to_date('05-05-2024', 'dd-mm-yyyy'), 3352, 81776);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (17870, 7285263, 'debit', to_date('16-05-2024', 'dd-mm-yyyy'), 3286, 77969);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (39547, 2513916, 'debit', to_date('05-05-2024', 'dd-mm-yyyy'), 3268, 145);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (63149, 7575761, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 3266, 97709);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (8805, 7631318, 'visa', to_date('19-05-2024', 'dd-mm-yyyy'), 3316, 777);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (45302, 8148587, 'visa', to_date('06-05-2024', 'dd-mm-yyyy'), 3528, 485);
commit;
prompt 200 records committed...
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (57888, 2150720, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 3920, 55775);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (31975, 7342818, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 4312, 136);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (28287, 4702053, 'visa', to_date('01-05-2024', 'dd-mm-yyyy'), 4524, 97652);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (48277, 1690686, 'mastercard', to_date('01-05-2024', 'dd-mm-yyyy'), 4573, 307);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (64220, 3855324, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 4574, 16937);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (49726, 5029408, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 4604, 3);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (58115, 9049826, 'visa', to_date('15-05-2024', 'dd-mm-yyyy'), 4720, 26245);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (88477, 8125100, 'mastercard', to_date('05-05-2024', 'dd-mm-yyyy'), 4957, 29);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (48232, 8248308, 'visa', to_date('01-05-2024', 'dd-mm-yyyy'), 5340, 58350);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (84925, 2894794, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 5848, 75962);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (16083, 6823960, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 6409, 117);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (13723, 5485315, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 6917, 905);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (27903, 6507432, 'mastercard', to_date('15-05-2024', 'dd-mm-yyyy'), 7300, 31739);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (62400, 7733796, 'debit', to_date('12-05-2024', 'dd-mm-yyyy'), 7538, 33817);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (43703, 4387685, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 7653, 89250);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (69767, 8261739, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 7683, 74774);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (78054, 2899109, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 7684, 66696);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (59544, 2541642, 'visa', to_date('01-05-2024', 'dd-mm-yyyy'), 7682, 30635);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (26081, 4859137, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 7681, 210);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (6433, 9528560, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 7676, 78790);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (73662, 9921741, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 7674, 38494);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (33176, 9234965, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 7673, 20539);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (87027, 4385234, 'mastercard', to_date('01-05-2024', 'dd-mm-yyyy'), 7674, 73549);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (70244, 3265835, 'visa', to_date('12-05-2024', 'dd-mm-yyyy'), 7648, 48239);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (88466, 7913813, 'visa', to_date('15-05-2024', 'dd-mm-yyyy'), 7551, 76377);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (82836, 2753070, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 7348, 121);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (41482, 3922576, 'mastercard', to_date('07-05-2024', 'dd-mm-yyyy'), 7040, 637);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (29020, 6162356, 'debit', to_date('05-05-2024', 'dd-mm-yyyy'), 6684, 41440);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (87200, 9303879, 'mastercard', to_date('07-05-2024', 'dd-mm-yyyy'), 6375, 73766);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (14705, 6779751, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 6173, 67121);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (17179, 1201657, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 6074, 644);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (36263, 1603357, 'visa', to_date('01-05-2024', 'dd-mm-yyyy'), 6050, 148);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (17941, 9126210, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 6051, 123);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (73179, 5051467, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 6003, 93);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (20004, 7470423, 'visa', to_date('06-05-2024', 'dd-mm-yyyy'), 5820, 28014);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (48468, 2117672, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 5445, 49249);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (48564, 1869410, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 4849, 55149);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (94542, 3592455, 'mastercard', to_date('07-05-2024', 'dd-mm-yyyy'), 4100, 33130);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (10304, 8888373, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 3349, 23257);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (51899, 7609474, 'visa', to_date('07-05-2024', 'dd-mm-yyyy'), 2753, 97);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (5859, 8997374, 'visa', to_date('06-05-2024', 'dd-mm-yyyy'), 2378, 73766);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (67671, 3506764, 'visa', to_date('05-05-2024', 'dd-mm-yyyy'), 2195, 80);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (40693, 3534214, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 2148, 886);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (37396, 8936913, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 2147, 216);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (93832, 2656779, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 2182, 67);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (95854, 6227937, 'visa', to_date('12-05-2024', 'dd-mm-yyyy'), 2312, 48749);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (10939, 9059054, 'mastercard', to_date('05-05-2024', 'dd-mm-yyyy'), 2579, 70473);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (3899, 9279820, 'visa', to_date('16-05-2024', 'dd-mm-yyyy'), 3009, 74774);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (1405, 3317182, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 3583, 64575);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (95012, 4540813, 'debit', to_date('06-05-2024', 'dd-mm-yyyy'), 4215, 430);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (13976, 9227064, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 4789, 562);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (10618, 7752686, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 5218, 125);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (20200, 1125832, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 5486, 25091);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (199, 4978505, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 5616, 387);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (23511, 7544012, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 5650, 843);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (11794, 6987696, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 5650, 85);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (42374, 5394568, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 5556, 110);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (75403, 9186052, 'mastercard', to_date('15-05-2024', 'dd-mm-yyyy'), 5164, 56860);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (43636, 5182848, 'visa', to_date('19-05-2024', 'dd-mm-yyyy'), 4554, 47);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (30052, 1734468, 'mastercard', to_date('01-05-2024', 'dd-mm-yyyy'), 4161, 153);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (93010, 9750363, 'debit', to_date('16-05-2024', 'dd-mm-yyyy'), 4067, 79);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (24235, 2963898, 'mastercard', to_date('05-05-2024', 'dd-mm-yyyy'), 4067, 210);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (16048, 7664555, 'mastercard', to_date('16-05-2024', 'dd-mm-yyyy'), 4177, 21229);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (15670, 2658814, 'visa', to_date('06-05-2024', 'dd-mm-yyyy'), 4635, 96493);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (69693, 7995749, 'visa', to_date('16-05-2024', 'dd-mm-yyyy'), 5487, 261);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (41326, 1348938, 'visa', to_date('06-05-2024', 'dd-mm-yyyy'), 6339, 97709);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (65342, 8988058, 'visa', to_date('16-05-2024', 'dd-mm-yyyy'), 6795, 8802);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (99668, 7522130, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 6905, 57611);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (55131, 2399736, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 6905, 83978);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (24618, 3633397, 'visa', to_date('06-05-2024', 'dd-mm-yyyy'), 6928, 43231);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (91994, 1127049, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 7030, 44336);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (50686, 1820667, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 7188, 108);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (74435, 3141782, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 7289, 859);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (99456, 9424102, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 7314, 609);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (81065, 6265170, 'visa', to_date('07-05-2024', 'dd-mm-yyyy'), 7313, 118);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (88469, 4943949, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 7300, 22716);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (41766, 3538753, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 7257, 94900);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (27875, 3120611, 'visa', to_date('16-05-2024', 'dd-mm-yyyy'), 7173, 600);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (25813, 1252598, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 7042, 308);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (94268, 2638547, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 6852, 8);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (41622, 5574582, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 6595, 16683);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (51483, 1007614, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 6274, 33391);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (71034, 1138395, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 5891, 3334);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (34518, 1664002, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 5459, 62516);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (45269, 1419620, 'visa', to_date('06-05-2024', 'dd-mm-yyyy'), 5001, 22684);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (97496, 4414878, 'mastercard', to_date('16-05-2024', 'dd-mm-yyyy'), 4542, 12241);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (67660, 5628128, 'visa', to_date('05-05-2024', 'dd-mm-yyyy'), 4110, 172);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (78208, 3485563, 'debit', to_date('05-05-2024', 'dd-mm-yyyy'), 3727, 62246);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (14053, 8273324, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 3404, 21813);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (80505, 2872381, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 3149, 281);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (23442, 4730369, 'debit', to_date('12-05-2024', 'dd-mm-yyyy'), 2958, 80);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (2653, 6954285, 'mastercard', to_date('01-05-2024', 'dd-mm-yyyy'), 2827, 333);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (19738, 1385505, 'visa', to_date('19-05-2024', 'dd-mm-yyyy'), 2743, 91608);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (61277, 9566412, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 2700, 727);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (26989, 5188610, 'visa', to_date('19-05-2024', 'dd-mm-yyyy'), 2687, 781);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (89679, 6988664, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 2686, 94616);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (71299, 1831369, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 2726, 40596);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (55590, 1228259, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 2894, 13271);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (94651, 9164325, 'mastercard', to_date('15-05-2024', 'dd-mm-yyyy'), 3151, 500);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (88270, 9312490, 'debit', to_date('05-05-2024', 'dd-mm-yyyy'), 3318, 48);
commit;
prompt 300 records committed...
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (77896, 5783188, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 3358, 144);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (84756, 4293670, 'visa', to_date('12-05-2024', 'dd-mm-yyyy'), 3358, 69406);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (59704, 9950996, 'mastercard', to_date('16-05-2024', 'dd-mm-yyyy'), 3351, 115);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (3564, 1540727, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 3318, 4544);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (11863, 6233056, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 3267, 104);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (57764, 1422927, 'mastercard', to_date('01-05-2024', 'dd-mm-yyyy'), 3234, 523);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (45778, 3641127, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 3226, 559);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (986, 3828352, 'visa', to_date('19-05-2024', 'dd-mm-yyyy'), 3226, 122);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (85514, 7076355, 'debit', to_date('05-05-2024', 'dd-mm-yyyy'), 3232, 727);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (99460, 9220692, 'mastercard', to_date('01-05-2024', 'dd-mm-yyyy'), 3250, 70473);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (44049, 3935104, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 3283, 43615);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (56197, 9322211, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 3333, 88406);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (27377, 9120588, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 3401, 892);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (53465, 4954794, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 3494, 22775);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (84236, 3525603, 'mastercard', to_date('06-05-2024', 'dd-mm-yyyy'), 3611, 95107);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (96853, 9906584, 'visa', to_date('16-05-2024', 'dd-mm-yyyy'), 3754, 497);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (3073, 9598490, 'mastercard', to_date('07-05-2024', 'dd-mm-yyyy'), 3926, 65831);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (73046, 9611146, 'debit', to_date('05-05-2024', 'dd-mm-yyyy'), 4128, 81223);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (58536, 9655939, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 4360, 26507);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (94794, 9103336, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 4622, 846);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (3144, 9751462, 'mastercard', to_date('15-05-2024', 'dd-mm-yyyy'), 4911, 127);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (62784, 7226151, 'debit', to_date('06-05-2024', 'dd-mm-yyyy'), 5221, 22909);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (27042, 9052651, 'visa', to_date('19-05-2024', 'dd-mm-yyyy'), 5549, 86);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (81833, 4666675, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 5889, 92458);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (40990, 5930346, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 6233, 43767);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (97094, 2649259, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 6572, 45428);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (56414, 3212851, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 6900, 77969);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (38060, 5364049, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 7211, 659);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (65654, 4308307, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 7499, 6901);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (84811, 5458988, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 7761, 617);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (48367, 3148358, 'debit', to_date('06-05-2024', 'dd-mm-yyyy'), 7992, 527);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (96518, 6173421, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 8196, 104);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (55671, 9156228, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 8368, 81);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (64412, 9941432, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 8510, 886);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (48939, 6692342, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 8626, 55775);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (79798, 4543025, 'visa', to_date('19-05-2024', 'dd-mm-yyyy'), 8718, 78460);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (94191, 2680602, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 8787, 41440);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (30939, 7131285, 'visa', to_date('07-05-2024', 'dd-mm-yyyy'), 8837, 79938);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (39518, 3368464, 'debit', to_date('05-05-2024', 'dd-mm-yyyy'), 8869, 44367);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (66860, 3713641, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 8888, 500);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (25764, 6423918, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 8894, 30635);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (93854, 1915352, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 8894, 61391);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (90694, 6869975, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 8819, 892);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (25620, 4491009, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 8512, 42594);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (26765, 2436690, 'mastercard', to_date('16-05-2024', 'dd-mm-yyyy'), 7895, 7790);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (14644, 7047275, 'mastercard', to_date('15-05-2024', 'dd-mm-yyyy'), 7117, 61391);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (92663, 7755786, 'mastercard', to_date('15-05-2024', 'dd-mm-yyyy'), 6503, 256);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (10242, 3516461, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 6195, 31798);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (92507, 5417187, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 6120, 441);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (84549, 5123481, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 6120, 98716);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (40269, 4438258, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 6021, 75842);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (2894, 4888877, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 5613, 88163);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (17580, 6863118, 'debit', to_date('16-05-2024', 'dd-mm-yyyy'), 4854, 43928);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (13181, 9837109, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 4094, 82);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (37079, 5621902, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 3685, 40933);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (64064, 2892805, 'debit', to_date('05-05-2024', 'dd-mm-yyyy'), 3587, 94900);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (21042, 3393291, 'debit', to_date('07-05-2024', 'dd-mm-yyyy'), 3588, 68088);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (65909, 9030333, 'mastercard', to_date('06-05-2024', 'dd-mm-yyyy'), 3557, 609);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (41532, 5217489, 'debit', to_date('12-05-2024', 'dd-mm-yyyy'), 3438, 308);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (87320, 2505897, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 3195, 17380);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (79733, 5602846, 'visa', to_date('15-05-2024', 'dd-mm-yyyy'), 2847, 41440);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (99427, 7425355, 'debit', to_date('05-05-2024', 'dd-mm-yyyy'), 2498, 57772);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (47164, 7988302, 'mastercard', to_date('16-05-2024', 'dd-mm-yyyy'), 2255, 53248);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (21136, 7970293, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 2136, 140);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (20454, 2086321, 'mastercard', to_date('01-05-2024', 'dd-mm-yyyy'), 2108, 45426);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (71945, 4084692, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 2107, 35698);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (96015, 3624931, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 2131, 65311);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (68473, 2681605, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 2212, 104);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (81794, 8849980, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 2369, 564);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (74455, 6231397, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 2620, 80906);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (13706, 6030794, 'visa', to_date('19-05-2024', 'dd-mm-yyyy'), 2982, 97346);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (59448, 4589916, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 3466, 556);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (55650, 3712036, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 4065, 65414);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (41033, 5942383, 'visa', to_date('07-05-2024', 'dd-mm-yyyy'), 4757, 76180);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (49648, 3438187, 'mastercard', to_date('06-05-2024', 'dd-mm-yyyy'), 5501, 33736);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (73800, 8039786, 'mastercard', to_date('19-05-2024', 'dd-mm-yyyy'), 6248, 477);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (27306, 1202099, 'mastercard', to_date('18-05-2024', 'dd-mm-yyyy'), 6939, 874);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (52582, 9126435, 'mastercard', to_date('06-05-2024', 'dd-mm-yyyy'), 7538, 8);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (95041, 3808576, 'visa', to_date('12-05-2024', 'dd-mm-yyyy'), 8021, 7280);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (98399, 2352864, 'debit', to_date('05-05-2024', 'dd-mm-yyyy'), 8384, 85401);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (94239, 6856129, 'debit', to_date('18-05-2024', 'dd-mm-yyyy'), 8635, 6752);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (42671, 5002207, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 8792, 42220);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (61892, 9290011, 'visa', to_date('05-05-2024', 'dd-mm-yyyy'), 8874, 44367);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (46730, 5108184, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 8897, 31916);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (44697, 6729677, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 8897, 57890);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (78958, 2711092, 'mastercard', to_date('06-05-2024', 'dd-mm-yyyy'), 8952, 48017);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (1630, 6785182, 'visa', to_date('12-05-2024', 'dd-mm-yyyy'), 9189, 116);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (37409, 1799040, 'visa', to_date('01-05-2024', 'dd-mm-yyyy'), 9555, 23273);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (4153, 5232063, 'debit', to_date('19-05-2024', 'dd-mm-yyyy'), 9791, 76180);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (87753, 1544121, 'mastercard', to_date('06-05-2024', 'dd-mm-yyyy'), 9846, 64575);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (64631, 4636830, 'visa', to_date('01-05-2024', 'dd-mm-yyyy'), 9846, 102);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (73608, 4325932, 'visa', to_date('05-05-2024', 'dd-mm-yyyy'), 9760, 65);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (23311, 8873407, 'debit', to_date('01-05-2024', 'dd-mm-yyyy'), 9392, 23257);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (16233, 4214746, 'mastercard', to_date('07-05-2024', 'dd-mm-yyyy'), 8826, 130);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (54940, 2587066, 'debit', to_date('12-05-2024', 'dd-mm-yyyy'), 8459, 1633);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (39070, 4593274, 'visa', to_date('16-05-2024', 'dd-mm-yyyy'), 8374, 5364);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (6517, 8224880, 'visa', to_date('18-05-2024', 'dd-mm-yyyy'), 8372, 28468);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (21487, 7739554, 'visa', to_date('01-05-2024', 'dd-mm-yyyy'), 8466, 76177);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (71884, 9437947, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 8855, 66645);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (93122, 7387687, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 9456, 95107);
commit;
prompt 400 records committed...
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (91131, 3768461, 'visa', to_date('20-05-2024', 'dd-mm-yyyy'), 9848, 135);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (23055, 2492277, 'debit', to_date('05-05-2024', 'dd-mm-yyyy'), 9939, 67619);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (47822, 1782081, 'mastercard', to_date('20-05-2024', 'dd-mm-yyyy'), 9939, 70);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (30461, 5924004, 'mastercard', to_date('12-05-2024', 'dd-mm-yyyy'), 9928, 50997);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (82240, 1240785, 'debit', to_date('20-05-2024', 'dd-mm-yyyy'), 9893, 63);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (61241, 5659340, 'mastercard', to_date('07-05-2024', 'dd-mm-yyyy'), 9826, 973);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (22443, 5954071, 'debit', to_date('15-05-2024', 'dd-mm-yyyy'), 9719, 77);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (48329, 9049886, 'visa', to_date('12-05-2024', 'dd-mm-yyyy'), 9567, 23299);
insert into CREDIT_CARDS (card_id, card_number, card_type, expiration_date, credit_limit, account_id)
values (99435, 1370607, 'visa', to_date('06-05-2024', 'dd-mm-yyyy'), 9365, 64954);
commit;
prompt 409 records loaded
prompt Loading DEPOSITS...
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (501, 3000, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2025', 'dd-mm-yyyy'), 3, 1);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (504, 4000, to_date('17-05-2024', 'dd-mm-yyyy'), to_date('22-05-2025', 'dd-mm-yyyy'), 4, 4);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (505, 4500, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('23-05-2025', 'dd-mm-yyyy'), 4, 5);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (506, 5000, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('24-05-2025', 'dd-mm-yyyy'), 4, 6);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (507, 5500, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('25-05-2025', 'dd-mm-yyyy'), 4, 7);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (508, 6000, to_date('21-05-2024', 'dd-mm-yyyy'), to_date('26-05-2025', 'dd-mm-yyyy'), 4, 8);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (509, 6500, to_date('22-05-2024', 'dd-mm-yyyy'), to_date('27-05-2025', 'dd-mm-yyyy'), 5, 9);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (510, 7000, to_date('23-05-2024', 'dd-mm-yyyy'), to_date('28-05-2025', 'dd-mm-yyyy'), 5, 10);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (805, 112, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 2, 82);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (903, 443, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 2, 7);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (948, 129, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 4, 34293);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (857, 421, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 3, 103);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (194, 219, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 5, 164);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (484, 462, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 7, 12055);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (613, 243, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 2, 95107);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (820, 146, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 7, 44336);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (737, 335, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 4, 97346);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (110, 158, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 1, 90590);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (755, 137, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 6, 33005);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (412, 333, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 6, 307);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (241, 350, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 1, 66897);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (146, 309, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 5, 821);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (168, 383, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 2, 151);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (999, 258, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 2, 939);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (965, 211, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 6, 14577);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (947, 262, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 891);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (349, 279, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 1, 289);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (296, 383, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 1, 404);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (838, 95, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 4, 89250);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (865, 247, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 5, 75380);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (764, 174, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 5, 79358);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (207, 408, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 3, 23675);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (761, 45, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 3, 74);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (684, 237, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 7, 1);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (43, 96, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 12241);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (204, 231, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 6, 5);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (766, 160, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 1, 70177);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (197, 446, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 1, 398);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (928, 234, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 2, 276);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (708, 401, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 7, 19591);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (704, 500, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 5, 139);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (96, 447, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 3, 28548);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (826, 33, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 7, 105);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (626, 451, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 2, 554);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (516, 403, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 7, 26080);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (779, 106, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 3, 12905);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (423, 31, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 2, 36660);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (707, 172, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 5, 124);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (424, 26, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 1, 8);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (42, 404, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 2, 58338);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (607, 471, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 7, 791);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (921, 119, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 4, 56892);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (203, 385, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 5, 72);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (814, 266, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 4, 26245);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (352, 301, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 3, 72);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (284, 219, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 5, 519);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (65, 230, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 6, 63101);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (957, 417, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 2, 140);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (577, 379, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 3, 84853);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (666, 458, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 5, 23273);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (130, 44, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 3, 101);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (790, 176, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 5, 376);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (706, 335, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 5, 94580);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (859, 273, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 4, 169);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (456, 181, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 7, 48);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (858, 171, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 56860);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (683, 143, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 3, 118);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (630, 355, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 6, 654);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (745, 390, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 3, 75096);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (603, 173, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 7, 63028);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (898, 485, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 5, 93415);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (885, 184, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 1, 98716);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (490, 227, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 7, 70);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (904, 482, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 6, 880);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (573, 140, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 1, 37587);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (415, 122, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 5, 9651);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (938, 430, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 6, 85401);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (767, 290, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 1, 26080);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (977, 35, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 3, 101);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (393, 385, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 7, 4);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (798, 201, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 2, 82081);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (328, 21, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 5, 393);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (818, 444, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 4, 8802);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (732, 20, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 2, 477);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (184, 415, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 1, 87489);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (963, 104, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 5, 210);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (401, 290, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 4, 42448);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (991, 327, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 5, 64575);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (619, 424, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 3, 93109);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (534, 331, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 6, 609);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (220, 148, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 6, 71981);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (426, 193, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 4, 33817);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (84, 61, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 5, 50238);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (150, 65, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 1, 31916);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (24, 229, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 1, 600);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (447, 218, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 7, 206);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (949, 331, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 6, 60488);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (528, 383, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 6, 95935);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (888, 182, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 1, 68);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (274, 230, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 2, 43050);
commit;
prompt 100 records committed...
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (801, 164, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 6, 402);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (376, 116, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 4, 874);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (979, 255, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 2, 66645);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (503, 296, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 3, 26127);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (727, 217, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 3, 48017);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (702, 439, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 2, 6224);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (856, 216, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 3, 27179);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (46, 321, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 1, 4);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (547, 481, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 1, 60628);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (908, 412, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 2, 633);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (847, 469, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 7, 86343);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (976, 392, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 7, 8180);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (471, 295, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 308);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (911, 38, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 6, 77);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (742, 400, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 7, 154);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (457, 39, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 7, 31798);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (812, 276, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 4, 210);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (691, 317, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 2, 159);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (329, 324, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 75096);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (852, 329, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 3, 905);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (808, 85, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 5, 69493);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (579, 138, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 5, 161);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (49, 92, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 5, 25250);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (524, 385, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 7, 905);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (622, 225, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 34293);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (441, 398, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 1, 22775);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (762, 136, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 7, 609);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (952, 27, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 1, 147);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (960, 167, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 2, 26127);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (730, 340, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 5, 63532);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (954, 382, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 6, 67121);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (314, 228, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 2, 142);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (651, 272, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 3, 44336);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (375, 46, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 3, 88406);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (258, 331, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 2, 66260);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (591, 474, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 3, 63305);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (325, 123, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 1, 741);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (313, 215, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 5, 477);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (1000, 271, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 1, 64954);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (548, 497, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 527);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (56, 66, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 2, 80906);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (491, 94, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 6, 95);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (364, 322, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 1, 289);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (650, 331, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 2, 35808);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (440, 371, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 2, 83973);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (753, 81, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 2, 637);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (161, 141, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 5, 609);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (850, 206, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 4, 70177);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (445, 244, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 3, 64989);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (882, 466, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 5, 91608);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (716, 76, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 2, 160);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (95, 128, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 7, 363);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (886, 83, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 45906);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (163, 244, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 26507);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (335, 420, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 2, 855);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (728, 487, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 1, 585);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (242, 155, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 56722);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (181, 181, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 7, 13222);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (377, 314, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 5, 66485);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (306, 204, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 5, 46038);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (176, 93, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 6, 66260);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (388, 114, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 3, 36541);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (196, 432, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 5, 85401);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (625, 266, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 5, 97);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (319, 382, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 4, 35808);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (494, 335, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 6, 770);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (578, 294, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 3, 179);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (120, 28, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 7, 77992);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (266, 312, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 3, 71);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (669, 68, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 3, 136);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (189, 150, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 2, 36541);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (470, 207, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 5, 744);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (966, 285, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 6, 38851);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (839, 368, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 4, 55472);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (435, 324, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 5, 86343);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (989, 193, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 7, 57103);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (932, 437, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 6, 82);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (483, 99, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 6, 849);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (211, 143, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 1, 20539);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (454, 355, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 7, 88);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (514, 40, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 1, 21229);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (179, 31, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 1, 98);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (772, 164, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 6, 33232);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (782, 352, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 3, 45206);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (495, 167, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 64);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (98, 181, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 4, 474);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (653, 406, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 4, 132);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (532, 480, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 6, 58472);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (529, 271, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 5, 620);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (228, 130, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 1, 7670);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (566, 103, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 3, 138);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (114, 269, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 4, 74337);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (696, 144, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 4, 56105);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (145, 368, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 2, 42594);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (554, 241, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 6, 78617);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (367, 380, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 6, 19591);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (549, 284, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 1, 92458);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (330, 183, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 1, 907);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (162, 163, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 3, 36530);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (432, 34, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 6, 83324);
commit;
prompt 200 records committed...
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (105, 270, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 4, 26057);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (270, 338, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 1, 65831);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (994, 343, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 6, 76180);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (803, 44, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 2, 167);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (907, 485, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 5, 19245);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (749, 418, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 1, 172);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (632, 231, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 3, 485);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (560, 260, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 7, 346);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (679, 193, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 6, 65);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (67, 341, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 7, 58276);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (283, 463, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 5, 84596);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (256, 369, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 5, 849);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (35, 375, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 2, 96941);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (230, 104, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 7, 916);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (318, 215, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 3, 63);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (474, 307, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 2, 52304);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (238, 304, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 6, 12055);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (720, 220, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 5, 107);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (660, 467, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 2, 77);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (137, 115, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 4, 25250);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (116, 136, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 1, 40933);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (688, 346, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 5, 9607);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (487, 127, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 5, 91);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (147, 419, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 2, 43615);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (132, 210, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 5, 73766);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (248, 314, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 2, 5468);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (173, 465, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 1, 747);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (776, 475, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 4, 170);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (587, 258, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 7, 39773);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (119, 199, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 4, 485);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (198, 193, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 4, 67619);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (871, 403, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 2, 128);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (876, 204, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 63101);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (219, 146, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 5, 404);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (88, 267, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 3, 430);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (21, 437, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 6, 48);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (671, 24, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 2, 333);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (77, 286, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 1, 37587);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (915, 210, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 5, 522);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (909, 356, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 3, 42220);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (774, 480, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 7, 159);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (967, 492, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 4, 2716);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (670, 409, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 1, 22091);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (731, 55, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 1, 79358);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (257, 304, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 7, 64989);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (255, 384, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 1, 38641);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (788, 224, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 3, 55456);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (271, 311, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 3, 97);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (586, 494, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 7, 3334);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (362, 63, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 4, 11525);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (735, 307, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 3, 970);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (712, 267, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 4, 21745);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (86, 366, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 6, 859);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (185, 67, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 2, 159);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (624, 22, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 4, 79357);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (631, 164, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 6, 33130);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (326, 134, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 2, 56143);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (305, 489, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 4, 103);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (643, 494, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 4, 65893);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (431, 217, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 6, 43978);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (374, 446, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 5, 105);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (436, 148, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 4, 86);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (561, 140, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 2, 44289);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (310, 247, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 1, 98281);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (719, 479, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 6, 156);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (906, 35, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 4, 37587);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (448, 459, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 7, 88425);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (397, 205, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 5, 66485);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (853, 58, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 4, 39364);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (563, 431, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 1, 76177);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (343, 285, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 4, 44367);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (108, 114, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 2, 22775);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (61, 268, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 7, 15015);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (970, 120, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 2, 22091);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (946, 447, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 4, 809);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (205, 49, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 2, 83973);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (925, 94, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 1, 20539);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (33, 103, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 5, 6310);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (417, 271, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 5, 105);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (923, 318, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 3, 80181);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (935, 173, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 6, 171);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (449, 305, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 4, 64575);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (384, 359, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 6, 77451);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (739, 398, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 4, 838);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (640, 500, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 2, 121);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (502, 146, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 7, 63028);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (292, 100, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 152);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (831, 433, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 7, 12055);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (589, 435, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 4, 98352);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (372, 183, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 3, 154);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (914, 222, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 6, 33736);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (478, 490, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3, 939);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (345, 305, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 1, 63532);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (552, 159, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 3, 55456);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (331, 41, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 2, 44336);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (354, 455, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 5, 26113);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (699, 296, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 3, 31916);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (152, 414, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 5, 11589);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (984, 69, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 7, 731);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (254, 187, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 5, 1);
commit;
prompt 300 records committed...
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (439, 185, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 7, 75510);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (442, 93, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 7, 81105);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (988, 201, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 7, 94622);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (422, 104, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 7, 886);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (159, 109, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 7, 88425);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (583, 354, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 5, 107);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (229, 295, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 3, 880);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (450, 447, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 7, 23591);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (321, 392, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 3, 63305);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (38, 281, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 6, 550);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (585, 315, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 1, 77451);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (411, 220, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 1, 23257);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (359, 429, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 7, 134);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (55, 62, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 7, 77992);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (520, 191, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 5, 102);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (59, 47, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 1, 41433);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (124, 99, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 7, 31916);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (348, 473, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 3, 87489);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (571, 499, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 7, 147);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (827, 190, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 2, 36975);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (642, 373, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 3, 67619);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (346, 31, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 4, 857);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (324, 29, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 7, 69406);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (143, 281, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 2, 72917);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (645, 28, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 7, 44367);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (618, 130, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 7, 637);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (843, 440, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 6, 48239);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (93, 154, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 1, 75);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (975, 444, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 5, 64954);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (648, 284, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 6, 89);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (958, 427, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 2, 78790);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (816, 200, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 1, 939);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (687, 26, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 4, 115);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (568, 124, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 2, 26598);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (243, 454, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 6, 54429);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (743, 239, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 4, 40933);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (701, 152, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 7, 31739);
insert into DEPOSITS (depositid, deposit_amount, deposit_date, maturity_date, interest_rate, account_id)
values (758, 295, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 7, 118);
commit;
prompt 338 records loaded
prompt Loading LOANS...
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (201, 10000, 7, to_date('20-05-2023', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 1);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (202, 5000, 8, to_date('20-05-2022', 'dd-mm-yyyy'), to_date('20-05-2023', 'dd-mm-yyyy'), 2);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (203, 10000, 7, to_date('20-05-2023', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (204, 5000, 8, to_date('20-05-2022', 'dd-mm-yyyy'), to_date('20-05-2023', 'dd-mm-yyyy'), 4);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (205, 10000, 7, to_date('20-05-2023', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 5);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (206, 5000, 8, to_date('20-05-2022', 'dd-mm-yyyy'), to_date('20-05-2023', 'dd-mm-yyyy'), 6);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (207, 10000, 7, to_date('20-05-2023', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 7);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (208, 5000, 8, to_date('20-05-2022', 'dd-mm-yyyy'), to_date('20-05-2023', 'dd-mm-yyyy'), 8);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (209, 10000, 7, to_date('20-05-2023', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 9);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (210, 5000, 8, to_date('20-05-2022', 'dd-mm-yyyy'), to_date('20-05-2023', 'dd-mm-yyyy'), 10);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2098, 7197, 1, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 53773);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3091, 3397, 5, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 3532);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2226, 743, 1, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 60628);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3390, 2596, 3, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 66897);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9867, 3900, 1, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 164);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7403, 1019, 2, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 40596);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3575, 9705, 6, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 46916);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7341, 7892, 1, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 50997);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3272, 6984, 6, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 26691);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4851, 4978, 2, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 96941);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3166, 4145, 1, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 3532);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6747, 3361, 5, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 741);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6396, 6332, 4, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 56105);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3219, 9200, 2, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 970);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2222, 115, 6, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 55962);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8578, 2633, 1, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 75096);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2840, 8270, 4, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 11929);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6381, 5957, 1, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 31429);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1147, 2738, 4, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 78);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2088, 8706, 4, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 57457);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7918, 577, 1, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 68088);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3688, 7625, 3, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 16585);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1919, 9939, 5, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 41547);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (804, 7824, 6, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 68165);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6405, 3176, 5, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 42448);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3929, 4579, 3, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 40947);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9256, 8145, 5, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 523);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8941, 1542, 7, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 93109);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3163, 9770, 7, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 333);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4560, 3646, 2, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 51373);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4770, 6370, 4, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 76627);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2902, 5495, 5, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 97);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4176, 7796, 3, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 3);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5783, 8512, 3, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 33736);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8705, 4910, 1, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 137);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1928, 2620, 5, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 93977);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7349, 2425, 2, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 155);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2754, 759, 2, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 7);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4795, 9656, 5, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 22909);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6862, 6998, 6, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 791);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6434, 6192, 6, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 78);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5916, 1528, 7, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 158);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8262, 2038, 6, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 654);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7047, 8334, 6, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 5364);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8084, 4249, 4, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 168);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9455, 3799, 1, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 58338);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6921, 4589, 3, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 65311);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5346, 7050, 5, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 74263);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2025, 5247, 5, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 109);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7882, 5303, 7, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 66065);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5420, 2138, 5, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 9607);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1282, 9, 3, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 6310);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4357, 7834, 7, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 838);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (741, 2061, 7, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 24487);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2607, 8626, 4, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 33388);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2314, 6864, 1, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 57772);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3983, 2790, 4, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 523);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5439, 2537, 6, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 979);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2013, 9547, 4, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 781);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3227, 7027, 2, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 44734);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2156, 778, 1, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 14577);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8207, 2429, 5, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 84);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5471, 14, 3, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 77992);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3653, 7272, 4, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 692);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5157, 5725, 7, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 854);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3177, 78, 5, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 128);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9849, 8454, 1, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 89);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3715, 9953, 7, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 170);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (96, 3820, 3, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 284);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9592, 2501, 5, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 56860);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6916, 5918, 4, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 4);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7797, 1851, 3, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 179);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3837, 8151, 3, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 311);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7139, 2054, 5, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 35698);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6330, 1028, 7, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 256);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6438, 3654, 1, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 146);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5046, 8953, 3, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 585);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9402, 3713, 6, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 110);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1751, 541, 1, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 39);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6352, 46, 1, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 21101);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9374, 9490, 6, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 569);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5449, 2989, 7, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 95891);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (79, 5541, 6, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 79839);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8574, 435, 1, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 132);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7751, 7558, 6, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 3532);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9534, 4461, 1, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 55280);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3819, 3256, 7, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 491);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4726, 297, 4, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 66260);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7813, 2613, 7, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 57611);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8936, 935, 5, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 166);
commit;
prompt 100 records committed...
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6566, 4495, 4, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 95077);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1415, 3152, 4, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 325);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8457, 8525, 6, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 45206);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9906, 3232, 7, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 83);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1621, 6723, 4, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 26127);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2750, 3161, 5, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 393);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7510, 1960, 3, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 162);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1759, 594, 7, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 22775);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3729, 2744, 1, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 83978);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (988, 8347, 5, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 156);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2537, 6379, 4, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 387);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9075, 1724, 7, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 94616);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3941, 5021, 7, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 16683);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5302, 4442, 2, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 85386);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4762, 1670, 5, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 585);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2032, 6443, 1, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 128);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7604, 5619, 6, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 57772);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8679, 9365, 6, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 163);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6119, 9403, 6, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 37587);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4867, 7975, 2, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 3532);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5472, 1769, 7, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 53773);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2936, 8312, 7, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 907);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9429, 3705, 7, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 92738);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2451, 5859, 5, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 145);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7947, 7059, 1, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 51373);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1865, 9485, 3, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 98281);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1703, 7768, 6, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 107);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5001, 9483, 2, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 83324);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2440, 8252, 3, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 36975);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2503, 437, 2, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 152);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (562, 5974, 4, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 233);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (913, 2245, 3, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 96971);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3860, 7727, 7, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 58472);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4530, 5043, 1, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 87284);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3795, 1652, 2, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 28548);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7714, 6336, 3, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 21813);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8229, 1545, 6, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 17380);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7780, 1102, 1, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 69);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2027, 456, 6, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 93415);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1148, 8154, 3, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 97364);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9416, 3141, 5, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 6);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7896, 8554, 2, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 97709);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4526, 9369, 1, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 124);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2384, 4335, 7, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 66645);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9005, 2641, 6, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 151);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (91, 8335, 2, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 112);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8126, 1331, 1, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 44336);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3342, 8416, 1, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 891);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9282, 1799, 1, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 761);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1048, 1843, 6, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 86);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9280, 5493, 5, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 164);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (157, 8118, 7, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 155);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9345, 4572, 7, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 893);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8935, 1037, 5, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 89463);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9230, 3097, 7, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 20539);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4757, 3258, 4, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 874);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4347, 3302, 5, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 5);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1554, 9163, 3, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 95452);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2316, 8981, 1, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 289);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4573, 4285, 6, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 610);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7856, 538, 7, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 80080);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2608, 2099, 5, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 90498);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7396, 8704, 3, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 170);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (365, 1437, 1, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 93);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7345, 6477, 3, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 21229);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6096, 327, 7, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 47);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2398, 1302, 7, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 66696);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2187, 4526, 1, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 88);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2805, 2029, 5, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 859);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8832, 1533, 7, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3334);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1997, 7670, 2, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 154);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3464, 3355, 7, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 65831);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8483, 7508, 6, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 281);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1091, 3827, 7, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 9607);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8415, 4559, 2, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 89);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3200, 8743, 1, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 944);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7743, 6950, 1, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 56892);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5377, 9595, 2, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 85386);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6310, 4194, 5, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 585);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1060, 8054, 3, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 95);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3319, 9964, 6, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 286);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5008, 9614, 1, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 843);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2078, 8176, 7, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 89825);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7128, 7749, 4, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 97709);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (687, 9910, 1, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 76180);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8318, 5371, 5, to_date('18-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 44367);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (738, 7034, 5, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 21059);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7099, 3382, 2, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 10265);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (543, 3969, 2, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 41329);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8195, 4215, 2, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 22252);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8180, 8526, 6, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 569);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1950, 9539, 5, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 27201);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4504, 2597, 3, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 84225);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5981, 9133, 3, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 79);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8786, 5981, 7, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 43236);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2967, 483, 5, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 34293);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (2140, 9131, 1, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 163);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (996, 1119, 7, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 72917);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6383, 3085, 7, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 970);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5360, 8223, 3, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 522);
commit;
prompt 200 records committed...
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8494, 7394, 5, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 75096);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3213, 2555, 2, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 77969);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (3326, 9292, 4, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 26243);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5002, 6204, 4, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 32912);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9724, 9918, 7, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 69467);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9059, 6216, 7, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 286);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7706, 5857, 6, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 76627);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8290, 8623, 3, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 115);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6873, 6785, 5, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 69493);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (337, 9896, 3, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 58276);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8682, 2498, 3, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 160);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5137, 5370, 6, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 43615);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7767, 5107, 3, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'), 816);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6282, 6661, 4, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 398);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (9937, 4681, 4, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 57457);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (5081, 2598, 3, to_date('19-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 3310);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (7030, 9120, 4, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 77992);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (8735, 732, 1, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 57150);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (1260, 1531, 1, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 65831);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (6527, 8910, 5, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 523);
insert into LOANS (loan_id, loan_amount, interest_rate, start_date, end_date, account_id)
values (4231, 907, 4, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 23726);
commit;
prompt 221 records loaded
prompt Loading TRANSACTIONS...
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (101, 500, 1, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (102, 410, 2, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (103, 487, 3, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (104, 250, 4, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (105, 452, 5, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (106, 250, 6, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (107, 553, 7, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (108, 255, 8, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (109, 550, 9, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (110, 111, 10, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7955, 1923, 85, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3562, 1061, 333, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6448, 1421, 697, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7790, 1243, 83, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9146, 1970, 939, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (859, 934, 83253, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3632, 1391, 115, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9827, 575, 76180, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4400, 596, 91608, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (361, 1826, 33736, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6277, 1816, 42448, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4274, 666, 10, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5319, 1723, 38324, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1885, 668, 609, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3811, 1338, 77451, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3260, 1948, 98228, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (835, 1412, 325, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8002, 1469, 609, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8110, 1431, 71, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5174, 916, 40947, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4940, 795, 799, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2970, 1936, 41621, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7420, 1747, 357, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7882, 852, 33817, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2128, 1134, 27201, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6972, 740, 146, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1726, 1034, 497, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2738, 1838, 744, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4632, 702, 575, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1566, 1795, 55280, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7308, 1382, 97, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5281, 1276, 32912, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9726, 1444, 21745, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5792, 1405, 66404, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4139, 1379, 166, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2629, 544, 791, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6536, 628, 16553, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3778, 931, 97954, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2097, 1264, 69493, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9800, 1149, 115, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2642, 506, 97954, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1050, 1442, 64989, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8169, 589, 69, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7201, 882, 104, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1189, 1468, 40947, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1634, 1369, 22716, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3556, 1872, 162, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6852, 1982, 33736, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7689, 1196, 43231, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4963, 1668, 404, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9885, 749, 44367, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9679, 1282, 68742, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7130, 1327, 26598, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2785, 1967, 154, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6905, 1643, 91, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2426, 1374, 89825, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (479, 599, 3310, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5768, 1232, 637, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8604, 1905, 7, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4062, 760, 52753, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1593, 1521, 26245, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (805, 1419, 94900, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (707, 1479, 57103, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3284, 510, 77969, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4422, 514, 210, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7325, 625, 500, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6891, 559, 74679, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4925, 1920, 3334, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9614, 579, 89, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4892, 1255, 43231, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6481, 1743, 151, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7061, 1163, 73242, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1624, 1448, 32236, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9319, 1669, 127, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (661, 1684, 16289, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7815, 1951, 15015, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5023, 1740, 355, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (266, 1343, 26057, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9387, 755, 783, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2264, 1187, 18826, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2195, 1119, 97709, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7258, 1523, 48, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8878, 703, 137, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9050, 1626, 69644, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9453, 951, 57890, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7575, 1384, 95891, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7737, 801, 56860, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7877, 525, 139, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4638, 1959, 575, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2374, 1683, 31798, to_date('16-05-2024', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4250, 1508, 88793, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5725, 806, 57611, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3232, 1876, 5179, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3684, 917, 129, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3092, 624, 31048, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4053, 1207, 80906, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5758, 606, 16683, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1621, 1981, 65414, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2337, 1448, 26598, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5607, 1440, 907, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4588, 883, 791, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (886, 817, 16937, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (261, 1431, 172, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1422, 1347, 29, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (654, 1416, 21101, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7779, 582, 28103, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2149, 1834, 827, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7336, 1559, 94436, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (348, 556, 94580, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7297, 1795, 98281, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7302, 886, 56143, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1487, 1146, 44351, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2530, 1449, 325, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9549, 1493, 91, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5940, 1938, 145, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (426, 1280, 70177, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5336, 689, 7566, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7054, 1394, 92, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5817, 617, 21745, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6522, 1389, 125, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3082, 979, 110, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1354, 1050, 26245, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9316, 1991, 63101, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4865, 1310, 51745, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2974, 1285, 79938, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9819, 1499, 491, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (462, 1714, 52753, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9677, 1949, 89463, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2209, 1992, 80080, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3146, 1429, 7790, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1229, 1689, 17380, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1813, 1437, 77992, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4685, 1059, 93415, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1276, 827, 78080, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9041, 1724, 89, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4873, 1785, 393, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8007, 681, 550, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (995, 1641, 57611, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3582, 1685, 124, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2904, 538, 363, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (389, 1939, 169, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2537, 932, 97346, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3102, 656, 106, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6608, 1940, 97652, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7068, 956, 32236, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6498, 533, 891, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1923, 595, 98716, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (746, 1077, 26080, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8004, 1560, 116, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (833, 1705, 75096, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6946, 985, 84617, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (450, 1045, 57740, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4086, 932, 97709, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7273, 1289, 38, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4853, 996, 73412, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8521, 1601, 22684, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4146, 769, 97364, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8920, 1370, 9651, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8520, 1640, 75, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2442, 1317, 79938, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2053, 1939, 1531, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6562, 927, 98095, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4417, 1926, 485, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (582, 1242, 42448, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3330, 628, 799, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5675, 990, 69100, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9601, 1056, 550, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2257, 1014, 63532, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3431, 801, 35664, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5810, 1881, 108, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1557, 1223, 172, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8473, 905, 140, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5402, 1463, 36975, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2589, 1463, 98, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9816, 651, 81271, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4286, 1410, 644, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2670, 602, 781, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7578, 1823, 97346, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7149, 1849, 179, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (982, 1582, 523, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8328, 522, 33232, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7024, 1800, 674, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1649, 1077, 3, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6027, 586, 12587, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4891, 1359, 52753, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1611, 669, 19591, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3931, 1011, 161, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (172, 1349, 52753, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (600, 1738, 81223, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3363, 1800, 21106, to_date('01-05-2024', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4239, 893, 31032, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3664, 716, 8802, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6531, 931, 33388, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2850, 1303, 59685, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8952, 1689, 132, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3850, 609, 944, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3794, 1014, 69603, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5697, 700, 34032, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7794, 744, 69100, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1581, 1182, 33813, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9749, 1519, 285, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9686, 1567, 36541, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (433, 1444, 70, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8124, 1477, 118, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5604, 1594, 504, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1664, 1699, 346, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3298, 1864, 727, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2459, 1579, 973, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2627, 657, 527, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3954, 1763, 97585, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6871, 1428, 10, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7399, 1776, 33130, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9351, 554, 29, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1952, 1454, 111, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2307, 1568, 11525, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7279, 1711, 49249, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8674, 1715, 206, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (441, 1654, 7670, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8033, 1875, 216, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4279, 1042, 28103, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4276, 808, 892, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (694, 585, 28103, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7254, 760, 905, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5419, 1595, 97652, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7618, 1900, 838, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7282, 1968, 136, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4261, 607, 26599, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9569, 521, 88425, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5148, 605, 87, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5176, 673, 92083, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1540, 931, 67121, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4355, 1456, 56722, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4712, 1253, 74, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6159, 1387, 23257, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6572, 532, 69603, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2668, 1672, 66645, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2756, 1032, 6224, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6128, 1259, 66645, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8943, 1156, 124, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9865, 1734, 148, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1034, 1153, 88163, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1802, 1060, 159, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6952, 644, 64954, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (876, 1661, 26113, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3514, 1507, 459, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7431, 1344, 93608, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4514, 1097, 88425, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6219, 1577, 33817, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3384, 1315, 87489, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2194, 1596, 459, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8066, 522, 171, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9893, 868, 21106, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9659, 1290, 56143, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6315, 893, 71981, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3676, 1000, 16289, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5693, 1844, 13271, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4486, 1289, 58472, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8661, 1561, 281, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3448, 1832, 22823, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4013, 1384, 23726, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3255, 828, 75, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2828, 1699, 179, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8956, 605, 81271, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5980, 1986, 3334, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7209, 822, 69406, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5332, 1009, 43928, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6373, 983, 68088, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1980, 1537, 703, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9040, 1613, 6901, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5076, 644, 503, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2454, 1049, 491, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1975, 1861, 39, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4530, 1833, 704, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4543, 756, 22909, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (333, 1589, 1736, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9462, 1364, 402, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (455, 1248, 46038, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1222, 1952, 5, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3485, 616, 11597, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7721, 1138, 52521, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1167, 786, 155, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (538, 1848, 128, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6462, 1389, 944, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6224, 1116, 40596, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5494, 1694, 95935, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2861, 1732, 77992, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1697, 1055, 357, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7839, 729, 117, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3651, 1692, 172, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (408, 1218, 152, to_date('05-05-2024', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6114, 1821, 33391, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5738, 1061, 51373, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3846, 1629, 124, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3856, 1900, 40487, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8531, 1095, 78, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (10000, 1008, 125, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9385, 1644, 41547, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9542, 510, 111, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6166, 1156, 855, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4922, 929, 148, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5676, 1816, 98352, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6271, 1579, 83253, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1548, 801, 51373, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5322, 1809, 40933, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6643, 1324, 95077, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1924, 1583, 612, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9320, 505, 41329, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3945, 1408, 7790, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2122, 602, 169, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (565, 1607, 97954, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3640, 1576, 87284, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7972, 926, 81271, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9243, 500, 58350, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4199, 812, 81105, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4896, 1425, 286, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5201, 1530, 40947, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3816, 1657, 69100, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5667, 1617, 65311, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2008, 1021, 52521, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2081, 1041, 48175, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4952, 1357, 23, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8523, 1266, 3310, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6683, 804, 876, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7235, 1108, 276, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6711, 617, 60628, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9170, 597, 76177, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (335, 829, 67646, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8722, 1194, 133, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1749, 1257, 144, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (954, 828, 12241, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (940, 1846, 83978, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2882, 866, 1633, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2793, 1548, 19591, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (528, 1450, 26507, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6245, 658, 1498, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (387, 964, 6, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6582, 1372, 569, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1700, 743, 34356, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2623, 810, 29880, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8413, 1651, 11589, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3799, 1604, 376, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4630, 1992, 171, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9631, 844, 102, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2482, 767, 16683, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2214, 889, 90, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3969, 1775, 89250, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1186, 1508, 77, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5506, 550, 15938, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2995, 1869, 19245, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5558, 651, 67435, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2457, 1874, 93109, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5478, 789, 28033, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7511, 1337, 81271, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3525, 805, 119, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7566, 1500, 744, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1890, 983, 34356, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4340, 1400, 65831, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6902, 712, 67, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6199, 1079, 167, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2637, 993, 94622, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5778, 1131, 28014, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6821, 1786, 170, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (311, 1601, 5364, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1118, 1703, 67121, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5141, 1723, 58276, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3126, 1542, 63381, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1031, 502, 138, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2849, 1172, 168, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3372, 1148, 459, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1280, 1752, 77451, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5772, 1333, 85401, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2565, 1297, 845, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5951, 817, 32236, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9268, 1596, 66645, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5029, 900, 69644, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (926, 960, 27977, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9897, 1728, 31429, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4804, 1326, 17380, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8995, 1933, 33388, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1428, 1192, 393, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (674, 627, 46563, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1538, 1414, 160, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (4861, 1736, 891, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (7305, 1325, 82673, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8504, 1168, 44734, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6363, 1716, 97346, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3225, 1845, 29310, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8532, 1150, 151, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6263, 1059, 43231, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6421, 622, 20170, to_date('05-05-2024', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5299, 1185, 617, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8441, 1571, 29310, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5394, 1730, 321, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5605, 1718, 63101, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9709, 1226, 71981, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (819, 765, 3662, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (3315, 1478, 84225, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (1673, 933, 26243, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (9410, 636, 85, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (6419, 837, 10265, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (117, 632, 387, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (2948, 709, 845, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (8387, 1944, 376, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (561, 973, 66897, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into TRANSACTIONS (transaction_id, amount, account_id, transaction_date)
values (5381, 708, 45206, to_date('07-05-2024', 'dd-mm-yyyy'));
commit;
prompt 415 records loaded
prompt Enabling foreign key constraints for CHECKS...
alter table CHECKS enable constraint SYS_C008483;
prompt Enabling foreign key constraints for CREDIT_CARDS...
alter table CREDIT_CARDS enable constraint SYS_C008512;
prompt Enabling foreign key constraints for DEPOSITS...
alter table DEPOSITS enable constraint SYS_C008520;
prompt Enabling foreign key constraints for LOANS...
alter table LOANS enable constraint SYS_C008505;
prompt Enabling foreign key constraints for TRANSACTIONS...
alter table TRANSACTIONS enable constraint SYS_C008497;
prompt Enabling triggers for ACCOUNTS...
alter table ACCOUNTS enable all triggers;
prompt Enabling triggers for CHECKS...
alter table CHECKS enable all triggers;
prompt Enabling triggers for CREDIT_CARDS...
alter table CREDIT_CARDS enable all triggers;
prompt Enabling triggers for DEPOSITS...
alter table DEPOSITS enable all triggers;
prompt Enabling triggers for LOANS...
alter table LOANS enable all triggers;
prompt Enabling triggers for TRANSACTIONS...
alter table TRANSACTIONS enable all triggers;

set feedback on
set define on
prompt Done
