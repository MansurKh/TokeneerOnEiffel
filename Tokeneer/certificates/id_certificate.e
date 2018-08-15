note
	description: "Summary description for {ID_CERTIFICATE}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "11"
	Section: "2.6.1"
	Z_schema: "IDCert"

class
	ID_CERTIFICATE

inherit

	CERTIFICATE

create
	make

feature {NONE} -- Initialization

	make (issuer: ISSUER; begining, ending: DATE_TIME)
		do
			create id.make (1, issuer)
			create validity_period.make (begining, ending)
			create subject
			create subjectPubKey
		end

feature -- Access

	subject: USER

	subjectPubKey: KEYPART

end
