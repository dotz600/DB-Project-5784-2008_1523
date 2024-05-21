
[General]
Version=1

[Preferences]
Username=
Password=2825
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=TRANSACTIONS
Count=400

[Record]
Name=TRANSACTION_ID
Type=NUMBER
Size=
Data=Random(10, 1000)
Master=

[Record]
Name=AMOUNT
Type=NUMBER
Size=
Data=Random(50, 5000)
Master=

[Record]
Name=ACCOUNT_ID
Type=NUMBER
Size=
Data=List(select account_id from accounts)
Master=

[Record]
Name=TRANSACTION_DATE
Type=DATE
Size=
Data=List(select Account_Opening_Date from accounts)
Master=

