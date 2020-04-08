︠506b2174-034a-452b-9a25-5468a287daa8︠
%md
# Project 4:  Functional programming 2

## Jony Karki
︡176c86cc-6a04-4feb-bc2d-2004dc670761︡{"done":true,"md":"# Project 4:  Functional programming 2\n\n## Jony Karki"}
︠4f075119-0e41-48c7-9919-0ad149837d0c︠
%md
## Problem #1
1. __Algorithm for differential of formal polynomials.__\
    a. Find the degree of the polynomial object passed.\
    b. If the degree is not greater than 1 then return Zpoly([0]).\
    c. If the degree is greater than 1 then:\
        i. Go through the list of coefficients of the polynomial skipping the first element (constant).\
        ii. Multiply the current position of the loop i with the coefficient at that position and add that to a new list A\
        iii. Return Zpoly(A)\

2. __Algorithm for antiderivative of formal polynomials:__\
    a. First change the initialization function of the Zpoly Class to accept the coefficient list of Rational Numbers.\
    b. create an empty list A = [0] to which will represent the constant of the antiderivative.\
    c. Go through all the elements in the list and do the following:\
    i. Multiply the coefficient at each position i in the list with (1/i+1) and append this element to the list B.\
    ii. Return Zpoly(B)

︡e84800c1-271a-49d1-9a64-6493a02fcb79︡{"done":true,"md":"## Problem #1\n1. __Algorithm for differential of formal polynomials.__\\\n    a. Find the degree of the polynomial object passed.\\\n    b. If the degree is not greater than 1 then return Zpoly([0]).\\\n    c. If the degree is greater than 1 then:\\\n        i. Go through the list of coefficients of the polynomial skipping the first element (constant).\\\n        ii. Multiply the current position of the loop i with the coefficient at that position and add that to a new list A\\\n        iii. Return Zpoly(A)\\\n\n2. __Algorithm for antiderivative of formal polynomials.__\\\n    a. First change the initialization function of the Zpoly Class to accept the coefficient list of Rational Numbers.\\\n    b. create an empty list A = [0] to which will represent the constant of the antiderivative.\\\n    c. Go through all the elements in the list and do the following:\\\n    i. Multiply the coefficient at each position i in the list with (1/i+1) and append this element to the list B.\\\n    ii. Return Zpoly(B)"}
︠7a2af8b1-2fc4-4cb6-8f1d-ade2b95aaa7a︠
%md
## Problem #2
1. A zero matrix would not represent a system of linear equations because all the elements in the matrix are 0.
2. Yes, the matrix operations should respect their regular complex counterparts. If $A=[a]$ and $B=[b]$ where $a,b\in\mathbb{C}$, we should expect $A@B = [a@b]$ whenever $@$ is a well-defined operator on the complex numbers. The addition of two matrices with complex numbers $[a+bi]$ and $[c+di]$ is $[a+c+(b+d)i]$. The subtraction of two matrices is: $[a + bi] - [c + di] = [(a - c) + (b - d)i]$. The multiplication of two matrices is $[a+bi] * [c+di] = [(ac-bd) - (ad+bc)i]$. The division of two matrices: $[a+bi]$ and $[c+di]$ is: $[(ac+bd)/(c^2+d^2) + (bc-ad)i/(c^2+d^2)]$. These all follow the rules of operations that applies for any two complex numbers and all result in a 1 * 1 sized matrix. Therefore, the matrix operations should respect their regular complex counterparts.
︡c4b85266-2a84-453a-b20b-44f2c25b610b︡{"done":true,"md":"## Problem #2\n1. A zero matrix would not represent a system of linear equations because all the elements in the matrix are 0.\n2. Yes, the matrix operations should respect their regular complex counterparts. If $A=[a]$ and $B=[b]$ where $a,b\\in\\mathbb{C}$, we should expect $A@B = [a@b]$ whenever $@$ is a well-defined operator on the complex numbers. The addition of two matrices with complex numbers $[a+bi]$ and $[c+di]$ is $[a+c+(b+d)i]$. The subtraction of two matrices is: $[a + bi] - [c + di] = [(a - c) + (b - d)i]$. The multiplication of two matrices is $[a+bi] * [c+di] = [(ac-bd) - (ad+bc)i]$. The division of two matrices: $[a+bi]$ and $[c+di]$ is: $[(ac+bd)/(c^2+d^2) + (bc-ad)i/(c^2+d^2)]$. These all follow the rules of operations that applies for any two complex numbers and all result in a 1 * 1 sized matrix. Therefore, the matrix operations should respect their regular complex counterparts."}
︠260eaca8-e633-4fe0-9a72-e74ba0f219e3s︠
class Zpoly():
    """A class of formal polynomials with integer coefficients.

    Zpoly(a_list) expects a_list to be a list or tuple of integers."""
    def __init__(self, coeff_list):
        """Zpoly(a_list) expects a_list to be a list or tuple of integers.
        """
        # Section i1
        if all([isinstance(c,(Integer,int,Rational)) for c in coeff_list]):
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

    def diff(self):
        """Returns the differentiation of a formal polynomial"""
        return Zpoly([i * self.coeff(i) for i in range(1,self.degree()+1)]) if self.degree() > 1 else Zpoly([0])

    def anti(self):
        """Returns the antiderivative of a formal polynomial"""
        return repr(Zpoly([0] + [self.coeff(i)*(1/(i+1)) for i in range(0,self.degree()+1)])) + " + C"
︡31cc8c0c-eb6a-497f-b7b8-5f4c1e50d9e4︡{"done":true}
︠7cf37cfa-e8d8-41ed-b866-e1292d2acc8bs︠
#TEST
p = Zpoly([1,3,4,5])
print p
# You've got a bug!!! Squash it!
p.diff()
p.anti()
p.diff().anti()
︡ab5542f3-22f6-44b5-ba3b-7f9b5ba5c7a0︡{"stdout":"1 + 3*x + 4*x^2 + 5*x^3\n"}︡{"stdout":"3 + 8*x + 15*x^2\n"}︡{"stdout":"'x + 3/2*x^2 + 4/3*x^3 + 5/4*x^4 + C'\n"}︡{"stdout":"'3*x + 4*x^2 + 5*x^3 + C'\n"}︡{"done":true}
︠4db42cab-43d4-4254-91c7-7a309c961310︠









