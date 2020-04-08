︠9f7cef80-30e0-4c9d-8dba-a60b5f05d057︠
%md
# Project 2

## Jony Karki
︡e941b235-e646-47a3-9408-c0b044fd8cb8︡{"done":true,"md":"# Project 2\n\n## Jony Karki"}
︠05b33012-550c-43e7-95b3-d7710973042d︠
%md
### Problem 1

Indexing begins from one because of how the early programming languages worked. In the old programming languages like C, pointers(memory address) were used to access the elements of an array. i.e. array[n] would indicate the pointer to move n steps from current position in the memory to find the nth item in the list. Hence, indicating the first element as being 0th element meant that the pointer had to move 0 steps in the memory to find the first item in the list. This is why indexing begins with 0.
︡87a51cac-256d-40e7-9710-fe3b3e0b147b︡{"done":true,"md":"### Problem 1\n\nIndexing begins from one because of how the early programming languages worked. In the old programming languages like C, pointers(memory address) were used to access the elements of an array. i.e. array[n] would indicate the pointer to move n steps from current position in the memory to find the nth item in the list. Hence, indicating the first element as being 0th element meant that the pointer had to move 0 steps in the memory to find the first item in the list. This is why indexing begins with 0."}
︠2256a198-11d4-432c-b64e-66e0a89bcdea︠
%md
### Problem 2

1. List comprehension is shorter and concise than for loop and does the same thing. List comprehensions are also faster than the traditional for loops.
2. For loop can be used in situations where there are multiple things to do in a single iteration. For loop can make it easier for us to read code.
︡0c64dddc-aa68-4e3a-9506-3a9d969bc0c2︡{"done":true,"md":"### Problem 2\n\n1. List comprehension is shorter and concise than for loop and does the same thing. List comprehensions are also faster than the traditional for loops.\n2. For loop can be used in situations where there are multiple things to do in a single iteration. For loop can make it easier for us to read code."}
︠6ed77e0c-ddff-4756-af82-c362029b1a24s︠
foo = 2
bar = 1 if foo < 0 else -1
print bar

%md
---
### Problem 3

The given code assigns 1 to be the value of the bar variable if the value of foo variable is less than 0 and assigns -1 otherwise.
︡56d902ca-64ac-4872-aea9-555a776debbd︡{"stdout":"-1\n"}︡{"md":"---\n### Problem 3\n\nThe given code assigns 1 to be the value of the bar variable if the value of foo variable is less than 0 and assigns -1 otherwise."}︡{"done":true}
︠7b1b43ba-361a-499e-ab41-ab22cdbb350bs︠
#Problem 4

f = [0,1]
while len(f) != 50:
    f.append(sum(f[-2:]))
print f

%md
---
The above sequence is also known as fibonacci sequence. This sequence is common in mathematics as well as in nature in arrangement of petals of flower, branching in trees etc.
︡7bd599e3-45a1-491d-8e9b-a662fda4e56b︡{"stdout":"[0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040, 1346269, 2178309, 3524578, 5702887, 9227465, 14930352, 24157817, 39088169, 63245986, 102334155, 165580141, 267914296, 433494437, 701408733, 1134903170, 1836311903, 2971215073, 4807526976, 7778742049]\n"}︡{"md":"---\nThe above sequence is also known as fibonacci sequence. This sequence is common in mathematics as well as in nature in arrangement of petals of flower, branching in trees etc."}︡{"done":true}
︠32523058-303a-4b87-8c40-8586c4df973e︠

#Problem 5
start_x = 5
current_x = start_x
collatz = [start_x]
while len(collatz) != 1000 and current_x > 1:
    next_num = (current_x / 2) if current_x % 2 == 0 else (current_x * 3 + 1)
    collatz.append(next_num)
    current_x = next_num
print collatz
︡3b716bda-bf64-4fe4-aa85-deabb3dcf036︡{"stdout":"[5, 16, 8, 4, 2, 1]\n"}︡{"done":true}
︠a3ea9409-75e9-4faa-a4d1-026dfc59e865s︠
#Problem 6
start_x = 3
if type(start_x) == sage.rings.integer.Integer:
    if start_x < 0:
        raise ValueError
else:
    raise TypeError

current_x = start_x
collatz = [start_x]
while len(collatz) != 1000 and current_x > 1:
    next_num = (current_x / 2) if current_x % 2 == 0 else (current_x * 3 + 1)
    collatz.append(next_num)
    current_x = next_num
print collatz
︡9b7b7e33-185c-4f76-8fbd-cf6c6d45aa09︡{"stdout":"[3, 10, 5, 16, 8, 4, 2, 1]\n"}︡{"done":true}
︠2762b725-5817-4e06-9b9e-fdf92b86bb44︠










