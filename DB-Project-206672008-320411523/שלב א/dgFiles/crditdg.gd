
[General]
Version=1

[Preferences]
Username=
Password=2538
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=CREDIT_CARDS
Count=500

[Record]
Name=CARD_ID
Type=NUMBER
Size=
Data=Sequence(9999, [Inc], [WithinParent])
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
Data=List('visa', 'mastercard', 'debit')
Master=

[Record]
Name=EXPIRATION_DATE
Type=DATE
Size=
Data=Random(01/01/21, 01/01/26)
Master=

[Record]
Name=CREDIT_LIMIT
Type=NUMBER
Size=
Data=Signal(2000, 10000, 500,1)
Master=

[Record]
Name=ACCOUNT_ID
Type=NUMBER
Size=
Data=List(select account_id from accounts)
Master=

