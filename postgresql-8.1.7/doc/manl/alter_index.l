.\\" auto-generated by docbook2man-spec $Revision: 1.1.1.1 $
.TH "ALTER INDEX" "" "2007-02-01" "SQL - Language Statements" "SQL Commands"
.SH NAME
ALTER INDEX \- change the definition of an index

.SH SYNOPSIS
.sp
.nf
ALTER INDEX \fIname\fR RENAME TO \fInew_name\fR
ALTER INDEX \fIname\fR SET TABLESPACE \fItablespace_name\fR
.sp
.fi
.SH "DESCRIPTION"
.PP
\fBALTER INDEX\fR changes the definition of an existing index.
There are several subforms:
.TP
\fBRENAME\fR
The RENAME form changes the name of the index. 
There is no effect on the stored data.
.TP
\fBSET TABLESPACE\fR
This form changes the index's tablespace to the specified tablespace and
moves the data file(s) associated with the index to the new tablespace.
See also 
CREATE TABLESPACE [\fBcreate_tablespace\fR(l)].
.PP
.SH "PARAMETERS"
.TP
\fB\fIname\fB\fR
The name (possibly schema-qualified) of an existing index to
alter.
.TP
\fB\fInew_name\fB\fR
New name for the index.
.TP
\fB\fItablespace_name\fB\fR
The tablespace to which the index will be moved.
.SH "NOTES"
.PP
These operations are also possible using
ALTER TABLE [\fBalter_table\fR(l)].
\fBALTER INDEX\fR is in fact just an alias for the forms
of \fBALTER TABLE\fR that apply to indexes.
.PP
There was formerly an \fBALTER INDEX OWNER\fR variant, but
this is now ignored (with a warning). An index cannot have an owner
different from its table's owner. Changing the table's owner
automatically changes the index as well.
.PP
Changing any part of a system catalog index is not permitted.
.SH "EXAMPLES"
.PP
To rename an existing index:
.sp
.nf
ALTER INDEX distributors RENAME TO suppliers;
.sp
.fi
.PP
To move an index to a different tablespace:
.sp
.nf
ALTER INDEX distributors SET TABLESPACE fasttablespace;
.sp
.fi
.SH "COMPATIBILITY"
.PP
\fBALTER INDEX\fR is a PostgreSQL
extension.
