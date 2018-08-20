note
	description: "Summary description for {OPERATIONS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATIONS

feature -- Admin operations

	archive_log
			-- writes the archive log to floppy and truncates the internally held archive log
		do
		end

	update_configuration
			-- Apply new configuration data from a usb_drive
		do
		end

	override_lock
			-- Unlocks the enclave door
		do
		end

	shut_down
			-- Stops TIS, leaving the protected entry to the enclave secure
		do
		end

end
