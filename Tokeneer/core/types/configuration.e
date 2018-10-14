note
	description: "{CONFIGURATION} contains all the confuguration data."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "19"
	Z_schema: "Config"
	Section: "3.1"

class
	CONFIGURATION

create
	make_default, load_from_file

feature

	make_default (types: TYPES)
		do
			clearance := types.clearance
			alarm_silent_duration := 1
			latch_unlock_duration := 15
			token_removal_duration := 10
			enclave_clearance := clearance.unmarked
			authentification_period := 2 * 60 * 60
			entry_period := 10 * 60
		ensure
			alarm_duration_1_sec: alarm_silent_duration = 1
			unlock_duration_15_sec: latch_unlock_duration = 15
			removal_duration_10_sec: token_removal_duration = 10
			lowes_class_possible: enclave_clearance = clearance.unmarked
			authentification_period_2_hours: authentification_period = 7200
			entry_period: entry_period = 600
				-- Initially is function PRIVILEGE X {CLASS X {TIME}}. For simplicity it is same for everyone
				-- Not specified in the document
		end

feature

	load_from_file (input_file: PLAIN_TEXT_FILE; types: TYPES)
			-- Load configuration from a file
			-- TODO: Apply the loaded configuration
		require
			input_file.readable
		do
			clearance := types.clearance
			from
				input_file.start
			until
				input_file.exhausted
			loop
				input_file.read_line
				print (input_file.last_string + "%N")
			end
			input_file.close
		end

feature

	alarm_silent_duration: INTEGER
			-- Time duration in seconds, time before alarm starts alarming

	latch_unlock_duration: INTEGER
			-- Time duration in seconds, time before latch is locked automatically after being unlocked

	token_removal_duration: INTEGER
			-- Time duration in seconds, for a user to remove a token

	enclave_clearance: INTEGER
			-- Classification of enclave

	authentification_period: INTEGER
			-- Time duration in seconds, validity period of Authentification Certificates from the point of issue

	entry_period: INTEGER
			-- Time duration in seconds, to allow a securityOfficer to enter the enclave and reconfigure the TIS

	min_preserved_log_size: INTEGER

	alarm_threshhold_size: INTEGER

feature

	clearance: CLEARANCE

invariant
	alarm_duration_non_negative: alarm_silent_duration >= 0
	unlock_duration_non_negative: latch_unlock_duration >= 0
	removal_duration_non_negative: token_removal_duration >= 0

end
