︠475253ae-cb15-4af2-9f55-3bf9453cfa26︠
%md
# Project 7: $LU$ Decomposition with Partial Pivoting!

## Jony Karki
︡b8ac4df5-52b2-4331-a63a-00b24708a017︡{"done":true,"md":"# Project 7: $LU$ Decomposition with Partial Pivoting!\n\n## Jony Karki"}
︠19de121a-5a65-48e8-b88f-b38d6de5104d︠
%md
## Problem 1

LU decomposition of matrix is the factorization of a particular matrix into two matrices: a upper traingular matrix and a lower triangular matrix so that the product of these two matrices is the original matrix itself. It is a method of solving the system of equations. LU decomposition is very similar to the Gaussian elimination as the steps of reduction are same for both cases. We do the steps similar to gaussian elimination to form the matrix into a upper traingular matrix by multiplying and swapping the rows as necessary. This matrix obtained at last is our U matrix. we can similarly get the L matrix(Lower traingular matrix) which is the matrix of all the operations used in the intermediate steps. We also get a permutation matrix which is the identity matrix and represents all the swaps done in the intermediate steps. Finally, we can represent the given matrix as the product of L and U.
︡ca9b767f-4d83-4680-ada7-f0052d6a1970︡{"done":true,"md":"## Problem 1\n\nLU decomposition of matrix is the factorization of a particular matrix into two matrices: a upper traingular matrix and a lower triangular matrix so that the product of these two matrices is the original matrix itself. It is a method of solving the system of equations. LU decomposition is very similar to the Gaussian elimination as the steps of reduction are same for both cases. We do the steps similar to gaussian elimination to form the matrix into a upper traingular matrix by multiplying and swapping the rows as necessary. This matrix obtained at last is our U matrix. we can similarly get the L matrix(Lower traingular matrix) which is the matrix of all the operations used in the intermediate steps. We also get a permutation matrix which is the identity matrix and represents all the swaps done in the intermediate steps. Finally, we can represent the given matrix as the product of L and U."}
︠e9ef9cd9-adfb-4dd2-a065-509e731b2a7a︠
%md
## Problem 2

LU decomposition of matrix:
```
m = [[1,2,3],[4,5,6],[7,8,-9],[10,11,-12]]
```
is
```
p = [[0, 0, 0, 1], [1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0]]
l = [[1, 0, 0, 0], [1/10, 1, 0, 0], [2/5, 2/3, 1, 0], [7/10, 1/3, -1/4, 1]]
u = [[10, 11, -12], [0, 9/10, 21/5], [0, 0, 8], [0, 0, 0]]
```
︡1d53c5dd-a1a7-470c-85c9-90bc0e347172︡{"done":true,"md":"## Problem 2\n\nLU decomposition of matrix:\n```\nm = [[1,2,3],[4,5,6],[7,8,-9],[10,11,-12]]\n```\nis\n```\np = [[0, 0, 0, 1], [1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0]]\nl = [[1, 0, 0, 0], [1/10, 1, 0, 0], [2/5, 2/3, 1, 0], [7/10, 1/3, -1/4, 1]]\nu = [[10, 11, -12], [0, 9/10, 21/5], [0, 0, 8], [0, 0, 0]]\n```"}
︠8e434deb-30e1-48a1-b379-367e1d1f9ffbs︠
## Problem 3

