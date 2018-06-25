with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
  procedure C_Fun;
  pragma Import(C, C_Fun, "i_am_c");
begin
  Put_Line("Calling external C code from Ada main.");
  C_Fun;
  Put_Line("Exiting Ada main.");
end Main;
