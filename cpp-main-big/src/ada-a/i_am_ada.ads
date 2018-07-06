package I_Am_Ada is
  procedure Ada_Procedure;
  pragma Export (C, Ada_Procedure, "ada_procedure");
end I_Am_Ada;
