note
	description: "Summary description for {TOKEN}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "13"
	Section: "2.6.2"
	Z_schemas: "Token, ValidToken"

class
	TOKEN

create
	make_token,
	make_token_with_auth

feature {NONE} -- Initialization

	make_token (id_cert: ID_CERTIFICATE; priv_cert: PRIVILEGE_CERTIFICATE; i_and_a_cert: I_AND_A_CERTIFICATE)
		do
			create tokenID
			id_Certificate := id_cert
			priv_Certificate := priv_cert
			i_and_a_Certificate := i_and_a_cert
		end

	make_token_with_auth (id_cert: ID_CERTIFICATE; priv_cert: PRIVILEGE_CERTIFICATE;
							i_and_a_cert: I_AND_A_CERTIFICATE; auth_cert: AUTHENTIFICATION_CERTIFICATE)
		do
			create tokenID
			id_Certificate := id_cert
			priv_Certificate := priv_cert
			i_and_a_Certificate := i_and_a_cert
			auth_Certificate := auth_cert
		end

feature
	is_current_token(now: DATE_TIME): BOOLEAN
			-- A Token is current if all of the certificates are current, or if only the `auth_Certificate' is non-current
			-- Z-schema CurrentToken
		do
			Result := id_Certificate.is_currently_valid(now)
				and priv_Certificate.is_currently_valid(now) and i_and_a_Certificate.is_currently_valid(now)
		ensure
			Result = id_Certificate.is_currently_valid(now)
				and priv_Certificate.is_currently_valid(now) and i_and_a_Certificate.is_currently_valid(now)
		end

feature

	tokenID: TOKEN_ID

	id_Certificate: ID_CERTIFICATE

	priv_Certificate: PRIVILEGE_CERTIFICATE

	i_and_a_Certificate: I_AND_A_CERTIFICATE

	auth_Certificate: detachable AUTHENTIFICATION_CERTIFICATE
		-- is optional for token

invariant
	valid_privilage_certificate_1: priv_Certificate.baseCertID = id_Certificate.id
	valid_i_and_a_certificate_1: i_and_a_Certificate.baseCertID = id_Certificate.id

	valid_privilage_certificate_2: priv_Certificate.tokenID = tokenID
	valid_i_and_a_certificate_2: i_and_a_Certificate.tokenID = tokenID

	valid_authentification_certificate_if_contained:
		attached auth_Certificate as auth_cert implies auth_cert.baseCertID = id_Certificate.id and auth_cert.tokenID = tokenID 
end
