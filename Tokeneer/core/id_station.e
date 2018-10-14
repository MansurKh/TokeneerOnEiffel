note
	description: "{ID_STATION} is the main class of the system. In manages all the entities and processes on a very abstracted manner"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "26"
	Z_schema: "ID_STATION"

class
	ID_STATION

inherit

	REAL_WORLD
		rename
			make as initialize_real_world
		end

	KEYING_AND_CERTIFICATION
		rename
			make as initialize_cert,
			make_enrolled as initialize_enrolled_cert
		end

create
	start_nonenrolled_station, start_enrolled_station

feature {NONE} -- Initialization

	start_nonenrolled_station
			-- Start of nonenrolled ID station according to Z-schema "StartNonEnrolledStation"
		do
			initialize_real_world

			--	TODO: Rework the certification
--			initialize_cert(types, clock)

		ensure
			not attached own_name
			screen.state = types.screen_messages.insert_enrolment_data
			display.state = types.display_messages.blank
			enclave_status = types.enclave_statuses.not_enrolled
			status = types.statuses.quiescent
--			log_unenrolled_start:
		end

	start_enrolled_station
			-- Start of enrolled ID station according to Z-schema "StartEnrolledStation"
		do
			initialize_real_world

			--	TODO: Rework the certification
--			initialize_enrolled_cert(types, clock)

			--	TODO: Enroll
		ensure
			attached own_name
			screen.state = types.screen_messages.welcome_admin
			display.state = types.display_messages.welcome
			enclave_status = types.enclave_statuses.enclave_quiescent
			status = types.statuses.quiescent
--			log_enrolled_start:
		end

invariant
	-- id_station_is_issuer: issuer_certificates.has (id_station_certificate)
	-- Z-schema: Enrol

end
