# Simpson.m
## Purpose
Once opened in Matlab the function Simpson will be ready to use. Simpson.m will take a given input and output matrix and calculate the integral of the given data set. The functino will make sure that the inputs are equally spaced apart. Finally this function will use the Simpson's 1/3 Rule to calculate the integral unless there is an odd amount of intervals in which the function will use Simpson's 1/3 Rule until the last interval where the function will use the trapezoidal rule.
### Inputs
This Matlab function contains two inputs. The first input x is a matrix containing your independent vairable as a vector input. The second input y is a matrix containg your dependent variable as a vector input.
### Outputs
This Matlab function contains one output. The output is I and is the integral of the experimental data.
### Limitations
This Matlab function will only work when the input and output matrices have the same amount of elements. Also this function will only work when the spacing of the elements in the independent variable matrix are equally spaced. Finally, this algorithm will only work for a function with one independent variable and one dependent variable.
### Useful Information
If there is an odd number of intervals the trapezoidal rule will be used on the last interval.
Example on how to use:
clear

clc

x=[1 2 3 4 5 6]

y=[1 4 9 16 25 36]

Simpson(x,y)
