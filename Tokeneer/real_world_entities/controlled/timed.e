note
	description: "Summary description for {TIMED}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	TIMED

feature {NONE} -- Initialization

	make (time: TIME)
		do
			timeout := time
		ensure
			new_value_set: timeout = time
		end

feature -- Setter

	set_timeout (time: TIME)
		do
			timeout := time
		ensure
			new_value_set: timeout = time
		end

feature

	timeout: TIME assign set_timeout

end
