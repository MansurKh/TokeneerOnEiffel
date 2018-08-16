note
	description: "Summary description for {READER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	READER

feature {NONE} -- Initialization

	make (types: TYPES)
		do
			is_data_present := False
				-- initially there is no data (token, finger, usb drive etc.) in reader
		end

feature -- State

	is_data_present: BOOLEAN

end
