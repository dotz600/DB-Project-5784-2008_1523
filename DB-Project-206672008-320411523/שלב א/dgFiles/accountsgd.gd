
[General]
Version=1

[Preferences]
Username=
Password=2429
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=ACCOUNTS
Count=500

[Record]
Name=ACCOUNT_ID
Type=NUMBER
Size=
Data=Sequence(10, [Inc], [WithinParent])
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
Data=Random(01/01/13, 01/01/18)
Master=

