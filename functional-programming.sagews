︠43d7b1cc-7849-43e2-80fb-64424def6cbf︠
%md
# Project 3:  Functional programming

## Jony Karki
︡a9a7d982-f3fa-4b1d-93f6-37c2de164665︡{"done":true,"md":"# Project 3:  Functional programming\n\n## Jony Karki"}
︠ffef172c-2e90-4b32-8e24-9dd2e9c1f43e︠
%md
### Problem #1. Explain the initialization code

1. Section i1 is in the function that instansiates the class with a list of integers that are supposed to be the coefficients of the polynomial function. Hence, the purpose of the condition is to check if what is passed to the function is a list of integers (both positive or negative) and not any other data type. This conditional expression also makes sure to stop the program with a error message when the condition is False.

2. Here, we are removing any coefficients at the end of the list that are equal to 0 because the term at that index won't exist because it's equal to zero. So, below we are checking if the last element of the element is equal to zero when the length of the list greater than 1. If it is 0, then we remove the element from the list using the inbuilt pop function in python that removes the last element from the list.

3. The code below declares the class attribute _degree, which is the highest degree of the polynomial, to be the length of the c_list that we just removed the extra 0's from. The length of the list of coefficients gives the highest power of the polynomial with a non-zero coefficient. If the list of polynomial passed i.e. c_list contains just one value which is zero, then degree is initialized to be -1. We also initialize another attribute called _coeffs which is the tuple of the same c_list.
︡c7357c75-4fec-418e-8e18-42a130abe89a︡{"done":true,"md":"### Problem #1. Explain the initialization code\n\n1. Section i1 is in the function that instansiates the class with a list of integers that are supposed to be the coefficients of the polynomial function. Hence, the purpose of the condition is to check if what is passed to the function is a list of integers (both positive or negative) and not any other data type. This conditional expression also makes sure to stop the program with a error message when the condition is False.\n\n2. Here, we are removing any coefficients at the end of the list that are equal to 0 because the term at that index won't exist because it's equal to zero. So, below we are checking if the last element of the element is equal to zero when the length of the list greater than 1. If it is 0, then we remove the element from the list using the inbuilt pop function in python that removes the last element from the list.\n\n3. The code below declares the class attribute _degree, which is the highest degree of the polynomial, to be the length of the c_list that we just removed the extra 0's from. The length of the list of coefficients gives the highest power of the polynomial with a non-zero coefficient. If the list of polynomial passed i.e. c_list contains just one value which is zero, then degree is initialized to be -1. We also initialize another attribute called _coeffs which is the tuple of the same c_list."}
︠0d10c74e-17bd-4011-8112-977345d7aef9︠
%md
### Problem #2. Explain the representation code.

1. This section goes through all the coefficients of the list and does one of three things. First, if the coefficient is equal to zero, it does nothing. Second, if the coefficient is less than zero, i.e. negative, then it adds list of " - ", "(absoulute value of coefficient)" and "*x^(current loop position)" to the scv_list. And lastly if the coefficient is positive then it just adds list of " + ", "(absolute value of coefficient)" and "*x^(current loop position)" to the scv_list.

2. This section checks if the current value of v is "*x^0" in which case this term of the polynomial would be zero. Hence, in this case, instead of writing "*x^0", v is just replaced by the empty string.

3. This section is for the case when v is not "*x^0" and the value of the coefficient (c) is 1. In this case, instead of v being "1*x^0", it is "x^0"
︡554dc66c-3e66-489a-b3d2-e20725c7e2ff︡{"done":true,"md":"### Problem #2. Explain the representation code.\n\n1. This section goes through all the coefficients of the list and does one of three things. First, if the coefficient is equal to zero, it does nothing. Second, if the coefficient is less than zero, i.e. negative, then it adds list of \" - \", \"(absoulute value of coefficient)\" and \"*x^(current loop position)\" to the scv_list. And lastly if the coefficient is positive then it just adds list of \" + \", \"(absolute value of coefficient)\" and \"*x^(current loop position)\" to the scv_list.\n\n2. This section checks if the current value of v is \"*x^0\" in which case this term of the polynomial would be zero. Hence, in this case, instead of writing \"*x^0\", v is just replaced by the empty string.\n\n3. This section is for the case when v is not \"*x^0\" and the value of the coefficient (c) is 1. In this case, instead of v being \"1*x^0\", it is \"x^0\""}
︠4d14d24b-6452-4beb-b418-ba4d374388fc︠
%md
### Problem #3

