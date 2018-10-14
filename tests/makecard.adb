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
-- Make Card main program
--
-- Description:
--    makes card data for checking
--    or adds the card to SPRE database.
--
-- Implementation Notes:
--    None.
------------------------------------------------------------------
with File;
with Ada.Strings.Fixed;
with Ada.Text_IO;
with TcpIp.MakeCard;
with Ada.Command_Line;
with Ada.Streams.Stream_IO;
procedure MakeCard
is

   type Options is (BadOption, AddCard, MakeCard, Enrol);
   CardName : String(1 .. 100) := (others =>' ');
   CardNameLength : Positive;
   Option : Options;
   CardFile : File.T;
   TheChar : Character;
   CertString : String(1 .. 4096) := (others => ' ');
   CertLength : Natural := 0;

   type CertType is (None, IDCert, PrivCert, AuthCert, IACert);
   CurrentCert : CertType := None;

   TheCommand,
   DontCare    : TcpIp.MakeCard.MessageT;
   TestFile : File.T;
   Unused, Opened : Boolean;
   InFile : Ada.Streams.Stream_IO.File_Type;

   LocalSim : Boolean := False;
   SimMachine : TcpIp.MakeCard.SPREMachineT :=
     (Data   => (others => ASCII.Nul),
      Length => 0);

   ------------------------------------------------------------------
   -- InitTestDevices
   --
   -- Description:
   --    Performs the Initialisation of the
   --    TCP/IP interface.
   --
   ------------------------------------------------------------------
   procedure InitTestDevices
   is
      OK : Boolean;
   begin
      if LocalSim then
         TCPIP.MakeCard.InitMachine(SimMachine);
      end if;
      TCPIP.MakeCard.OpenAll(OK);

   end InitTestDevices;

   ------------------------------------------------------------------
   -- FinaliseTestDevices
   --
   -- Description:
   --    Performs the Finalisation of the
   --    TCP/IP interface.
   --
   ------------------------------------------------------------------
   procedure FinaliseTestDevices
   is
   begin
      TCPIP.MakeCard.CloseAll;
   end FinaliseTestDevices;



   procedure WriteCurrentCert is
      LengthStr : String := Integer'Image(CertLength);

   begin

      case CurrentCert is
         when None =>
            null;
         when IDCert =>
            File.PutString(CardFile,
                           ", 'RawIDCert' : {'CertLength' : '" &
                           LengthStr(2 .. LengthStr'Length) &
                           "', 'CertDataT' : " & CertString(1..CertLength) & "}",
                           0);
         when AuthCert =>
            if CertLength = 2 then
               File.PutString(CardFile,
                              ", 'RawAuthCert' : {}",
                              0);

            else
               File.PutString(CardFile,
                              ", 'RawAuthCert' : {'CertLength' : '" &
                              LengthStr(2 .. LengthStr'Length) &
                              "', 'CertDataT' : " & CertString(1..CertLength) & "}",
                              0);
            end if;
         when IACert =>
            File.PutString(CardFile,
                           ", 'RawIACert' : {'CertLength' : '" &
                           LengthStr(2 .. LengthStr'Length) &
                           "', 'CertDataT' : " & CertString(1..CertLength) & "}",
                           0);
         when PrivCert =>
            File.PutString(CardFile,
                           ", 'RawPrivCert' : {'CertLength' : '" &
                           LengthStr(2 .. LengthStr'Length) &
                           "', 'CertDataT' : " & CertString(1..CertLength) & "}",
                           0);
      end case;
      CertLength := 0;
      CertString := (others => ' ');

   end WriteCurrentCert;


   procedure WriteEnrolCert is
      LengthStr : String := Integer'Image(CertLength);

   begin

         if CurrentCert = IDCert then
            File.PutString(CardFile,
                           "'CertLength' : '" &
                           LengthStr(2 .. LengthStr'Length) &
                           "', 'CertDataT' : " & CertString(1..CertLength),
                           0);
            File.NewLine(CardFile, 2);

         end if;
      CertLength := 0;
      CertString := (others => ' ');

   end WriteEnrolCert;


   --------------------------------------------------------------
   -- begin TestTIS
   --------------------------------------------------------------
begin

   Option := BadOption;

   if Ada.Command_Line.Argument_Count > 1 then
      if Ada.Command_Line.Argument(1) = "add" then
         CardNameLength := Ada.Command_Line.Argument(2)'Last;
         CardName(1 .. CardNameLength) := Ada.Command_Line.Argument(2);
         Option := AddCard;
         if Ada.Command_Line.Argument_Count > 2 then
            SimMachine.Length := Ada.Command_Line.Argument(3)'Last;
            SimMachine.Data (1 .. SimMachine.Length) :=
              Ada.Command_Line.Argument(3);
            LocalSim := True;
            Ada.Text_IO.Put_Line ("Local machine is " & SimMachine.Data (1..SimMachine.Length));
         end if;
      elsif Ada.Command_Line.Argument(1) = "make" then
         CardNameLength := Ada.Command_Line.Argument(2)'Last;
         CardName(1 .. CardNameLength) := Ada.Command_Line.Argument(2);
         Option := MakeCard;
      elsif Ada.Command_Line.Argument(1) = "enrol" then
         CardNameLength := Ada.Command_Line.Argument(2)'Last;
         CardName(1 .. CardNameLength) := Ada.Command_Line.Argument(2);
         Option := Enrol;
      else
         Ada.Text_IO.Put_Line("Invalid option");
      end if;

      if Option = AddCard and CardName(1) /= 'p' then
         Ada.Text_IO.Put_Line("Not a Praxis Card");
         Option := BadOption;
      end if;

   else
      Ada.Text_IO.Put_Line("Too Few Arguments");

   end if;


   case Option is
      when MakeCard =>
         File.SetName( TheFile => TestFile,
                       TheName => "./Temp/" & CardName(1 .. CardNameLength) & ".dat");

         if File.Exists ( TheFile => TestFile) then
            File.OpenRead(TheFile => TestFile,
                          Success => Opened);
         else
            Ada.Text_IO.Put_Line("Card file could not be found");
            Opened := False;
         end if;
         File.SetName(TheFile => CardFile,
                      TheName => "./Temp/card.dat");
         File.Create(TheFile => CardFile,
                     Success => Opened);
         if Opened then
            while not File.EndOfFile(TestFile) loop

               File.GetLine(TestFile, TheCommand.Data, TheCommand.Length);
               if TheCommand.Length >= 3 and TheCommand.Data(1..3) = "***" then
                  WriteCurrentCert;
                  if TheCommand.Data(1 .. TheCommand.Length) = "***IDCERT" then
                     CurrentCert := IDCert;
                  elsif TheCommand.Data(1 .. TheCommand.Length) = "***IACERT" then
                     CurrentCert := IACert;
                  elsif TheCommand.Data(1 .. TheCommand.Length) = "***AUTHCERT" then
                     CurrentCert := AuthCert;
                  elsif TheCommand.Data(1 .. TheCommand.Length) = "***PRIVCERT" then
                     CurrentCert := PrivCert;
                  else -- Must be the end
                     CurrentCert := None;
                  end if;
               else
                  if CurrentCert = None then
                     -- Write Direct To File
                     File.PutString(CardFile,
                                    TheCommand.Data(1 .. TheCommand.Length),
                                    TheCommand.Length);
                  elsif TheCommand.Length /= 0 then
                     CertString(CertLength + 1 .. CertLength + TheCommand.Length) :=
                       TheCommand.Data(1 .. TheCommand.Length);
                     CertLength := CertLength + TheCommand.Length;
                  end if;

               end if;
            end loop;
         end if;
         File.Close(TheFile => TestFile, Success => Unused);
         File.Close(TheFile => CardFile, Success => Unused);

      when Enrol =>
         File.SetName( TheFile => TestFile,
                       TheName => "./Temp/" & CardName(1 .. CardNameLength) & ".dat");

         if File.Exists ( TheFile => TestFile) then
            File.OpenRead(TheFile => TestFile,
                          Success => Opened);
         else
            Ada.Text_IO.Put_Line("Card file could not be found");
            Opened := False;
         end if;
         File.SetName(TheFile => CardFile,
                      TheName => "./Temp/enrol.dat");
         File.Create(TheFile => CardFile,
                     Success => Opened);
         if Opened then
            while not File.EndOfFile(TestFile) loop

               File.GetLine(TestFile, TheCommand.Data, TheCommand.Length);
               if TheCommand.Length >= 3 and TheCommand.Data(1..3) = "***" then
                  WriteEnrolCert;
                  if TheCommand.Data(1 .. TheCommand.Length) = "***IDCERT" then
                     CurrentCert := IDCert;
                  else -- Must be the end
                     CurrentCert := None;
                  end if;
               else
                  if CurrentCert /= None and TheCommand.Length /= 0 then
                     CertString(CertLength + 1 .. CertLength + TheCommand.Length) :=
                       TheCommand.Data(1 .. TheCommand.Length);
                     CertLength := CertLength + TheCommand.Length;
                  end if;

               end if;
            end loop;
         end if;
         File.Close(TheFile => TestFile, Success => Unused);
         File.Close(TheFile => CardFile, Success => Unused);

      when AddCard =>
         InitTestDevices;
         null;

         Ada.Streams.Stream_IO.Open
           (InFile, Ada.Streams.Stream_IO.In_File, "Temp/card.dat");

         declare
            CommandText : String := "cardDB.putCard( '"
              & CardName(1 .. CardNameLength) & "', '";
         begin
            TheCommand.Length := CommandText'Length;
            TheCommand.Data(1 .. TheCommand.Length) := CommandText;
         end;

         while not Ada.Streams.Stream_IO.End_Of_File(InFile) loop
            Character'Read(Ada.Streams.Stream_IO.Stream(InFile), TheChar);
--            if TheChar = ''' then
--               -- escape this
--               TheCommand.Length := TheCommand.Length + 1;
--               TheCommand.Data(TheCommand.Length) := '\';
--            end if;
            TheCommand.Length := TheCommand.Length + 1;
            TheCommand.Data(TheCommand.Length) := TheChar;
         end loop;
         TheCommand.Length := TheCommand.Length + 1;
         TheCommand.Data(TheCommand.Length) := ''';
         TheCommand.Length := TheCommand.Length + 1;
         TheCommand.Data(TheCommand.Length) := ')';

         TcpIp.MakeCard.SendAndReceive ( IsAdmin  => False,
                                         Outgoing => TheCommand,
                                         Incoming => DontCare,
                                         Success  => Unused);

         Ada.Streams.Stream_IO.Close(InFile);

         FinaliseTestDevices;

      when others =>
         null;
   end case;
exception

   when E : others =>

      FinaliseTestDevices;

end MakeCard;
