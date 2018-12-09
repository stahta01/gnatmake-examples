--with Ada.Calendar;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
begin

  declare
    PP : Positive;
--    Now : Ada.Calendar.Time;
    P2 : Positive;
  begin
--    Now := Ada.Calendar.Clock;
    -- Year will obviously be bigger than 1920
--    PP := 1920 - Positive(Ada.Calendar.Year(Now));
    P2 := 5;
    PP := 3 - P2;
  exception
    when Constraint_Error =>
      Put_Line("Assigning a negative to a Positive causes Constraint_Error");
  end;

end Main;