1. Any other polynomial or integers can be added to a given polynomial.

2. `Zpoly.__add__()` method should raise a TypeError with a message if the input to the function is of wrong type. The input must be either another instance of Zpoly function or an integer.

3. The algorithm for addition is:\
    a. Find the larger of the two coefficients' list of the objects we are trying to add.\
    b. loop over all the coefficients of the larger list and while doing so add each current coefficient in loop to the coefficient that is in the same position in the other list.\
    c. Finally, create a new Zpoly object with the list created in step b.

4. Yes, the addition of two polynomials is commutative because p + q is equal to q + p.

5. The right addition i.e. the __radd__() function does the same thing as the left addition function because addition of polynomials is commutative. so the algorithm for the right addition is the same as the left addition.
︡10d2b65a-e7fa-4d35-8315-0a419cbbd63c︡{"done":true,"md":"### Problem #3\n\n1. Any other polynomial or integers can be added to a given polynomial.\n\n2. `Zpoly.__add__()` method should raise a TypeError with a message if the input to the function is of wrong type. The input must be either another instance of Zpoly function or an integer.\n\n3. The algorithm for addition is:\\\n    a. Find the larger of the two coefficients' list of the objects we are trying to add.\\\n    b. loop over all the coefficients of the larger list and while doing so add each current coefficient in loop to the coefficient that is in the same position in the other list.\\\n    c. Finally, create a new Zpoly object with the list created in step b.\n\n4. Yes, the addition of two polynomials is commutative because p + q is equal to q + p.\n\n5. The right addition i.e. the __radd__() function does the same thing as the left addition function because addition of polynomials is commutative. so the algorithm for the right addition is the same as the left addition."}
︠4252e432-d993-4fbb-a4f5-a223f8a89a3a︠
%md
### Problem #4

1. Any other polynomial can be multiplied to a given polynomial to form a new polynomial.

2. `Zpoly.__mul__()` method should raise a TypeError with a message if the input to the function is of wrong type. The input needs to be another instance of the Zpoly function.

3. The algorithm for left multiplication is:\
    a. get the two coefficient lists from the objects and store them in variables.\
    b. create a new list variable with 0's and is of size that is equal to the sum of the length two lists of coefficients minus one. This is the output list variable.
    c. enumerate through all the elements on the first list.\
    d. inside the loop in step c. we enumerate through the elements in the second list. and on each iteration we reassign the (current postion in step c. + current position in step d)th position of the output list variable to its previous value plus the product of the current element in step c. with the current element in step d.
    e. We can create a new Zpoly variable by passing the output list variable as the coefficient list.

4. Yes, the multiplication of two polynomials is commutative because p * q is equal to q * p.

5. The algorithm for right multiplication is the same as the left multiplication because multiplication of the polynomials is commutative i.e. p * q = q * p.

6. The algorithm for subtraction is:\
    a. Find the larger of the two coefficients' list of the objects we are trying to subtract.\
    b. loop over all the coefficients of the larger list and while doing so subtract each current coefficient in loop to the coefficient that is in the same position in the other list.\
    c. Finally, create a new Zpoly object with the list created in step b.
