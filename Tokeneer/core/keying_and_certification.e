note
	description: "Summary description for {ENROLMENT}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "11, 14, 20"
	Z_schema: "CAIdCert, ValidEnrol, KeyStore"
	Section: "3.3"

class
	KEYING_AND_CERTIFICATION

create
	make

feature

	make --(issuer: ISSUER; begining, ending: DATE_TIME)
		do
			create issuerKey.make_empty
--			root_certificate := create_root_certificate()
				--			create id_station_certificate.make (issuer, begining, ending)
		end

	make_enroled --(issuer: ISSUER; begining, ending: DATE_TIME)
		do
			create issuerKey.make_empty
--			root_certificate := create_root_certificate
				--			create id_station_certificate.make (issuer, begining, ending)
		end

feature -- Keystore

	issuerKey: ARRAY [TUPLE [ISSUER, KEYPART]]

	ownName: detachable ISSUER

feature -- Enrolment

	id_station_certificate: detachable ID_CERTIFICATE

	root_ceritficate: detachable ID_CERTIFICATE
			-- The certification authority

	issuer_certificates: detachable LINKED_LIST [ID_CERTIFICATE]

feature {NONE} -- Implementation

	create_root_certificate (issuer: ISSUER; begining, ending: DATE_TIME): ID_CERTIFICATE
		do
			create Result.make (issuer, begining, ending)
		ensure
			Result.validated_by = Result.subjectPubKey
		end

invariant
--	root_certificate: root_ceritficate.validated_by = root_ceritficate.subjectPubKey
	-- The root certificate is signed by itself

end
