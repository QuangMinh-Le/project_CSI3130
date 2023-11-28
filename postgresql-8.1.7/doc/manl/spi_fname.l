.\\" auto-generated by docbook2man-spec $Revision: 1.1.1.1 $
.TH "SPI_fname" "" "2007-02-01" "" "PostgreSQL 8.1.7 Documentation"
.SH NAME
SPI_fname \- determine the column name for the specified column number

.SH SYNOPSIS
.sp
.nf
char * SPI_fname(TupleDesc \fIrowdesc\fR, int \fIcolnumber\fR)
.sp
.fi
.SH "DESCRIPTION"
.PP
\fBSPI_fname\fR returns a copy of the column name of the
specified column. (You can use \fBpfree\fR to
release the copy of the name when you don't need it anymore.)
.SH "ARGUMENTS"
.TP
\fBTupleDesc \fIrowdesc\fB\fR
input row description
.TP
\fBint \fIcolnumber\fB\fR
column number (count starts at 1)
.SH "RETURN VALUE"
.PP
The column name; \fBNULL\fR if
\fIcolnumber\fR is out of range.
SPI_result set to
\fBSPI_ERROR_NOATTRIBUTE\fR on error.