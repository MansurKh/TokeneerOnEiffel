note
	description: "Summary description for {CONFIGURATION}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "19"
	Z_schema: "Config"
	Section: "3.1"

class
	CONFIGURATION

feature

	alarm_silent_duration: INTEGER

	latch_unlock_duration: INTEGER

	token_removal_duration: INTEGER

	enclave_clearance: INTEGER

	authentification_period: INTEGER

	entry_period: INTEGER

	min_preserved_log_size: INTEGER

	alarm_threshhold_size: INTEGER

end
