.\\" auto-generated by docbook2man-spec $Revision: 1.1.1.1 $
.TH "COMMIT" "" "2007-02-01" "SQL - Language Statements" "SQL Commands"
.SH NAME
COMMIT \- commit the current transaction

.SH SYNOPSIS
.sp
.nf
COMMIT [ WORK | TRANSACTION ]
.sp
.fi
.SH "DESCRIPTION"
.PP
\fBCOMMIT\fR commits the current transaction. All
changes made by the transaction become visible to others
and are guaranteed to be durable if a crash occurs.
.SH "PARAMETERS"
.TP
\fBWORK\fR
.TP
\fBTRANSACTION\fR
Optional key words. They have no effect.
.SH "NOTES"
.PP
Use ROLLBACK [\fBrollback\fR(l)] to
abort a transaction.
.PP
Issuing \fBCOMMIT\fR when not inside a transaction does
no harm, but it will provoke a warning message.
.SH "EXAMPLES"
.PP
To commit the current transaction and make all changes permanent:
.sp
.nf
COMMIT;
.sp
.fi
.SH "COMPATIBILITY"
.PP
The SQL standard only specifies the two forms
COMMIT and COMMIT
WORK. Otherwise, this command is fully conforming.
.SH "SEE ALSO"
BEGIN [\fBbegin\fR(l)], ROLLBACK [\fBrollback\fR(l)]