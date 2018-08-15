note
	description: "Summary description for {CERTIFICATE}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "10"
	Section: "2.6.1"
	Z_schema: "Certificate"

deferred class
	CERTIFICATE

feature

	is_currently_valid (now: DATE_TIME): BOOLEAN
			-- is certificate valid at moment `now'
		do
			Result := validity_period.is_within_period (now)
		ensure
			Result = validity_period.is_within_period (now)
		end

feature

	id: CERTIFICATE_ID

	validity_period: TIME_PERIOD

	validated_by: detachable KEYPART

end