︡3e8c66ec-d784-48bd-a0ab-cee22f809a0b︡{"done":true,"md":"### Problem #4\n\n1. Any other polynomial can be multiplied to a given polynomial to form a new polynomial.\n\n2. `Zpoly.__mul__()` method should raise a TypeError with a message if the input to the function is of wrong type. The input needs to be another instance of the Zpoly function.\n\n3. The algorithm for left multiplication is:\\\n    a. get the two coefficient lists from the objects and store them in variables.\\\n    b. create a new list variable with 0's and is of size that is equal to the sum of the length two lists of coefficients minus one. This is the output list variable.\n    c. enumerate through all the elements on the first list.\\\n    d. inside the loop in step c. we enumerate through the elements in the second list. and on each iteration we reassign the (current postion in step c. + current position in step d)th position of the output list variable to its previous value plus the product of the current element in step c. with the current element in step d.\n    e. We can create a new Zpoly variable by passing the output list variable as the coefficient list.\n\n4. Yes, the multiplication of two polynomials is commutative because p * q is equal to q * p.\n\n5. The algorithm for right multiplication is the same as the left multiplication because multiplication of the polynomials is commutative i.e. p * q = q * p.\n\n6. The algorithm for subtraction is:\\\n    a. Find the larger of the two coefficients' list of the objects we are trying to subtract.\\\n    b. loop over all the coefficients of the larger list and while doing so subtract each current coefficient in loop to the coefficient that is in the same position in the other list.\\\n    c. Finally, create a new Zpoly object with the list created in step b."}
︠990e4e32-001a-4072-9f18-952bd5f85cf7︠
class Zpoly():
    """A class of formal polynomials with integer coefficients. 
    
    Zpoly(a_list) expects a_list to be a list or tuple of integers."""
    def __init__(self, coeff_list):
        """Zpoly(a_list) expects a_list to be a list or tuple of integers.
        """
        # Section i1
        if all([isinstance(c,(Integer,int)) for c in coeff_list]):
            c_list = coeff_list[:]
            # Section i2
            while c_list[-1] == 0 and len(c_list) > 1:
                c_list.pop()
            # Section i3
            self._degree = len(c_list)-1 if c_list != [0] else -1
            self._coeffs = tuple(c_list)
        else:
            raise TypeError('Coeff list is not an integer sequence.')

    def __repr__(self):
        """Return a string representation of this formal polynomial."""
        out = ""
        scv_list = []
        # Section r1
        for i,co in enumerate(self._coeffs):
            if co == 0:
                continue
            if co < 0:
                scv_list.append( [" - ", str(abs(co)), "*x^{}".format(i)] )
            else:
                scv_list.append( [" + ", str(abs(co)), "*x^{}".format(i)] )
        # end Section r1
        for i,(s,c,v) in enumerate(scv_list):
            if i == 0:
                s = '-' if s==' - ' else ''
            if v == "*x^1":
                v = "*x"
            # Section r2
            if v=="*x^0":
                v = ''
            # Section r3
            elif v!='*x^0' and c=='1':
                c = ''
                v = v[1:]# if v!="*x^1" else "*x"
            # end Section r3
            out += s+c+v
        return (str(out) if out != "" else '0')
    #############
    def degree(self):
        """Return the maximum degree of a term of self. The zero polynomial returns degree -1."""
        return self._degree
    
    def coeff(self, k):
        """p.coeff(k) returns the coefficient of p of index k, or 0 if k > degree(p)."""
        if not isinstance(k, (Integer, int)) or k < 0:
            raise TypeError('Expects non-negative index.')
        elif k > self.degree():
            return 0
        else:
            return self._coeffs[k]
    #############
    def __mul__(self, other):
        if isinstance(other, Zpoly):
            output = [0]*(len(self._coeffs)+len(other._coeffs)-1)
            for i, j in enumerate(self._coeffs):
                for k, l in enumerate(other._coeffs):
                    output[i+k] += j * l
            return Zpoly(output)
        else:
            raise TypeError("Value to be multiplied must be a Zpoly object")
            
    ### PROBLEM NO. 5 ####
    
    def __add__(self, other):
        """Returns the addition of two polynomial functions"""
        # check if the other object is a valid object
        if isinstance(other, Zpoly):
            add_list = other._coeffs if len(other._coeffs) > len(self._coeffs) else self._coeffs 
            return Zpoly([self.coeff(i) + other.coeff(i) for i in range(len(add_list))])
        elif isinstance(other, (int, Integer)):
            new_constant = self._coeffs[0] + other
            new_list = [new_constant]
            for i in range(1,len(self._coeffs)):
                new_list.append(self._coeffs[i])
            return Zpoly(new_list)
        else:
            raise TypeError("The object to be added must be a Zpoly instance or an integer")

    __radd__ = __add__
    
    ###

︡c9c2b517-611b-40f4-aeae-75eac4636029︡{"done":true}
︠a2d4abb8-7ac7-4b7c-ab99-336e5659428e︠

︡74c8f05f-6708-4af9-ba83-8d89fe2a03b1︡{"stdout":"False\n"}︡{"stdout":"2 - 7*x - 8*x^2 + 7*x^3\n"}︡{"stdout":"2 - 7*x - 8*x^2 + 7*x^3\n"}︡{"done":true}
︠7dfbb72c-62bb-4629-a6ce-c5de2b0ee94f︠









