
[General]
Version=1

[Preferences]
Username=
Password=2658
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=CHECKS
Count=500

[Record]
Name=CHECK_ID
Type=NUMBER
Size=
Data=Sequence(999999, [Inc], [WithinParent])
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
Data=Random(01/01/18, 01/01/24)
Master=

[Record]
Name=CLEARING_DATE
Type=DATE
Size=
Data=Random(01/01/24, 01/01/25)
Master=

[Record]
Name=ACCOUNT_ID
Type=NUMBER
Size=
Data=List(select account_ID from accounts)
Master=

