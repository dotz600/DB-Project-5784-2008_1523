CREATE TABLE Accounts
(
  Account_ID INT NOT NULL,
  Customer_ID INT NOT NULL,
  Account_Type varchar2(10),
  Balance INT NOT NULL,
  Account_Opening_Date DATE NOT NULL,
  PRIMARY KEY (Account_ID)
);

CREATE TABLE Transactions
(
  Transaction_ID INT NOT NULL,
  Amount DATE NOT NULL,
  Account_ID INT NOT NULL,
  Transaction_Date DATE,
  PRIMARY KEY (Transaction_ID),
  FOREIGN KEY (Account_ID) REFERENCES Accounts(Account_ID)
);

CREATE TABLE Loans
(
  Loan_ID INT NOT NULL,
  Customer_ID INT NOT NULL,
  Loan_Amount INT NOT NULL,
  Interest_Rate INT NOT NULL,
  Start_Date DATE NOT NULL,
  End_Date DATE NOT NULL,
  Account_ID INT NOT NULL,
  PRIMARY KEY (Loan_ID),
  FOREIGN KEY (Account_ID) REFERENCES Accounts(Account_ID)
);

CREATE TABLE Credit_Cards
(
  Card_ID INT NOT NULL,
  Customer_ID INT NOT NULL,
  Card_Number INT NOT NULL,
  Card_Type varchar2(10),
  Expiration_Date DATE NOT NULL,
  Credit_Limit INT NOT NULL,
  Account_ID INT NOT NULL,
  PRIMARY KEY (Card_ID),
  FOREIGN KEY (Account_ID) REFERENCES Accounts(Account_ID)
);

CREATE TABLE Checks
(
  Check_ID INT NOT NULL,
  Check_Number INT NOT NULL,
  Amount INT NOT NULL,
  Issue_Date DATE NOT NULL,
  Clearing_Date DATE NOT NULL,
  Account_ID INT NOT NULL,
  PRIMARY KEY (Check_ID),
  FOREIGN KEY (Account_ID) REFERENCES Accounts(Account_ID)
);
     

CREATE TABLE Deposits
(
  DepositID INT NOT NULL,
  Customer_ID INT NOT NULL,
  Deposit_Amount INT NOT NULL,
  Deposit_Date DATE NOT NULL,
  Maturity_Date DATE NOT NULL,
  Interest_Rate INT NOT NULL,
  Account_ID INT NOT NULL,
  PRIMARY KEY (DepositID),
  FOREIGN KEY (Account_ID) REFERENCES Accounts(Account_ID)
);
