.\\" auto-generated by docbook2man-spec $Revision: 1.1.1.1 $
.TH "DECLARE" "" "2007-02-01" "SQL - Language Statements" "SQL Commands"
.SH NAME
DECLARE \- define a cursor

.SH SYNOPSIS
.sp
.nf
DECLARE \fIname\fR [ BINARY ] [ INSENSITIVE ] [ [ NO ] SCROLL ]
    CURSOR [ { WITH | WITHOUT } HOLD ] FOR \fIquery\fR
    [ FOR { READ ONLY | UPDATE [ OF \fIcolumn\fR [, ...] ] } ]
.sp
.fi
.SH "DESCRIPTION"
.PP
\fBDECLARE\fR allows a user to create cursors, which
can be used to retrieve
a small number of rows at a time out of a larger query. Cursors can
return data either in text or in binary format using
FETCH [\fBfetch\fR(l)].
.PP
Normal cursors return data in text format, the same as a
\fBSELECT\fR would produce. Since data is stored natively in
binary format, the system must do a conversion to produce the text
format. Once the information comes back in text form, the client
application may need to convert it to a binary format to manipulate
it. In addition, data in the text format is often larger in size
than in the binary format. Binary cursors return the data in a
binary representation that may be more easily manipulated.
Nevertheless, if you intend to display the data as text anyway,
retrieving it in text form will
save you some effort on the client side.
.PP
As an example, if a query returns a value of one from an integer column,
you would get a string of 1 with a default cursor
whereas with a binary cursor you would get
a 4-byte field containing the internal representation of the value
(in big-endian byte order).
.PP
Binary cursors should be used carefully. Many applications,
including \fBpsql\fR, are not prepared to
handle binary cursors and expect data to come back in the text
format.
.sp
.RS
.B "Note:"
When the client application uses the ``extended query'' protocol
to issue a \fBFETCH\fR command, the Bind protocol message
specifies whether data is to be retrieved in text or binary format.
This choice overrides the way that the cursor is defined. The concept
of a binary cursor as such is thus obsolete when using extended query
protocol \(em any cursor can be treated as either text or binary.
.RE
.sp
.SH "PARAMETERS"
.TP
\fB\fIname\fB\fR
The name of the cursor to be created.
.TP
\fBBINARY\fR
Causes the cursor to return data in binary rather than in text format.
.TP
\fBINSENSITIVE\fR
Indicates that data retrieved from the cursor should be
unaffected by updates to the tables underlying the cursor while
the cursor exists. In PostgreSQL,
all cursors are insensitive; this key word currently has no
effect and is present for compatibility with the SQL standard.
.TP
\fBSCROLL\fR
.TP
\fBNO SCROLL\fR
SCROLL specifies that the cursor may be used
to retrieve rows in a nonsequential fashion (e.g.,
backward). Depending upon the complexity of the query's
execution plan, specifying SCROLL may impose
a performance penalty on the query's execution time.
NO SCROLL specifies that the cursor cannot be
used to retrieve rows in a nonsequential fashion. The default is to
allow scrolling in some cases; this is not the same as specifying
SCROLL. See Notes [\fBdeclare\fR(l)] for details.
.TP
\fBWITH HOLD\fR
.TP
\fBWITHOUT HOLD\fR
WITH HOLD specifies that the cursor may
continue to be used after the transaction that created it
successfully commits. WITHOUT HOLD specifies
that the cursor cannot be used outside of the transaction that
created it. If neither WITHOUT HOLD nor
WITH HOLD is specified, WITHOUT
HOLD is the default.
.TP
\fB\fIquery\fB\fR
A \fBSELECT\fR command that will provide the rows to be
returned by the cursor. Refer to SELECT [\fBselect\fR(l)] for further information about valid
queries.
.TP
\fBFOR READ ONLY\fR
.TP
\fBFOR UPDATE\fR
FOR READ ONLY indicates that the cursor will
be used in a read-only mode. FOR UPDATE
indicates that the cursor will be used to update tables. Since
cursor updates are not currently supported in
PostgreSQL, specifying FOR
UPDATE will cause an error message and specifying
FOR READ ONLY has no effect.
.TP
\fB\fIcolumn\fB\fR
Column(s) to be updated by the cursor. Since cursor updates are
not currently supported in
PostgreSQL, the FOR
UPDATE clause provokes an error message.
.PP
The key words BINARY,
INSENSITIVE, and SCROLL may
appear in any order.
.PP
.SH "NOTES"
.PP
Unless WITH HOLD is specified, the cursor
created by this command can only be used within the current
transaction. Thus, \fBDECLARE\fR without WITH
HOLD is useless outside a transaction block: the cursor would
survive only to the completion of the statement. Therefore
PostgreSQL reports an error if this
command is used outside a transaction block.
Use
BEGIN [\fBbegin\fR(l)],
COMMIT [\fBcommit\fR(l)]
and
ROLLBACK [\fBrollback\fR(l)]
to define a transaction block.
.PP
If WITH HOLD is specified and the transaction
that created the cursor successfully commits, the cursor can
continue to be accessed by subsequent transactions in the same
session. (But if the creating transaction is aborted, the cursor
is removed.) A cursor created with WITH HOLD
is closed when an explicit \fBCLOSE\fR command is
issued on it, or the session ends. In the current implementation,
the rows represented by a held cursor are copied into a temporary
file or memory area so that they remain available for subsequent
transactions.
.PP
The SCROLL option should be specified when defining a
cursor that will be used to fetch backwards. This is required by
the SQL standard. However, for compatibility with earlier
versions, PostgreSQL will allow
backward fetches without SCROLL, if the cursor's query
plan is simple enough that no extra overhead is needed to support
it. However, application developers are advised not to rely on
using backward fetches from a cursor that has not been created
with SCROLL. If NO SCROLL is
specified, then backward fetches are disallowed in any case.
.PP
The SQL standard only makes provisions for cursors in embedded
SQL. The PostgreSQL
server does not implement an \fBOPEN\fR statement for
cursors; a cursor is considered to be open when it is declared.
However, \fBECPG\fR, the embedded SQL
preprocessor for PostgreSQL, supports
the standard SQL cursor conventions, including those involving
\fBDECLARE\fR and \fBOPEN\fR statements.
.SH "EXAMPLES"
.PP
To declare a cursor:
.sp
.nf
DECLARE liahona CURSOR FOR SELECT * FROM films;
.sp
.fi
See FETCH [\fBfetch\fR(l)] for more
examples of cursor usage.
.SH "COMPATIBILITY"
.PP
The SQL standard allows cursors only in embedded
SQL and in modules. PostgreSQL
permits cursors to be used interactively.
.PP
The SQL standard allows cursors to update table data. All
PostgreSQL cursors are read only.
.PP
Binary cursors are a PostgreSQL
extension.
.SH "SEE ALSO"
CLOSE [\fBclose\fR(l)], FETCH [\fBfetch\fR(l)], MOVE [\fBmove\fR(l)]