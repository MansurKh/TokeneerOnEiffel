note
	description: "Class contains basic types of the system"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "8"
	Section: "2.4"

class
	TYPES

create
	make

feature {NONE} -- Initialisation

	make
		note
			status: creator
		do
			create id.make
			create clearance.make (id)
			create privilege.make (id)
			create display_messages.make (id)
			create screen_messages.make (id)
			create statuses.make (id)
			create enclave_statuses.make (id)
		ensure
			id.is_active
		end

feature {ATTRIBUTE_CERTIFICATE} -- Clearance

	clearance: CLEARANCE
			-- Ordered classification on documents, areas and people

feature {ATTRIBUTE_CERTIFICATE} -- Privileges

	privilege: PRIVILEGE
			-- Possible roles held by the Token user

feature -- Display messages

	display_messages: DISPLAY_MESSAGES
			-- Possible short messages presented to the user on the small display outside the enclave

feature -- Screen messages

	screen_messages: SCREEN_MESSAGES
			-- Possible messages that may appear on the TIS screen within the enclave

feature -- Authentification statuses

	statuses: STATUSES
			-- Possible statuses throughout user entry

feature -- Enclave statuses

	enclave_statuses: ENCLAVE_STATUSES
			-- Possible statuses throughout all activities performed within the enclave

feature {NONE} -- Implementation

	id: ID_GENERATOR
			-- generates new identifier whenever `new_id' is called

invariant
	id /= Void

end
