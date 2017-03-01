






% Project 1

% To calculate the cost, operation, and maintenance of machine per year
% including salvage and depreciation value between 2 machines

%clear,clc after finalizing program

%Request Initial cost of machine
initial1 = input('\nWhat is the cost to purchase machine 1? ');
initial2 = input('What is the cost to purchase machine 2? ');

%Request expected life of machine
life1 = input('What is the expected life of machine 1 in years? ');
life2 = input('What is the expected life of machine 2 in years? ');


%Request monthly interest rate
interest1 = input('What is the monthly interest rate of machine 1(%)? ');
interest2 = input('What is the monthly interest rate of machine 2(%)? ');


%Change Interest into decimal notation
i1 = interest1/100;
i2 = interest2/100;


%Request annual O/M cost
om1 = input('What is the annual operating and maintenance cost of machine 1? ');
om2 = input('What is the annual operating and maintenance cost of machine 2? ');


%Request salvage value
sal1 = input('What is the expected salvage value of machine 1? ');
sal2 = input('What is the expected salvage value of machine 2? ');

%Request no. of machines required
nm1 = input('How many machines 1 are required? ');
nm2 = input('How many machines 2 are required? ');

%Request amount of employee per machine
employee1 = input('How many employees are required for machine 1? ');
employee2 = input('How many employees are required for machine 2? ');

%Request labor cost of employee
labor1 = input('Labor cost per employee to operate machine 1? ');
labor2 = input('Labor cost per employee to operate machine 2? ');

%User Input Table
format long
labelY = {'Cost(USD)';'Life Expectancy(Years)';'Interest Rate(%)';'O/M(USD)';'Salvage Value(USD)';'No. of machines required';
    'No. of employees required';'Labor cost(USD)'};
Machine_1 = [initial1;life1;interest1;om1;sal1;nm1;employee1;labor1];
Machine_2 = [initial2;life2;interest2;om2;sal2;nm2;employee2;labor2];
T = table(Machine_1,Machine_2,...
    'RowNames',labelY);

y = 1;
n = 0;
yesno = input('This is your input. (y/n) ' );


if yesno == 1

%Equation Present Worth
Annual_Initial_Cost1 = nm1*initial1 *((i1 * ((1 + i1)^life1)))/(((1 + i1)^life1) - 1);
Annual_Initial_Cost2 = nm2*initial2 *((i2 * ((1 + i2)^life2)))/(((1 + i2)^life2) - 1);

%Salvage value equation
salvage1 = nm1*(sal1*(i1))/(((1 + i1)^life1) - 1);
salvage2 = nm2*(sal2*(i2))/(((1 + i2)^life2) - 1);

%O/M cost
omc1 = om1*nm1;
omc2 = om2*nm2;

%Labor Cost
lc1 = labor1*employee1;
lc2 = labor2*employee2;

%Equivalent uniform annual cost  (EUAC)
euac1 = Annual_Initial_Cost1 + omc1 - salvage1 + lc1;
euac2 = Annual_Initial_Cost2 + omc2 - salvage2 + lc2;


%Table of EUAC
%User Output Table
labelY = {'Annual Initial Cost(USD)';'O/M Cost(USD)';'Salvage Value(USD)';'Labor Cost';'EUAC(USD)'};
Machine_1 = [Annual_Initial_Cost1;om1;-salvage1;lc1;euac1];
Machine_2 = [Annual_Initial_Cost2;om2;-salvage2;lc2;euac2];
T = table(Machine_1,Machine_2,...
    'RowNames',labelY);
    if euac1 < euac2
        fprintf('Machine 1 is cheaper to operate.\n');
        diff1 = euac2 - euac1;
        fprintf('Difference in cost is %.2f\n', diff1);
    elseif euac1 == euac2
        fprintf('Both machines are equal to operate.\n');
    else
        fprintf('Machine 2 is cheaper to operate.\n');
        diff2 = euac1 - euac2;
        fprintf('Difference in cost is %.2f\n', diff2);
    end


    graph = [euac1 euac2];
    bar(graph, 0.2);
    x = 1:1:2;
    ylabel('Equivalent Uniform Annual Cost (USD)');
    xlabel('Machine');
    set(gca, 'YTickLabel', num2str(get(gca,'YTick')','%d'))


else
  ProjectFOUR

end

