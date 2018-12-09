with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
begin

  declare
    PP : Positive;
  begin
    PP := -4;
  exception
    when Constraint_Error =>
      Put_Line("Assigning a negative to a Positive causes Constraint_Error");
  end;

end Main;

