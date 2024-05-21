
[General]
Version=1

[Preferences]
Username=
Password=2856
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=ACCOUNTS
Count=400

[Record]
Name=ACCOUNT_ID
Type=NUMBER
Size=
Data=Random(10, 1000)
Master=

[Record]
Name=CUSTOMER_ID
Type=NUMBER
Size=
Data=Random(100, 10000)
Master=

[Record]
Name=ACCOUNT_TYPE
Type=VARCHAR2
Size=10
Data=List('saving', 'chaking', 'loan', 'current')
Master=

[Record]
Name=BALANCE
Type=NUMBER
Size=
Data=Random(-100, 12000)
Master=

[Record]
Name=ACCOUNT_OPENING_DATE
Type=DATE
Size=
Data=List(select account_opening_date from accounts)
Master=

