with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Main is
  package SU renames Ada.Strings.Unbounded;

  procedure I_Return_String(Sun : out SU.Unbounded_String) is
  begin
    Sun := SU.To_Unbounded_String("Hellew, I am an Ada string.");
  end I_Return_String;

  SUnb : SU.Unbounded_String;
begin
  I_Return_String(SUnb);
  Put_Line("Output string is here ==>" & SU.To_String(SUnb) & "<==");
end Main;