def palu(grid_list, explain_steps=False):
    new_matrix = [list(row) for row in grid_list]
    m,n = len(new_matrix), len(new_matrix[0])
    perm_matrix = [[1 if r==c else 0 for c in range(m)] for r in range(m)]
    lower_tri = [[0 for c in range(m)] for r in range(m)]
    
    i,j = 0,0
    row_ops = []
    while i<m and j<n:
        # Find position in column j of maximum absolute value:
        swap_val,swap_row_index = sorted([(abs(new_matrix[r][j]),r) for r in range(i,m)], reverse=True)[0]
        if swap_val == 0:
            # All zeros in column
            j += 1; continue
        elif swap_row_index != i:
            # Swap rows. Remember to swap rows both in new_matrix and perm_matrix
            # ***FIX***
            new_matrix[j], new_matrix[swap_row_index] = new_matrix[swap_row_index], new_matrix[j]
            perm_matrix[j], perm_matrix[swap_row_index] = perm_matrix[swap_row_index], perm_matrix[j]
            lower_tri[j], lower_tri[swap_row_index] = lower_tri[swap_row_index], lower_tri[j]
            
            row_ops.append("r_{}:r_{}".format(1+swap_row_index,1+i))
        for r in range(i+1, m):
            # Eliminate entries below the pivot position using alpha*R_i + R_j operations
            # Remember to store -alpha in the lower portion of the matrix.
            # ***FIX***
            if new_matrix[r][j] != 0:
                alpha = -new_matrix[r][j]/new_matrix[j][j]
                scaled_row = [alpha * k for k in new_matrix[i]]
                lower_tri[r][j] = -alpha
                new_matrix[r] = [b + c for b, c in zip(scaled_row,new_matrix[r])]

                row_ops.append( "({})r_{} + r_{}".format(alpha,1+i,1+r))
            
        i+=1
        j+=1
    # Now you have to pull apart the matrix new_matrix into the lower_tri and upper_tri parts.
    #***FIX***
    lower_tri = [[1 if a == b else lower_tri[b][a] for a in range(m)] for b in range(m)]
    upper_tri = new_matrix
    
    # The argument "explain_steps" to the function is False by default, but you can pass a 
    # second argument True to the function and it will print the row operations you were trying to
    # use. This is a good way to test your work.
    if explain_steps:
        print ", ".join(row_ops)
    
    return perm_matrix, lower_tri, upper_tri
︡66aa00d2-1239-4f83-849f-edfc738848d3︡{"done":true}
︠a03051e6-1328-4af1-9394-46c3cf7c00c9s︠
for i in palu([[1,2,3],[4,5,6],[7,8,-9],[10,11,-12]], explain_steps = True):
    print i
︡ff229eff-3137-4e97-858d-88c3600e427c︡{"stdout":"r_4:r_1, (-2/5)r_1 + r_2, (-7/10)r_1 + r_3, (-1/10)r_1 + r_4, r_4:r_2, (-1/3)r_2 + r_3, (-2/3)r_2 + r_4, r_4:r_3, (1/4)r_3 + r_4\n[[0, 0, 0, 1], [1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0]]\n[[1, 0, 0, 0], [1/10, 1, 0, 0], [2/5, 2/3, 1, 0], [7/10, 1/3, -1/4, 1]]\n[[10, 11, -12], [0, 9/10, 21/5], [0, 0, 8], [0, 0, 0]]\n"}︡{"done":true}
︠9f4cb709-74d0-418e-860e-517ae620a77bs︠
︡21dd4054-4110-4078-a474-d117c1bc9ac4︡{"done":true}
︠4836c6b6-801c-4bf4-85c1-07b2580b2c79s︠
for i in palu([[1,2],[3,4],[5,-6],[7,9]], explain_steps = True):
    print i
︡b312418d-6309-4efd-b6ac-eaffdde2f37a︡{"stdout":"r_4:r_1, (-3/7)r_1 + r_2, (-5/7)r_1 + r_3, (-1/7)r_1 + r_4, r_3:r_2, (1/87)r_2 + r_3, (5/87)r_2 + r_4\n[[0, 0, 0, 1], [0, 0, 1, 0], [0, 1, 0, 0], [1, 0, 0, 0]]\n[[1, 0, 0, 0], [5/7, 1, 0, 0], [3/7, -1/87, 1, 0], [1/7, -5/87, 0, 1]]\n[[7, 9], [0, -87/7], [0, 0], [0, 0]]\n"}︡{"done":true}
︠ffd7f571-e6f3-4b05-acb9-22b209270d86︠









