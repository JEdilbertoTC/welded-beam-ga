type fitness
ObjectiveFunction = @fitness;

type constraints
ConstraintFunction = @constraints;

nvars = 4;
lb = [0.1 0.1 0.1 0.1];
ub = [2.0 10.0 10.0 2.0];

%x0 = lb + rand(1,nvars).*(ub-lb);

options = optimoptions("ga",'PlotFcn',{@gaplotbestf, @gaplotstopping}, 'Display','iter');
options.SelectionFcn = @selectiontournament;
options.PopulationSize = 150;
options.MaxGenerations = 200;
%option.InitialPopulationMatrix = x0;

[x, fval] = ga(ObjectiveFunction, nvars, [], [], [], [], lb, ub, ...
                       ConstraintFunction,options);

display(fval)