note
	description: "{REAL_WORLD} includes all monitored and controlled entities"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "18"
	Section: "2.7.2"
	Z_schema: "RealWorld, NoChange"

class
	REAL_WORLD

inherit

	MONITORED_WORLD
		rename
			make as make_monitored_world
		end

	CONTROLLED_WORLD
		rename
			make as make_controlled_world
		end

	INTERNAL_STATE
		rename
			make as set_up_internal_state
		end

	LOGGED

create
	make

feature {NONE} -- Initialization

	make
		do
			create types.make
			create config.make_default (types)
			create clock.make
			initialize_logger (clock)
			make_monitored_world (clock, types, logger)
			make_controlled_world (clock.recent_time, types, logger)
			set_up_internal_state (clock.recent_time, types)
			logger.add_log ("Real world entities initialized")
		ensure
			initially_quiescent: status = statuses.quiescent
			initially_not_enrolled: enclave_status = enclave_statuses.not_enrolled
		end

feature {NONE} --

	unlock_door
		do
			latch.unlock
			latch.timeout := clock.time_after (config.latch_unlock_duration)
			alarm.timeout := clock.time_after (config.latch_unlock_duration + config.alarm_silent_duration)
		ensure
			most_recent_time_used: clock.recent_time > old clock.recent_time
			latch_unlocked: not latch.is_locked
			latch.timeout = clock.time_after (config.latch_unlock_duration)
			alarm.timeout = clock.time_after (config.latch_unlock_duration + config.alarm_silent_duration)
		end

	lock_door
		do
				-- TODO: Implement locking
		ensure
			most_recent_time_used: clock.recent_time > old clock.recent_time
			latch_locked: latch.is_locked
			latch.timeout = clock.recent_time
			alarm.timeout = clock.recent_time
		end

	reset_screen_message
		-- update the screen located in the enclave displaying message that corresponds to state of the system
		do
			if status = types.statuses.quiescent or status = types.statuses.waiting_remove_token_fail then
				if enclave_status = types.enclave_statuses.enclave_quiescent then
					if not False then
--					TODO: change it to
--					if not is_role_present then
						screen.display (types.screen_messages.welcome_admin)
					else
						screen.display (types.screen_messages.request_admin_op)
					end
				else
					if enclave_status = types.enclave_statuses.waiting_remove_admin_token_fail then
						screen.display (types.screen_messages.remove_admin_token)
					end
				end
			else
				screen.display (types.screen_messages.busy)
			end
		ensure
			enclave_status = types.enclave_statuses.enclave_quiescent implies screen.state = types.screen_messages.welcome_admin
			enclave_status = types.enclave_statuses.not_enrolled implies screen.state = types.screen_messages.insert_enrolment_data
--			TODO: describe correspondance of state of the `screen' to other `status'es and `enclave_status'es
		end

	reset_display_message
		-- update the display located outside of the enclave displaying message that corresponds to state of the system
		do
			-- TODO: rework the implementation to correspond to "ReadUserToken", "UserTokenWithOKAuthCert", "UserTokenOK", "BioCheckNotRequired"
			if status = types.statuses.quiescent then
				display.display (types.display_messages.welcome)
			else
				if status = types.statuses.got_user_token or status = types.statuses.got_finger or status = types.statuses.waiting_update_token or status = types.statuses.waiting_entry then
					display.display (types.display_messages.wait)
				else
					if status = types.statuses.waiting_remove_token_fail or status = types.statuses.waiting_remove_token_success then
						display.display (types.display_messages.remove_token)
					else
						if status = types.statuses.waiting_finger then
							display.display (types.display_messages.insert_finger)
						end
					end
				end
			end
		ensure
			status = types.statuses.quiescent and enclave_status = types.enclave_statuses.not_enrolled implies display.state = types.display_messages.blank
			status = types.statuses.quiescent and enclave_status = types.enclave_statuses.enclave_quiescent implies display.state = types.display_messages.welcome
--			TODO: describe correspondance of state of the `display' to other `status'es and `enclave_status'es
		end

feature {NONE} -- State transitions

	set_to_quiesent
		do
		end

	set_to_got_user_token
		do
		ensure then
			is_screen_busy
		end

	set_to_waiting_finger
		do
		ensure then
			is_screen_busy
		end

	set_to_got_finger
		do
		ensure then
			is_screen_busy
		end

	set_to_waiting_update_token
		do
		ensure then
			is_screen_busy
		end

	set_to_waiting_entry
		do
		ensure then
			is_screen_busy
		end

	set_to_token_fail
		do
		end

	set_to_token_success
		do
		ensure then
			is_screen_busy
		end

feature {NONE} -- Postcondition

	is_screen_busy: BOOLEAN
		do
			Result := (screen.state = screen.messages.busy)
		end

feature {NONE} -- Helpers

	apply_status
		do
			reset_display_message
		end

	apply_enclave_status
		do
			reset_screen_message
		end

feature -- Access

	types: TYPES

	config: CONFIGURATION

invariant
	latch_timeout: latch.is_locked xor (clock.now < latch.timeout)
	alarmed: (door.is_open and latch.is_locked and alarm.timeout < clock.now) xor not alarm.alarming

end
