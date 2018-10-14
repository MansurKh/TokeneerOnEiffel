note
	description: "Summary description for {ADMINISTRATOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ADMINISTRATOR

inherit

	USER

create
	make

invariant
	privilege = privileges.guard or privilege = privileges.securityofficer or privilege = privileges.auditmanager

end
