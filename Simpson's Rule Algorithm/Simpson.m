function I=Simpson(x,y)
%The function Simpson.m will take a given input output matrix and calculate
%the intergral of the given data set. The function will make sure that the
%inputs are equally spaced apart. Finally this fuction will use the
%simpson's 1/3 ruler to calculate the integral unless there is an odd
%amount of intervals in which the function will use simpson's 1/3 rule
%until the las interval where the function will use the trapezoidal rule.
%Inputs:
%   x= vector inputs
%   y= vector outputs
%Outputs:
%   I=The integral of the experimental data
%Created By: Benjamin Markworth on April 8, 2018 for MECH 105 at CSU
%% Error Statements
%Error Statement if less than or more than two inputs are inputed
if nargin~=2
    error('The function will only run with two inputs x and y. Make sure you only had two inputs which were the vector values y with respect to x.')
end
%Error statement if the input matrixes are of different size
xl=length(x);
xy=length(y);
if xl~=xy
    error('The input matrixes must be the same size.')
end
%Error statement if the x inputs are not equally spaced
dx=diff(x);
if max(dx)~=min(dx)
    error('The x inputs are not equally spaced.')
end
%% Calculating the integral
%Finding how many intervals are needed
numinterval=length(x)-1;
%Seeing if the interval count is odd or even (If r=0 then the amount of
%intervals are even and if it doesnt equal 0 then the amount of intervals
%is odd.
r=rem(numinterval,2);
%Calculating h
h=((x(1,end))-(x(1,1)))/numinterval;
%Determining the odd and even y points based on their order in the vector.
%Ex y3,y5,y7,... are odd and y2,y4,y6,... are even.
oddy=y(3:2:(end-2));
eveny=y(2:2:(end-1));
%Calculating the integral when the number of intervals is even
if r==0
    I=(h/3)*((y(1,1)+4*(sum(oddy))+2*(sum(eveny))+y(1,end)));
%Calculating the integral when the number of intervals is odd
else
    %Calculating the integral for the number of intervals-1 using simpsons 1/3 rule
    IS=(h/3)*((y(1,1)+4*(sum(oddy))+2*(sum(eveny))+y(1,end)));
    %Calculating the final intervals integral using trapezoidal rule
    IT=(x(1,end)-x(1,(end-1)))*((y(1,(end-1))+y(1,end))/2);
    %Adding both calculations together to get the final integral value
    I=IS+IT;
    %Displaying warning that the trapezoidal rule was used on last interval
    warning('Trapezoidal Rule was used on the last interval.')
end
%Displaying the integral output
disp(I)
end
