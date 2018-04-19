# luFactor.m
## Purpose
Once opened in Matlab the function luFactor we be ready to use. luFactor.m will provide the user the lower triangular matrix, upper triangular matrix, and the pivot matrix for a user inputed coefficient matrix.
### Inputs
This Matlab function contains one input. The only input is A which is the coefficient matrix which is a symmetrical matrix that represents a system of equations.
### Outputs
This Matlab function contains three outputs. The first output is L which is the lower triangular matrix of A allowing the user to see what multipliers were used throughout gauss elimination. The second output is U which is the upper triangular matrix of A which allows the user to see the factorization of matrix A using gauss elimination with pivoting. The final output is P which is the pivot matrix of A allowing the user to see a matrix that keeps track of row switches throughout gauss elimination and begins as an identity matrix.
### Limitations
This algorithm can only run for symmetrical matrices meaning that the number of rows must equal the number of columns.
### Useful Information
Example on how to use:
clear
clc
A=[1 2 3; 4 5 6; 7 8 9]
luFactor(A)