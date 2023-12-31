.\\" auto-generated by docbook2man-spec $Revision: 1.1.1.1 $
.TH "DROP VIEW" "" "2007-02-01" "SQL - Language Statements" "SQL Commands"
.SH NAME
DROP VIEW \- remove a view

.SH SYNOPSIS
.sp
.nf
DROP VIEW \fIname\fR [, ...] [ CASCADE | RESTRICT ]
.sp
.fi
.SH "DESCRIPTION"
.PP
\fBDROP VIEW\fR drops an existing view. To execute
this command you must be the owner of the view.
.SH "PARAMETERS"
.TP
\fB\fIname\fB\fR
The name (optionally schema-qualified) of the view to remove.
.TP
\fBCASCADE\fR
Automatically drop objects that depend on the view (such as
other views).
.TP
\fBRESTRICT\fR
Refuse to drop the view if any objects depend on it. This is
the default.
.SH "EXAMPLES"
.PP
This command will remove the view called kinds:
.sp
.nf
DROP VIEW kinds;
.sp
.fi
.SH "COMPATIBILITY"
.PP
This command conforms to the SQL standard, except that the standard only
allows one view to be dropped per command. 
.SH "SEE ALSO"
CREATE VIEW [\fBcreate_view\fR(l)]
