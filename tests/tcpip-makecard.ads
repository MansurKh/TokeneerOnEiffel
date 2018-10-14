------------------------------------------------------------------
-- Tokeneer ID Station Support Software
--
-- Copyright (2003) United States Government, as represented
-- by the Director, National Security Agency. All rights reserved.
--
-- This material was originally developed by Praxis High Integrity
-- Systems Ltd. under contract to the National Security Agency.
------------------------------------------------------------------

------------------------------------------------------------------
-- TcpIp.MakeCard
--
-- Description:
--    Provides the operations to communicate with the SPRE drivers
--    using TCP/IP.
--
------------------------------------------------------------------

package TcpIp.MakeCard is

   MaxMessageLength : constant := 14096;

   subtype MessageLengthT is Integer range 0 .. MaxMessageLength;
   subtype MessageIndexT is MessageLengthT range 1 .. MessageLengthT'Last;

   type MessageT is record
      Data   : String(MessageIndexT) := (others => ASCII.Nul);
      Length : MessageLengthT := 0;
   end record;

   NullMsg  : constant MessageT := (Data   => (others => ASCII.Nul),
                                    Length => 0);


   type SPREMachineT is
   record
     Data : String(1 .. 30);
     Length : Natural range 0 .. 30;
   end record;

   --------------------------------------------------------------------
   -- ConnectToSPRE
   --
   -- Description:
   --    Makes a TCP/IP connection to either the Portal port or the Admin port.
   --
   --------------------------------------------------------------------

   procedure ConnectToSPRE ( IsAdmin : in     Boolean;
                             Success :    out Boolean);


   --------------------------------------------------------------------
   -- DisconnectFromSPRE
   --
   -- Description:
   --    Closes the TCP/IP connection with either the Portal port or the Admin port.
   --
   --------------------------------------------------------------------

   procedure DisconnectFromSPRE (IsAdmin : in     Boolean;
                                  Success :    out Boolean);


   --------------------------------------------------------------------
   -- OpenAll
   --
   -- Description:
   --    Opens TCP/IP connections to both the Portal and Admin ports.
   --
   --------------------------------------------------------------------

   procedure OpenAll(Success : out Boolean);


   --------------------------------------------------------------------
   -- CloseAll
   --
   -- Description:
   --    Closes the TCP/IP connection with both the Portal and Admin ports.
   --
   --------------------------------------------------------------------

   procedure CloseAll;


   --------------------------------------------------------------------
   -- SendAndReceive
   --
   -- Description:
   --    Sends the Remote Procedure Call (RPC) to SPRE and then attempts to
   --    receive the reply. Success will be false if there is a communication
   --    error.
   --    Outgoing and Incoming do not include the message delineation sequence:
   --    This procedure appends the sequence to the Outgoing string, and
   --    removes it from the Incoming string.
   --
   --------------------------------------------------------------------

   procedure SendAndReceive ( IsAdmin  : in     Boolean;
                              Outgoing : in     MessageT;
                              Incoming :    out MessageT;
                              Success  :    out Boolean);

   --------------------------------------------------------------------
   -- InitMachine
   --
   -- Description:
   --    Sets the default machine name for the Test Devices.
   --
   --------------------------------------------------------------------

   procedure InitMachine (Machine  : in SPREMachineT);

end TcpIp.MakeCard;
