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

	make (issuer: USER; time_period: TIME_PERIOD)
		require
			issuer.is_issuer
		do
			create id.make (1, issuer)
			validity_period := time_period
			subject := issuer -- TODO: change to a newly created user
			create subject_pub_key
		end

feature -- Access

	subject: USER

	subject_pub_key: KEYPART

end
