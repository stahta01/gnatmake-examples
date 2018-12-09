with Ada.Calendar;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
begin

  declare
    PP : Positive;
    Now : Ada.Calendar.Time := Ada.Calendar.Clock;
  begin
    -- Year will obviously be bigger than 3
    PP := 3 - Positive(Ada.Calendar.Year(Now));
  exception
    when Constraint_Error =>
      Put_Line("Assigning a negative to a Positive causes Constraint_Error");
  end;

end Main;

