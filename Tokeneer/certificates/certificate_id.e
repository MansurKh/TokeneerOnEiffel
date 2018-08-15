note
	description: "Summary description for {CERTIFICATE_ID}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "10"
	Section: "2.6.1"
	Z_schema: "CertificateId"

class
	CERTIFICATE_ID

create
	make

feature {NONE}

	make (number: INTEGER; an_issuer: ISSUER)
		do
			serial_number := number
			issuer := an_issuer
		ensure
			serial_number_set: serial_number = number
			issuer_set: issuer = an_issuer
		end

feature

	issuer: ISSUER

	serial_number: INTEGER

end
