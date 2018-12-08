with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
  procedure I_Return_String(S : out String) is
  begin
    S := "Hellew, I am an Ada string.";
  end I_Return_String;

  Str : String;
begin
  I_Return_String(Str);
  Put_Line("Output string is here ==>" & Str & "<==");
end Main;

