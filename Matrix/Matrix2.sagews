︠d1b7146d-7e12-449d-85a8-0d75ed284aba︠
%md
# Project 6: Vectors and Matrices

## Jony Karki
︡9e07aecf-348f-4a9f-ab19-a410af24d142︡{"done":true,"md":"# Project 6: Vectors and Matrices\n\n## Jony Karki"}
︠07366936-528a-4d6c-a0ec-d4191bb12c61︠
%md
Algorithm for Gaussian Elimination with partial pivoting:
1. Let A be the list of lists representing a matrix
2. for i in range(1,len(A)+1):
    + 2.1 If value at A[i-1,i-1] is not the greatest in that column:
        + 2.1.1 swap the current row with the row having the largest value.
    + 2.2 scale row i of matrix A by (1/A[i-1][i-1])
    + 2.3 for j in range(i+1,len(A)+1):
        + 2.3.1 let alpha = (-A[j-1][i-1]/A[i-1][i-1])
        + 2.3.2 eliminate the row j by multiplying row i by alpha and adding to the current jth row.
3. return A
︡32311429-46fb-4730-a71a-5274755a16e6︡{"done":true,"md":"Algorithm for Gaussian Elimination with partial pivoting:\n1. Let A be the list of lists representing a matrix\n2. for i in range(1,len(A)+1):\n    + 2.1 If value at A[i-1,i-1] is not the greatest in that column:\n        + 2.1.1 swap the current row with the row having the largest value.\n    + 2.2 scale row i of matrix A by (1/A[i-1][i-1])\n    + 2.3 for j in range(i+1,len(A)+1):\n        + 2.3.1 let alpha = (-A[j-1][i-1]/A[i-1][i-1])\n        + 2.3.2 eliminate the row j by multiplying row i by alpha and adding to the current jth row.\n3. return A"}
︠205c1456-aaa4-4017-99f7-2e72ba14824as︠
# Problem No. 2
def swap(A, r1, r2):
    if r1 < 1 or r2 > len(A):
        raise ValueError("r1 and r2 must be within the range of the rows in given matrix")
    else:
        A[r1-1], A[r2-1] = A[r2-1], A[r1-1]
︡ea7053bb-5a5e-452e-9808-a1a2717f6f98︡{"done":true}
︠5a11c98b-5f99-45be-be42-fdc70c8fb3f8s︠
# Problem No. 3
def scale(A,alpha,r1):
    return A[:r1-1] + [[alpha * i for i in A[r1-1]]] + A[r1:]
︡3b91d3b7-f6d1-4721-b200-04cd61bdc0a6︡{"done":true}
︠20981022-ee91-4cbf-8f66-1be5c9c6f03fs︠
# Problem No. 4
def eliminate(A,alpha,r1,r2):
    new_list = scale(A,alpha,r1)
    A[r2-1] = [i+j for i, j in zip(new_list[r1-1],A[r2-1])]
    return A
︡8ffb3322-4403-40e5-b0cb-f6f88777f527︡{"done":true}
︠b885cd27-3917-4302-a382-3018dff82726s︠
def greatest_value_row(i,A):
    element_list = [abs(row[i-1]) for row in A]
    return element_list.index(max(element_list))+1

def gaussian_elimination_row_echelon(A):
    for i in range(1,len(A)+1):
        if i != len(A) and abs(A[i-1][i-1]) != abs(A[greatest_value_row(i,A)-1][i-1]):
            swap(A,i,greatest_value_row(i,A))
        A = scale(A,(1/(A[i-1][i-1])),i)
        for j in range(i+1,len(A)+1):
            alpha = float(-(A[j-1][i-1]/A[i-1][i-1]))
            eliminate(A,alpha,i,j)
    return A
︡ae4ff173-1930-4bf2-b341-e24914be6018︡{"done":true}
︠8d2511a2-636d-4de3-962c-1574cd2db5das︠
A = [[0,2,1],[1,-2,-3],[-1,1,2]]
print gaussian_elimination_row_echelon(A)
︡048425c2-7bd4-4c07-a716-07c61ac7c354︡{"stdout":"[[1, -2, -3], [0.0, 1.0, 0.5], [-0.0, -0.0, 1.0]]\n"}︡{"done":true}
︠a585e68f-e190-4134-9caf-f9d98c02c53c︠









