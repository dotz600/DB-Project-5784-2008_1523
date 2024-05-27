
[General]
Version=1

[Preferences]
Username=
Password=2677
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=CHECKS
Count=400

[Record]
Name=CHECK_ID
Type=NUMBER
Size=
Data=Random(10, 10000)
Master=

[Record]
Name=CHECK_NUMBER
Type=NUMBER
Size=
Data=Random(100000, 10000000)
Master=

[Record]
Name=AMOUNT
Type=NUMBER
Size=
Data=Random(100,10000)
Master=

[Record]
Name=ISSUE_DATE
Type=DATE
Size=
Data=List(select Account_Opening_Date from accounts)
Master=

[Record]
Name=CLEARING_DATE
Type=DATE
Size=
Data=List(select Account_Opening_Date from accounts)
Master=

[Record]
Name=ACCOUNT_ID
Type=NUMBER
Size=
Data=List(select account_ID from accounts)
Master=

