with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
begin

  declare
    PP : Positive;
    P2 : Positive;
  begin
    P2 := 5;
    PP := 3 - P2;
  exception
    when Constraint_Error =>
      Put_Line("HANDLED: Assign negative to Positive causes Constraint_Error");
  end;

  declare
    SS : String(1..4);
    PP : Positive;
  begin
    PP := 5;
    SS(PP) := 'X';
  exception
    when Constraint_Error =>
      Put_Line("HANDLED: array index out of bounds causes Constraint_Error");
  end;

end Main;

