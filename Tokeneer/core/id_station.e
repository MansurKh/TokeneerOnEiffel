note
	description: "Summary description for {ID_STATION}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "26"
	Z_schema: "ID_STATION"

class
	ID_STATION

create
	make

feature {NONE} -- Initialization

	make
			-- Creation procedure for Tlkeneer ID Station
		do
--			create certification_authority.make (issuer: ISSUER, begining, ending: DATE_TIME)
			create issuer_certificates.make

			create types.make


		ensure
--			id_station_is_issuer: issuer_certificates.has (id_station_certificate)
		end

feature

--	id_station_certificate: ID_CERTIFICATE

--	certification_authorities: LINKED_LIST [ID_CERTIFICATE]

	issuer_certificates: LINKED_LIST [ID_CERTIFICATE]

	types: TYPES

invariant
--	id_station_is_issuer: issuer_certificates.has (id_station_certificate)
		-- Z-schema: Enrol


end
