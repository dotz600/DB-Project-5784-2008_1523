
[General]
Version=1

[Preferences]
Username=
Password=2667
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=LOANS
Count=400

[Record]
Name=LOAN_ID
Type=NUMBER
Size=
Data=Sequence(99999, [Inc], [WithinParent])
Master=

[Record]
Name=LOAN_AMOUNT
Type=NUMBER
Size=
Data=Random(100, 100000)
Master=

[Record]
Name=INTEREST_RATE
Type=NUMBER
Size=
Data=Random(1, 7)
Master=

[Record]
Name=START_DATE
Type=DATE
Size=
Data=Random(01/01/18,01/01/20)
Master=

[Record]
Name=END_DATE
Type=DATE
Size=
Data=Random(01/01/20 ,01/01/25)
Master=

[Record]
Name=ACCOUNT_ID
Type=NUMBER
Size=
Data=List(select account_ID from accounts)
Master=

