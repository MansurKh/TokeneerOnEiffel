note
	description: "Summary description for {ATTRIBUTE_CERTIFICATE}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "11"
	Section: "2.6.1"
	Z_schema: "AttCertificate"
	Figure: "2.1"

deferred class
	ATTRIBUTE_CERTIFICATE

inherit

	CERTIFICATE

feature -- Attributes

	baseCertID: detachable CERTIFICATE_ID
			-- Identification of the ID certificate

	tokenID: detachable TOKEN_ID
			-- ID of the Token

end
