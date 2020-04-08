class aam_matrix:
    """A matrix class.
    """
    def __init__(self, grid):
        """Instantiate an aam_matrix from a list of lists of numbers."""
        input_error = "aam_matrix(grid) expects grid to be a rectangular array " +\
                      "(list of lists) of numbers."
        try:
            # If grid[0][0] cannot be accessed, grid is not a container of containers.
            grid[0][0]
        except:
            raise ValueError(input_error)
        self.col_dim = len(grid[0])
        for row in grid:
            # If some row has length different from the col_dim, the grid is not rectangular
            if len(row)!=self.col_dim:
                raise ValueError(input_error)
            try:
                # Adding an integer to a non-numeric quantity will raise an exception.
                [x+1 for x in row]
            except:
                raise ValueError(input_error)
        self.row_dim = len(grid)
        self.data = tuple(tuple(row) for row in grid)

    def dims(self):
        """A.dims() returns the row and column dimension of A as a tuple."""
        return (self.row_dim, self.col_dim)

    def __repr__(self):
        """Human readable matrices."""
        sl = lambda thing: len(str(thing))
        cell_widths = [max([sl(row[j]) for row in self.data]) for j in range(self.col_dim)]
        pad = lambda thing, j: (cell_widths[j]-sl(thing))*' '+str(thing)
        out_str = ""
        for row in self.data:
            out_str += "[" + " ".join([pad(entry,col) for col,entry in enumerate(row)]) + "]\n"
        out_str = out_str[:-1]
        return out_str

    def __getitem__(self,(i,j)):
        """A[i,j] returns the element of A in the ith row, jth column, indexed from 1."""
        if all([type(i)==type(1), 
                type(j)==type(1), 
                1 <= i <= self.row_dim, 
                1 <= j <= self.col_dim
               ]):
            return self.data[i-1][j-1]
        else:
            raise IndexError('index out of bounds or of non-integer type.')

    def __add__(self, right):
        """self + right requires that right be an aam_matrix of the correct dimensions."""
        if isinstance(right,aam_matrix):
            # Do the work here!
            pass
        else:
            raise TypeError('May not add "{}" to aam_matrix'.format(parent(right)))

    def __radd__(self, left):
        """left + self requires that left be an aam_matrix of the correct dimensions."""
        return self + left

    def __mul__(self, right):
        '''self * right requires that right be numeric or that right be an aam_matrix of correct dimensions.'''
        try:
            right + 1 # This will raise a type error if right is an aam_matrix!
            return aam_matrix([[right*num for num in row] for row in self.data])
        except TypeError:
            # Fill in the matrix multiplication code here.
            pass

    def __rmul__(self, left):
        '''left * self will only trigger if left is not aam_matrix, in which case scalar multiplication of matrices is commutative.'''
        return self*left

print('aam_matrix class loaded. Type help(aam_matrix) for methods and attributes.')