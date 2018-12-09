with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
begin

  declare
    PP : Positive;
    P2 : Positive := 4;
  begin
    PP := 3 - P2;
  exception
    when Constraint_Error =>
      Put_Line("Assigning a negative to a Positive causes Constraint_Error");
  end;

end Main;

