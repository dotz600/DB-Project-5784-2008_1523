
[General]
Version=1

[Preferences]
Username=
Password=2536
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=TRANSACTIONS
Count=500

[Record]
Name=TRANSACTION_ID
Type=NUMBER
Size=
Data=Sequence(999999999, [Inc], [WithinParent])
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
Data=Random(01/05/18,01/06/24)
Master=

