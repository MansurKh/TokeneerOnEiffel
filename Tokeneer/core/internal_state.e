note
	description: "Summary description for {INTERNAL_STATE}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "24"
	Z_schema: "Internal"

class
	INTERNAL_STATE

inherit

	TIMED
		rename
			timeout as token_removal_timeout,
			make as initialize_timeout
		end

create
	make

feature

	make (types: TYPES)
		local
			time: DATE_TIME
		do
			statuses := types.statuses
			enclave_statuses := types.enclave_statuses

				-- TODO: set time out period from config
			create time.make_now
			initialize_timeout (time)
			status := statuses.quiescent
			enclave_status := enclave_statuses.not_enrolled
		ensure
			initially_quiescent: status = statuses.quiescent
			initially_not_enrolled: enclave_status = enclave_statuses.not_enrolled
		end

feature

	set_status (new_status: INTEGER)
		require
			statuses.possible_values.has (new_status)
		do
			status := new_status
		ensure
			status = new_status
		end

	set_enclave_status (new_status: INTEGER)
		require
			enclave_statuses.possible_values.has (new_status)
		do
			enclave_status := new_status
		ensure
			enclave_status = new_status
		end

feature

	status: INTEGER assign set_status

	enclave_status: INTEGER assign set_enclave_status

feature

	statuses: STATUSES

	enclave_statuses: ENCLAVE_STATUSES

invariant
	statuses.possible_values.has (status)
	enclave_statuses.possible_values.has (enclave_status)

end
