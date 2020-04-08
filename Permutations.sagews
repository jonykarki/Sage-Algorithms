︠fcff719f-64f4-4831-9785-e3f7efb92954︠
%md
**Problem 1:**

$g=(1,3,4,10)(2,8,5,9)$ is a disjoint cycle notation of one of a permutations of a set {1,2,3,4,5,6,7,8,9}. It just represents the mapping of the elements as a cycle. And, for each cycle it doesnot matter what element we start with since it represents the same thing. Usually, we start with the smallest element. Hence, even though 10 is the largest symbol in the cycle, g is a valid representation of permutation.

︡e65c919e-b22e-44e8-a7bc-79be77996bcf︡{"done":true,"md":"**Problem 1:**\n\n$g=(1,3,4,10)(2,8,5,9)$ is a disjoint cycle notation of one of a permutations of a set {1,2,3,4,5,6,7,8,9}. It just represents the mapping of the elements as a cycle. And, for each cycle it doesnot matter what element we start with since it represents the same thing. Usually, we start with the smallest element. Hence, even though 10 is the largest symbol in the cycle, g is a valid representation of permutation."}
︠3e3e1ec2-c0e9-4a8d-9e00-f88599771323︠
%md
**Problem 2:**

&sigma; represents one permutation in S. And | &sigma; | is the least positive integer k such that every element in the cycle comes back to itself, i.e. identity. Hence, the integer k is the LCM of the size of all the cycles of a permutation.
︡541dab9c-07ea-4c14-94ff-1559ec8d5114︡{"done":true,"md":"**Problem 2:**\n\n&sigma; represents one permutation in S. And | &sigma; | is the least positive integer k such that every element in the cycle comes back to itself, i.e. identity. Hence, the integer k is the LCM of the size of all the cycles of a permutation."}
︠43e1b55c-c425-4164-9c43-e139a2fb69c2s︠
conversion_rule = {'A' : 1, 'B' : 2, 'C' : 3, 'D' : 4, 'E' : 5, 'F' : 6, 'G' : 7, 'H' : 8, 'I' : 9, 'J' : 10, 'K' : 11, 'L' : 12, 'M' : 13, 'N' : 14, 'O' : 15, 'P' : 16, 'Q' : 17, 'R' : 18, 'S' : 19, 'T' : 20, 'U' : 21, 'V' : 22, 'W' : 23, 'X' : 24, 'Y' : 25, 'Z' : 26, 'a': 27, 'b' : 28, 'c' : 29, 'd' : 30, 'e' : 31, 'f' : 32, 'g' : 33, 'h' : 34, 'i' : 35, 'j' : 36, 'k' : 37, 'l' : 38, 'm' : 39, 'n' : 40, 'o' : 41, 'p' : 42, 'q' : 43, 'r' : 44, 's' : 45, 't' : 46, 'u' : 47, 'v' : 48, 'w' : 49, 'x' : 50, 'y' : 51, 'z' : 52, '0' : 53, '1' : 54, '2' : 55, '3' : 56, '4' : 57, '5' : 58, '6' : 59, '7' : 60, '8' : 61, '9' : 62}
︡e81764f3-1da4-4b33-9fc4-5e51987ca5e7︡{"done":true}
︠422160f4-ac98-459c-96ed-2802c8593231s︠
def alpha2int(in_string):
    if isinstance(in_string, str):
        integer_list = []
        for char in in_string:
            integer_list.append(conversion_rule[char])
        return integer_list
    else:
        raise ValueError("String datatype must be passed to the function.")
︡a80a5a61-fb57-4387-a396-137dc80cfe62︡{"done":true}
︠7c59de9b-82fd-4d4d-a760-003f4155ebc0s︠
def get_key(val):
    for key, value in conversion_rule.items():
        if val == value:
            return key

def int2alpha(in_lis):
    characters_list = []
    for integer in in_lis:
        characters_list.append(get_key(integer))
    return characters_list
︡81b3f6ed-ad6e-4aaa-ad00-a131eb42eff2︡{"done":true}
︠3e9730ca-608a-4fbc-b3c3-d9a5226369fc︠
%md
  ## Problem 3 : Question 3
  There are 62! or 31469973260387937525653122354950764088012280797258232192163168247821107200000000000000 permutations of the 62 symbols.
︡02683c21-d611-4fb6-b4a3-11f2d148a8e3︡{"done":true,"md":"  ## Problem 3 : Question 3\n  There are 62! or 31469973260387937525653122354950764088012280797258232192163168247821107200000000000000 permutations of the 62 symbols."}
︠c7fea05a-2554-47ea-b9dd-152d9d197949︠
def is_el_repeated(one_line):
    return len(one_line) == len(set(one_line))

def contains_all(one_line):
    ori_set = [i+1 for i in range(max(one_line))]
    sorted_one_line = sorted(one_line)
    return ori_set == sorted_one_line

def cycles(one_line):
    # check if one_line is valid
    if is_el_repeated(one_line) and contains_all(one_line):
        ori_set = [i+1 for i in range(max(one_line))]
        #identity permutation
        if ori_set == one_line:
            return [tuple([val]) for val in one_line]
        mappings = { a: b for a, b in zip(ori_set, one_line)}
        final_tuple_list = []
        for elem in ori_set:
            value = mappings.pop(elem, None)
            if value is None:
                continue
            cycle = [elem]
            while elem != value:
                cycle.append(value)
                value = mappings.pop(value, None)
            if len(cycle) != 1:
                final_tuple_list.append(tuple(cycle))
        return final_tuple_list
    else:
        raise ValueError("The elements must be non-repeated and should have all the elements from 1 to the max element")
︡5ec2864b-5c45-49fb-bb32-4c2ae73ed649︡{"done":true}
︠e904406d-886e-4b04-ad5a-f8e117bfa785s︠
#Test
cycles([3,5,2,4,1])
︡e07f67eb-84c1-4afa-b0b6-4a23cc43c351︡{"stdout":"{2: 5, 4: 4, 5: 1}\n{4: 4, 5: 1}\n{4: 4}\n[(1, 3, 2, 5)]\n"}︡{"done":true}
︠a1d5585a-4562-47da-8335-8da7b1f93610︠









