1.Implement a function apply_operation(numbers, operation) that receives a list of numbers and a lambda expression operation and returns a new list with the operation applied to each element

def apply_operation(numbers, operation):
    return list(map(operation,numbers))
numbers=[1,2,3,4]
operation = lambda z:z*2
print(apply_operation(numbers,operation))

2.Write a function filter_items(items, predicate) that takes a list and a lambda predicate, returning only the elements for which the predicate evaluates to True

def filter_items(items, predicate):
    return list(filter(predicate,items))
items=['milk','tea powder','coffee','sugar']
predicate=lambda x: len(x)>4
print(filter_items(items,predicate))

3.Create a higher‑order function compose(f, g) that returns a new function representing the composition f(g(x)). Demonstrate its use with two lambda expressions

def compose(f, g):
    return lambda x: f(g(x))

f=lambda x: x**2
g=lambda x: x+5

square_five=compose(f,g)
print(square_five(3))

5.Provide a function sort_by_key(objects, key_func) that sorts a list of dictionaries (or objects) based on a lambda key extractor key_func

def sort_by_key(objects, key_func):
    return sorted(objects,key=key_func)

objects=[{'name': 'hema', 'marks': 98},
         {'name': 'latha', 'marks': 65},
         {'name': 'priya', 'marks': 53}]
key_func=lambda x: x['marks']
print(sort_by_key(objects,key_func))

6.Design a one‑liner using map and a lambda to convert a list of strings representing integers (e.g., ["1", "2"]) into a list of their squares as integers.

nums=['1','2','3','4']
squares=list(map(lambda x:x**2,map(lambda x:int(x),nums)))
print(squares)


from functools import reduce

def cumulative_product(numbers):
    return reduce(lambda x,y:x*y,numbers)
numbers=[1,2,3,4]
print(cumulative_product(numbers))