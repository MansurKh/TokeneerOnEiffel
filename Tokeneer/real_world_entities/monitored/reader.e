note
	description: "{READER} ."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.2"
	Z_schema: "Generelized from UserToken, AdminToken, Finger and Floppy"

deferred class
	READER

inherit

	LOGGED

feature {NONE} -- Initialization

	make (types: TYPES; logger_: LOGGER)
		do
			logger := logger_
			is_data_present := False
				-- initially there is no data (token, finger, usb drive etc.) in reader
		ensure
			not is_data_present
		end

feature {TESTS} -- Actions

	provide_bad_data
		do
		end

	provide_good_good
		do
		end

feature -- Command

	read_the_data
		require
			is_data_present
		deferred
		ensure
			attached data
		end

	data: detachable DATA
		deferred
		ensure
			not is_data_present implies (recent_data = old recent_data and Result = recent_data)
		end

feature -- State

	is_data_present: BOOLEAN
			-- Sensor to detect the presence of data/data-carrier

feature {NONE} -- Implementation

	recent_data: detachable DATA
			-- The data that has been provided recently

end
