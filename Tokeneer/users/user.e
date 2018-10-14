note
	description: "Unique identification of a certificate owner"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "9"
	Section: "2.4"

class
	USER

create
	make, make_issuer

feature {NONE} -- Initialization

	make (types: TYPES)
		do
			privileges := types.privilege
		ensure
			not is_issuer
		end

	make_issuer (types: TYPES)
		do
			privileges := types.privilege
			is_issuer := True
		ensure
			is_issuer
		end

feature -- Queries

	privilege: INTEGER
		do
			if attached privilege_certificate as pc then
				Result := pc.role
			end
		end

feature -- Certificates

	id_certificate: detachable ID_CERTIFICATE

	privilege_certificate: detachable PRIVILEGE_CERTIFICATE

	authentification_certificate: detachable AUTHENTIFICATION_CERTIFICATE

	i_and_a_certificate: detachable I_AND_A_CERTIFICATE

feature -- Access

	privileges: PRIVILEGE

	is_issuer: BOOLEAN

end
