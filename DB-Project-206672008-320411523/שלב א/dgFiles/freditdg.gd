
[General]
Version=1

[Preferences]
Username=
Password=2730
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=CREDIT_CARDS
Count=400

[Record]
Name=CARD_ID
Type=NUMBER
Size=
Data=Random(100, 1000)
Master=

[Record]
Name=CARD_NUMBER
Type=NUMBER
Size=
Data=Random(1000000, 9999999)
Master=

[Record]
Name=CARD_TYPE
Type=VARCHAR2
Size=10
Data=List('viaz', 'mastercad', 'debit')
Master=

[Record]
Name=EXPIRATION_DATE
Type=DATE
Size=
Data=List(select Account_Opening_Date from accounts)
Master=

[Record]
Name=CREDIT_LIMIT
Type=NUMBER
Size=
Data=Signal(2000, 10000, 500, 1)
Master=

[Record]
Name=ACCOUNT_ID
Type=NUMBER
Size=
Data=List(select account_id from accounts)
Master=

