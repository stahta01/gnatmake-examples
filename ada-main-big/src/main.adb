with Ada.Text_IO; use Ada.Text_IO;
with I_Am_Ada;
with I_Am_Ada_Too;

procedure Main is
  procedure Cpp_Fun;
  pragma Import(C, Cpp_Fun, "i_am_adaInterface");
  procedure C_Fun;
  pragma Import(C, C_Fun, "i_am_c");
begin
  Put_Line("Calling external C++ code from Ada main.");
  Cpp_Fun;
  Put_Line("Calling external C code from Ada main.");
  C_Fun;
  Put_Line("Calling Ada code from Ada main.");
  I_Am_Ada.Ada_Procedure;
  I_Am_Ada_Too.Ada_Procedure_Too;
  Put_Line("Exiting Ada main.");
end Main;
