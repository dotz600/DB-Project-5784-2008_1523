import random
from faker import Faker

fake = Faker()


# Function to generate SQL insert statements
def generate_sql():
    with open('insert_records.sql', 'w') as f:
        # Generate 400 records for Accounts table
        for account_id in range(1000, 1401):
            customer_id = account_id
            balance = random.randint(1000, 50000)
            account_opening_date = fake.date_this_decade()
            f.write(
                f"INSERT INTO Accounts (Account_ID, Customer_ID, Balance, Account_Opening_Date) VALUES ({account_id}, {customer_id}, {balance}, TO_DATE('{account_opening_date}', 'YYYY-MM-DD'));\n")

        # Generate 400 records for Transactions table
        for transaction_id in range(1000, 1401):
            amount = random.randint(100, 10000)
            account_id = random.randint(1, 400)
            transaction_date = fake.date_this_decade()
            f.write(
                f"INSERT INTO Transactions (Transaction_ID, Amount, Account_ID, Transaction_Date) VALUES ({transaction_id}, {amount}, {account_id}, TO_DATE('{transaction_date}', 'YYYY-MM-DD'));\n")

        # Generate 400 records for Loans table
        for loan_id in range(1000, 1401):
            loan_amount = random.randint(5000, 100000)
            interest_rate = random.randint(1, 10)
            start_date = fake.date_this_decade()
            end_date = fake.date_between(start_date=start_date, end_date='+5y')
            account_id = random.randint(1, 400)
            f.write(
                f"INSERT INTO Loans (Loan_ID, Loan_Amount, Interest_Rate, Start_Date, End_Date, Account_ID) VALUES ({loan_id}, {customer_id}, {loan_amount}, {interest_rate}, TO_DATE('{start_date}', 'YYYY-MM-DD'), TO_DATE('{end_date}', 'YYYY-MM-DD'), {account_id});\n")

        # Generate 400 records for Credit_Cards table
        for card_id in range(1000, 1401):
            card_number = fake.credit_card_number(card_type=None)
            card_type = fake.credit_card_provider()
            expiration_date = fake.date_this_decade()
            credit_limit = random.randint(5000, 20000)
            account_id = random.randint(1, 400)
            f.write(
                f"INSERT INTO Credit_Cards (Card_ID, Card_Number, Card_Type, Expiration_Date, Credit_Limit, Account_ID) VALUES ({card_id}, {customer_id}, {card_number}, '{card_type}', TO_DATE('{expiration_date}', 'YYYY-MM-DD'), {credit_limit}, {account_id});\n")

        # Generate 400 records for Checks table
        for check_id in range(1000, 1401):
            check_number = random.randint(100000, 999999)
            amount = random.randint(100, 10000)
            issue_date = fake.date_this_decade()
            clearing_date = fake.date_between(start_date=issue_date, end_date='+1y')
            account_id = random.randint(1, 400)
            f.write(
                f"INSERT INTO Checks (Check_ID, Check_Number, Amount, Issue_Date, Clearing_Date, Account_ID) VALUES ({check_id}, {check_number}, {amount}, TO_DATE('{issue_date}', 'YYYY-MM-DD'), TO_DATE('{clearing_date}', 'YYYY-MM-DD'), {account_id});\n")

        # Generate 400 records for Deposits table
        for deposit_id in range(1000, 1401):
            deposit_amount = random.randint(1000, 50000)
            deposit_date = fake.date_this_decade()
            maturity_date = fake.date_between(start_date=deposit_date, end_date='+5y')
            interest_rate = random.randint(1, 10)
            account_id = random.randint(1, 400)
            f.write(
                f"INSERT INTO Deposits (DepositID, Deposit_Amount, Deposit_Date, Maturity_Date, Interest_Rate, Account_ID) VALUES ({deposit_id}, {customer_id}, {deposit_amount}, TO_DATE('{deposit_date}', 'YYYY-MM-DD'), TO_DATE('{maturity_date}', 'YYYY-MM-DD'), {interest_rate}, {account_id});\n")


if __name__ == "__main__":
    generate_sql()
