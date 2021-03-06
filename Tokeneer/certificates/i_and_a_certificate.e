note
	description: "Summary description for {I_AND_A_CERTIFICATE}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "11"
	Section: "2.6.1"
	Z_schema: "IandACert"
	Figure: "2.1"

class
	I_AND_A_CERTIFICATE

inherit

	ATTRIBUTE_CERTIFICATE

create
	make

feature {NONE} -- Initialization

	make (issuer: ISSUER; time_period: TIME_PERIOD)
		do
			create id.make (1, issuer)
			create validity_period.set_as (time_period)
		end

feature -- Attributes

		--	template: FINGERPRINT_TEMPLATE

end
