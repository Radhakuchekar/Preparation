# 2D array
# extracting columns 
for col in zip(*grid)

# extracting 2 values from each row
#grid[i][:2]----> this does not work it returns entire row
# instead use [row[:2] for row in grid]

# dictionary with list as values
vals = dict()
key = 'something' #key cannot be list only hashable data types can be used as key
new_val = 'something'
if key in vals.keys():
    vals[key].append(new_val)
else:
    vals[key]  = [new_val] 

# String manipulation
s ="abc"
s[i] = s #not allowed 

# Type Hints in python
from typing import List, Tuple, Dict, Set

numbers: List[int] = [1, 2, 3]
data: Tuple[int, str] = (10, "Hello")
score: Dict[str, int] = {"Alice": 90, "Bob": 85}
unique_values: Set[str] = {"apple", "banana"}
def foo(value: int | str) -> None: # either int or str 
    print(value)

from typing import TypeAlias
Vector: TypeAlias = list[float]
def scale_vector(v: Vector, factor: float) -> Vector:
    return [x * factor for x in v]

from typing import Callable
def execute_operation(x: int, y: int, operation: Callable[[int, int], int]) -> int: #Callable[[int, int], int] means a function that takes two int arguments and returns an int
    return operation(x, y)
print(execute_operation(5, 3, lambda a, b: a + b))  # Output: 8

from typing import List

def cut_rod(lengths: List[int], prices: List[int], arr_length: int, n: int) -> bool:
    print()