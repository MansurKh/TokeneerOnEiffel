note
	description: "Summary description for {ID_STATION}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "26"
	Z_schema: "ID_STATION"

class
	ID_STATION

inherit

	REAL_WORLD
		rename
			make as create_real_world_entities
		end
	INTERNAL_STATE
		rename
			make as initialize_internal_state
		end

	KEYSTORE

create
	start_nonenrolled_station,
	start_enrolled_station

feature {NONE} -- Initialization

	start_nonenrolled_station
			-- Start of nonenrolled ID station according to Z-schema "StartNonEnrolledStation"
		do
			create issuer_certificates.make

			create_real_world_entities
			initialize_internal_state (types)
		ensure
			own_name_not_set: not attached ownName
			request_enrolment_data: screen.message = types.screen_messages.insert_enrolment_data
			blank_diplay: display.message = types.display_messages.blank
			not_enrolled: enclave_status = types.enclave_statuses.not_enrolled
			quiescent: status = types.statuses.quiescent
			unenrolled_start_logged: True -- TODO
		end

	start_enrolled_station
			-- Start of enrolled ID station according to Z-schema "StartEnrolledStation"
		do
			create issuer_certificates.make

			create_real_world_entities
			initialize_internal_state (types)
		ensure
			own_name_is_set: attached ownName
			admin_welcomed: screen.message = types.screen_messages.welcome_admin
			blank_diplay: display.message = types.display_messages.welcome
			enclave_quiescent: enclave_status = types.enclave_statuses.enclave_quiescent
			quiescent: status = types.statuses.quiescent
			enrolled_start_logged: True -- TODO
		end

feature

		--	id_station_certificate: ID_CERTIFICATE

		--	certification_authorities: LINKED_LIST [ID_CERTIFICATE]

	issuer_certificates: LINKED_LIST [ID_CERTIFICATE]

invariant
	-- id_station_is_issuer: issuer_certificates.has (id_station_certificate)
	-- Z-schema: Enrol

end
