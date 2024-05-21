
[General]
Version=1

[Preferences]
Username=
Password=2277
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=DEPOSITS
Count=400

[Record]
Name=DEPOSITID
Type=NUMBER
Size=
Data=Random(20, 1000)
Master=

[Record]
Name=DEPOSIT_AMOUNT
Type=NUMBER
Size=
Data=Random(20, 500)
Master=

[Record]
Name=DEPOSIT_DATE
Type=DATE
Size=
Data=List(select Account_Opening_Date from accounts)
Master=

[Record]
Name=MATURITY_DATE
Type=DATE
Size=
Data=List(select Account_Opening_Date from accounts)
Master=

[Record]
Name=INTEREST_RATE
Type=NUMBER
Size=
Data=Random(1, 7)
Master=

[Record]
Name=ACCOUNT_ID
Type=NUMBER
Size=
Data=List(select account_id from accounts)
Master=

