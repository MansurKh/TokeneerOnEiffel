note
	description: "{CLEARANCE} describes ordered classifications on document, areas, and people."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "8"
	Section: "2.4"
	Z_schema: "Clearance"

class
	CLEARANCE

inherit

	BASIC_TYPE
		redefine
			make
		end

create
	make

feature

	make (id_generator: ID_GENERATOR)
		do
			precursor (id_generator)
			unmarked := id.new_id
			unclassified := id.new_id
			restricted := id.new_id
			confidential := id.new_id
			secret := id.new_id
			topsecret := id.new_id
		ensure then
			unmarked < unclassified
			unclassified < restricted
			restricted < confidential
			confidential < secret
			secret < topsecret
		end

feature -- Values

	unmarked: INTEGER

	unclassified: INTEGER

	restricted: INTEGER

	confidential: INTEGER

	secret: INTEGER

	topsecret: INTEGER

feature -- Query

	possible_values: LINKED_SET [INTEGER]
			-- Ordered classification on documents, areaa, and people
		once
			create Result.make
			Result.extend (unmarked)
			Result.extend (unclassified)
			Result.extend (restricted)
			Result.extend (confidential)
			Result.extend (secret)
			Result.extend (topsecret)
		ensure then
			Result.has (unmarked)
			Result.has (unclassified)
			Result.has (restricted)
			Result.has (confidential)
			Result.has (secret)
			Result.has (topsecret)
		end

invariant
	classification_is_ordered: unmarked < unclassified and unclassified < restricted and restricted < confidential and confidential < secret and secret < topsecret

end
