︠72da6809-4081-4148-a103-eab075fa9bc4︠
%md
# Project 8

## Jony Karki
︡6e0ecbf0-8a6d-405b-8da4-872ce19f6b21︡{"done":true,"md":"# Project 8\n\n## Jony Karki"}
︠ce3aa829-b501-429f-b9ad-8de30069b502s︠
def grow_to_basis(v_list):
    """This routine automatically creates a largest independent set of vectors
    from the list of vectors in R^m passed as input.
    """
    m = len(v_list[0])
    n = len(v_list)
    U = matrix(v_list).transpose().augment(identity_matrix(m))
    return map(lambda i: U.transpose()[i], U.pivots())
    # return map(lambda i: U[i], U.pivots())

# The following functions do some common vector arithmetic on lists.
def scale(scalar, right): return [scalar*entry for entry in right]
def add(left, right)    : return [a+b for a,b in zip(left,right)]
def dot(left, right)    : return sum([a*b for a,b in zip(left,right)])
def norm(left)          : return sqrt(dot(left,left))

def qr_fact(vector_list):
    """
    1. Extend a list of n vectors of length m to a list of m linearly
    independent vectors.
    2. From that list, construct the matrix A whose columns are the vectors.
    3. Compute the QR factorization of that matrix, and return the matrices
    A, Q, and R.
    """
    A = column_matrix(grow_to_basis(vector_list))
    m = A.dimensions()[0]
    n = A.dimensions()[1]
    # These two entries better change, otherwise everything about the code
    # is wrong.
    # Below the next line and above the final line, write the code to do the
    # Modified Gram-Schmidt process.
    #############################################
    # matrix([[1,2],[3,4]])
    # column_matrix([1,3],[2,4])
    Q = [[0 for j in range(m)] for i in range(m)]
    R = Q[:]
    vector_list_copy = column_matrix(A).rows()
    norm_vectors = []
    for i in range(m):
        if i == 0:
            length = sqrt(sum([a^2 for a in vector_list[i]]))
            q_column = [(1/length)*b for b in vector_list[i]]
            vector_list_copy[0] = q_column
            norm_vectors.append(q_column)
        else:
            new_column = []
            for j in range(i):
                dot_product = dot(norm_vectors[j],vector_list_copy[i])
                subtract = [dot_product*k for k in norm_vectors[j]]
                new_column = [k-l for k,l in zip(vector_list_copy[i],subtract)]
                vector_list_copy[i] = new_column
            length = sqrt(sum([a^2 for a in new_column]))
            new_norm_vector = [(1/length)*b for b in new_column]
            norm_vectors.append(new_norm_vector)
    #Q
    Q = matrix(norm_vectors)
    # R:
    for i in range(m):
        for j in range(n):
            R[i][j] = sum([k*l for k, l in zip(column_matrix(A).rows()[j],norm_vectors[i])])
    #############################################
    # Jorgen Gram was actually killed by being struck by a bicycle at the
    # age of 65. Strange but true.
    return A, column_matrix(Q), matrix(R)
︡4261d585-7dcc-4d5c-b49d-0d0dd55f34e4︡{"done":true}
︠758ec7ac-f0ed-42cc-b1d2-067012acf9efs︠
#TEST
for i in qr_fact([[1,1,-2,0],[0,2,2,0],[-1,-2,1,1]]):
    print i
    print "\n"
︡bb0310dd-b150-4b1e-80a9-5a0b52ab4d0e︡{"stdout":"[ 1  0 -1  1]\n[ 1  2 -2  0]\n[-2  2  1  0]\n[ 0  0  1  0]\n\n\n[    1/6*sqrt(6) 1/22*sqrt(22/3)               0    3*sqrt(1/11)]\n[    1/6*sqrt(6) 7/22*sqrt(22/3)               0     -sqrt(1/11)]\n[   -1/3*sqrt(6) 2/11*sqrt(22/3)               0      sqrt(1/11)]\n[              0               0               1               0]\n\n\n[        sqrt(6)    -1/3*sqrt(6)    -5/6*sqrt(6)     1/6*sqrt(6)]\n[              0      sqrt(22/3) -1/2*sqrt(22/3) 1/22*sqrt(22/3)]\n[              0               0               1               0]\n[              0               0               0    3*sqrt(1/11)]\n\n\n"}︡{"done":true}
︠278cdfa5-d4b5-4edb-818e-bd31c8898a37︠
︠783a8fa5-2e13-4398-ab9e-e6afb46d6ad3︠









