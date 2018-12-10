with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
begin
  -- Guide:  http://archive.adaic.com/standards/83lrm/html/lrm-11-01.html
  declare
    PP : Positive;
    P2 : Positive;
  begin
    P2 := 5;
    PP := 3 - P2;  -- intentionally violate Positive range constraint
  exception
    when Constraint_Error =>
      Put_Line("HANDLED: violate range constraint gives Constraint_Error");
  end;

  declare
    SS : String(1..4);
    PP : Positive;
  begin
    PP := 5;
    SS(PP) := 'X';  -- intentionally violate SS's index constraint
  exception
    when Constraint_Error =>
      Put_Line("HANDLED: violate index constraint gives Constraint_Error");
  end;

  declare
    type Buffer(Size : Positive := 4) is
      record
        Value : String(1..Size);
      end record;
--    BB : Buffer;  -- accept default Size
  begin  -- TBD: intentionally violate BB's discriminant constraint
--    BB.Value(3) := 'Y';
    null;
  exception
    when Constraint_Error =>
      Put_Line("HANDLED: violate discriminant constraint gives"
               & " Constraint_Error");
  end;

  declare
    type Liquid is (None, Water);
    type Glass (Contents : Liquid) is
      record
        Weight : Positive;
      case Contents is
        when Water =>
          Ounces : Positive;
        when None =>
          null;
      end case;
    end record;
    GG : Glass(None);
  begin
    GG.Ounces := 5;
  exception
    when Constraint_Error =>
      Put_Line("HANDLED: violate variant record component existance gives"
               & " Constraint_Error");
  end;

end Main;

