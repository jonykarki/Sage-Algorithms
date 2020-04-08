︠5f9440ed-65d4-445f-8bbc-eba379409fdcs︠
%auto  # This line makes this cell execute automatically when the worksheet starts.
load("new_aam_matrix.sage") # This loads your matrix class
%md
# Project 5: Matrices
## Jony Karki
︡7b3aa4c4-bf46-47bd-941e-77e0d96f4756︡{"stdout":"aam_matrix class loaded. Type help(aam_matrix) for methods and attributes.\n"}︡{"md":"# Project 5: Matrices\n## Jony Karki"}︡{"done":true}
︠f7689219-f975-4760-9b12-976b915f29e8s︠
help(aam_matrix)
︡c60a0cc8-d34c-4b70-876c-1f015779046a︡{"stdout":"Help on class aam_matrix in module __builtin__:\n\nclass aam_matrix\n |  A matrix class.\n |  \n |  Methods defined here:\n |  \n |  __add__(self, right)\n |      self + right requires that right be an aam_matrix of the correct dimensions.\n |  \n |  __getitem__(self, (i, j))\n |      A[i,j] returns the element of A in the ith row, jth column, indexed from 1.\n |  \n |  __init__(self, grid)\n |      Instantiate an aam_matrix from a list of lists of numbers.\n |  \n |  __mul__(self, right)\n |      self * right requires that right be numeric or that right be an aam_matrix of correct dimensions.\n |  \n |  __neg__(self)\n |  \n |  __pow__(self, other)\n |  \n |  __radd__(self, left)\n |      left + self requires that left be an aam_matrix of the correct dimensions.\n |  \n |  __repr__(self)\n |      Human readable matrices.\n |  \n |  __rmul__(self, left)\n |      left * self will only trigger if left is not aam_matrix, in which case scalar multiplication of matrices is commutative.\n |  \n |  __sub__(self, right)\n |      self + right requires that right be an aam_matrix of the correct dimensions.\n |  \n |  dims(self)\n |      A.dims() returns the row and column dimension of A as a tuple.\n\n"}︡{"done":true}
︠7cde1230-808e-4633-80f8-0ee072537421︠
%md
## Problem 1

1. The algorithm for matrix subtraction:\
    a. First of all make sure that the matrices that are passed to the function have the same dimensions.\
    b. Make a new_list = []\
    c. loop for the length of the row times of the matrix using the loop variable 'i'\
        c1. make a new list called new_row = []\
         c2. loop for the length of the column of the matrix using the loop variable j.\
             c21. for each iteration, append the difference of elements at the ijth position of position of both matrices into the new_row list.\
         c3. at each iteration of the first loop, append the new_row list into the new_list.\
    d. return the aam_matrix object of the new_list.\

2. In order for a square of a matrix to exist, the matrix must be a square matrix (matrix with same number of rows and columns) because inorder to multiply two matrices the number of column of the first matrix must be equal to the number of rows of the second matrix.

3. The algorithm for the nth power of a matrix:\
    a. make sure that the n of the exponent is a non-negative integer.\
    b. store the matrix in a current variable.\
    c. loop for n times,\
    c1. on each iteration of the loop, assign current * matrix to the current variable.\
    d. at the end of the first loop return the current variable.\
︡22116e67-64b5-4a39-9557-a51bc058a90b︡{"done":true,"md":"## Problem 1\n\n1. The algorithm for matrix subtraction:\\\n    a. First of all make sure that the matrices that are passed to the function have the same dimensions.\\\n    b. Make a new_list = []\\\n    c. loop for the length of the row times of the matrix using the loop variable 'i'\\\n        c1. make a new list called new_row = []\\\n         c2. loop for the length of the column of the matrix using the loop variable j.\\\n             c21. for each iteration, append the difference of elements at the ijth position of position of both matrices into the new_row list.\\\n         c3. at each iteration of the first loop, append the new_row list into the new_list.\\\n    d. return the aam_matrix object of the new_list.\\\n    \n2. In order for a square of a matrix to exist, the matrix must be a square matrix (matrix with same number of rows and columns) because inorder to multiply two matrices the number of column of the first matrix must be equal to the number of rows of the second matrix.\n\n3. The algorithm for the nth power of a matrix:\\\n    a. make sure that the n of the exponent is a non-negative integer.\\\n    b. store the matrix in a current variable.\\\n    c. loop for n times,\\\n    c1. on each iteration of the loop, assign current * matrix to the current variable.\\\n    d. at the end of the first loop return the current variable.\\"}
︠5bfe9392-97d1-4de5-87dd-15e80ba8cb46︠
\
 # Problem 2 Test
A = aam_matrix([[1,2,3],[4,10,6],[7,8,9]])
B = aam_matrix([[2,4,4],[65,2,3],[4,6,7]])
print B - A
︡72d3b9ee-133a-49d3-8515-54af7ef9d1fa︡{"stdout":"[ 1  2  1]\n[61 -8 -3]\n[-3 -2 -2]\n"}︡{"done":true}
︠c15d745f-9d22-4117-a146-9739a8fe3595s︠
︡8b3295ba-06d0-49a3-aace-4ad05a370a1e︡{"done":true}









