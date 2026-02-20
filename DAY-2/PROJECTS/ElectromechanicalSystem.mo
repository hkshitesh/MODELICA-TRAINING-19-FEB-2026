model ElectromechanicalSystem
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 24)  annotation(
    Placement(transformation(origin = {-84, 32}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 2)  annotation(
    Placement(transformation(origin = {-40, 62}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L = .5)  annotation(
    Placement(transformation(origin = {32, 62}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(transformation(origin = {-84, -22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet dcpm(Jr = .01, VaNominal = 24, IaNominal = 10, wNominal = 157.07963267948966, TaNominal = 298.15, Ra = 1)  annotation(
    Placement(transformation(origin = {-58, -54}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.02)  annotation(
    Placement(transformation(origin = {-12, -54}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 0.1)  annotation(
    Placement(transformation(origin = {26, -54}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {66, -48}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(constantVoltage.p, resistor.p) annotation(
    Line(points = {{-94, 32}, {-94, 62}, {-50, 62}}, color = {0, 0, 255}));
  connect(resistor.n, inductor.p) annotation(
    Line(points = {{-30, 62}, {22, 62}}, color = {0, 0, 255}));
  connect(inductor.n, dcpm.pin_ap) annotation(
    Line(points = {{42, 62}, {36, 62}, {36, 8}, {-52, 8}, {-52, -44}}, color = {0, 0, 255}));
  connect(ground.p, dcpm.pin_an) annotation(
    Line(points = {{-84, -12}, {-68, -12}, {-68, -44}, {-64, -44}}, color = {0, 0, 255}));
  connect(constantVoltage.n, ground.p) annotation(
    Line(points = {{-74, 32}, {-64, 32}, {-64, 8}, {-84, 8}, {-84, -12}}, color = {0, 0, 255}));
  connect(dcpm.flange, inertia.flange_a) annotation(
    Line(points = {{-48, -54}, {-22, -54}}));
  connect(inertia.flange_b, damper.flange_a) annotation(
    Line(points = {{-2, -54}, {16, -54}}));
  connect(damper.flange_b, fixed.flange) annotation(
    Line(points = {{36, -54}, {42, -54}, {42, -36}, {66, -36}, {66, -48}}));

annotation(
    uses(Modelica(version = "4.1.0")));
end ElectromechanicalSystem;
