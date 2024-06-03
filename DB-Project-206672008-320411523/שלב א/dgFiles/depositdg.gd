
[General]
Version=1

[Preferences]
Username=
Password=2801
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=DEPOSITS
Count=500

[Record]
Name=DEPOSITID
Type=NUMBER
Size=
Data=Sequence(999, [Inc], [WithinParent]) 
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
Data=Random(01/01/18, 01/01/21)
Master=

[Record]
Name=MATURITY_DATE
Type=DATE
Size=
Data=Random(01/01/21, 01/01/25)
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

