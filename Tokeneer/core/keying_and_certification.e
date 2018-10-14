note
	description: "{KEYING_AND_CERTIFICATION}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "11, 14, 20"
	Z_schema: "CAIdCert, ValidEnrol, KeyStore"
	Section: "3.3"

deferred class
	KEYING_AND_CERTIFICATION

feature

	make(types: TYPES; clock: CLOCK)
--		local
--			u: USER
--			tp: TIME_PERIOD
		do
--			create issuer_keys.make_empty
--			create u.make_issuer (types)
--			create tp.make (clock.recent_time.date, clock.recent_time.date, create {TIME}.make (0,0,0), create {TIME}.make (23,59,59))
--			create_root_certificate (u, tp)
--			create id_station_certificate.make (issuer, begining, ending)
		ensure
			not attached own_name
--			issuer_keys.is_empty
		end

	make_enrolled(types: TYPES; clock: CLOCK) --(issuer: USER; time_period: TIME_PERIOD)
		do
--			make(types, clock)
--			create issuer_keys.make_empty
		ensure
			attached own_name
--			not issuer_keys.is_empty
--			issuer_keys.has()
		end

feature {NONE} -- Implementation

--	create_root_certificate (issuer: USER; time_period: TIME_PERIOD)
--		do
--			create root_ceritficate.make (issuer, time_period)
--			root_ceritficate.validated_by
--		ensure
--			root_ceritficate.validated_by = root_ceritficate.subject_pub_key
--		end

feature -- Keystore

	own_name: detachable USER

--	issuer_keys: ARRAY [TUPLE [issuer: USER; key: KEYPART]]

feature -- Enrolment

--	root_ceritficate: ID_CERTIFICATE
		-- The certification authority

	--	id_station_certificate: ID_CERTIFICATE

	issuer_certificates: detachable LINKED_LIST [ID_CERTIFICATE]

invariant
--	root_certificate: root_ceritficate.validated_by = root_ceritficate.subject_pub_key
		-- The root certificate is signed by itself

--	across issuerKey as ik all ik.item.issuer end
--	has_own_name_as_issuer: attached own_name implies across issuer_keys as ik some ik.item.issuer = own_name end

end
