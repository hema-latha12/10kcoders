
# ============================================================
# PYTHON CORE TO OOP - SCENARIO BASED PRACTICE
# QUESTIONS 1 TO 40
# ============================================================


# -------------------- 1. VARIABLES, DATA TYPES & OPERATORS --------------------

# Q1. Shop Billing
price = 199.99
qty = 3
total = round(price * qty, 2)
print(f"Total: Rs. {total:.2f}")

# input() returns a string. Convert it using int() or float() before calculations.


# Q2. Convert Age
age = "25"
age = int(age)
print(age + 5)  # 30

# Without conversion, str + int raises TypeError.


# Q3. Assignment and References
a = 10
b = a
b += 5
print(a, b)  # 10 15

x = [1, 2]
y = x
y.append(3)
print(x, y)  # [1, 2, 3] [1, 2, 3]


# Q4. Divide Sweets
sweets = 47
kids = 5
each = sweets // kids
remaining = sweets % kids
print("Each child gets:", each)
print("Remaining sweets:", remaining)

# Alternative:
print(divmod(47, 5))


# Q5. Equality vs Identity
a = [1, 2]
b = [1, 2]
print(a == b)  # True
print(a is b)  # False


# -------------------- 2. STRINGS --------------------

# Q6. Clean Username
username = " RaviKumar_99 "
username = username.strip().lower()

if 5 <= len(username) <= 15:
    print("Valid username:", username)
else:
    print("Invalid username")


# Q7. Extract Email Username and Domain
email = "john.doe@example.com"
username, domain = email.split("@")
print("Username:", username)
print("Domain:", domain)


# Q8. Palindrome Ignoring Spaces and Case
text = "Never odd or even"
cleaned = text.replace(" ", "").lower()

if cleaned == cleaned[::-1]:
    print("Palindrome")
else:
    print("Not a palindrome")


# Q9. Count Vowels
review = "Python is an amazing programming language"
vowel_counts = {}

for char in review.lower():
    if char in "aeiou":
        vowel_counts[char] = vowel_counts.get(char, 0) + 1

for vowel in "aeiou":
    print(vowel, ":", vowel_counts.get(vowel, 0))


# Q10. Split Log Line
log = "2026-11-16 ERROR Disk full"
date, level, message = log.split(maxsplit=2)

print("Date:", date)
print("Level:", level)
print("Message:", message)


# -------------------- 3. LISTS & TUPLES --------------------

# Q11. Marks Analysis
marks = [56, 78, 91, 45, 67]

print("Highest:", max(marks))
print("Lowest:", min(marks))
print("Average:", sum(marks) / len(marks))
print("Descending:", sorted(marks, reverse=True))
print("Original:", marks)


# Q12. Remove Duplicates Preserving Order
numbers = [3, 1, 3, 2, 1, 4]
unique_numbers = list(dict.fromkeys(numbers))
print(unique_numbers)


# Q13. Copy a List
orig = [1, 2, 3]
copy = orig.copy()

copy.append(4)

print("Original:", orig)
print("Copy:", copy)


# Q14. Rotate List Right by 2
numbers = [1, 2, 3, 4, 5]
rotated = numbers[-2:] + numbers[:-2]
print(rotated)


# Q15. Tuple Immutability
loc = (17.38, 78.48)
print("Latitude:", loc[0])
print("Longitude:", loc[1])

# loc[0] = 18  # TypeError: tuples do not support item assignment.


# -------------------- 4. SETS & DICTIONARIES --------------------

# Q16. Student ID Set Operations
class_a = [101, 102, 103, 104]
class_b = [103, 104, 105, 106]

a = set(class_a)
b = set(class_b)

print("Both classes:", a & b)
print("Either class:", a | b)
print("Only first class:", a - b)


# Q17. Word Frequency
from collections import Counter
import re

paragraph = "Python is easy. Python is powerful and Python is popular."
words = re.findall(r"\b\w+\b", paragraph.lower())

frequency = Counter(words)
print("Word frequency:", frequency)
print("Top 3 words:", frequency.most_common(3))


# Q18. Inventory Dictionary
inventory = {"apple": 10, "banana": 0}

mango_stock = inventory.get("mango", 0)
print("Mango stock:", mango_stock)

inventory = {k: v for k, v in inventory.items() if v > 0}
print("Available stock:", inventory)


# Q19. Group Names by First Letter
names = ["Amit", "Anu", "Bala", "Charan", "Chitra"]
groups = {}

for name in names:
    groups.setdefault(name[0], []).append(name)

print(groups)


# Q20. Invert Dictionary
data = {"a": 1, "b": 2}
inverted = {value: key for key, value in data.items()}
print(inverted)

# Duplicate values overwrite earlier keys in the inverted dictionary.


# -------------------- 5. CONTROL FLOW & LOOPS --------------------

# Q21. Grade Calculator
def calculate_grade(mark):
    if mark >= 90:
        return "A"
    elif mark >= 75:
        return "B"
    elif mark >= 50:
        return "C"
    else:
        return "Fail"


for mark in [90, 89, 50, 49]:
    print(mark, ":", calculate_grade(mark))


# Q22. Prime Numbers Between 1 and 50
for number in range(2, 51):
    for divisor in range(2, int(number ** 0.5) + 1):
        if number % divisor == 0:
            break
    else:
        print(number, end=" ")

print()


# Q23. ATM PIN Attempts
correct_pin = "1234"
attempts = 0

while attempts < 3:
    entered_pin = input("Enter PIN: ")
    if entered_pin == correct_pin:
        print("Login successful")
        break
    else:
        attempts += 1
        print("Incorrect PIN")

else:
    print("Account locked")


# Q24. Star Triangle and Number Pyramid
height = 5

print("Star Triangle:")
for i in range(1, height + 1):
    print("*" * i)

print("\nNumber Pyramid:")
for i in range(1, height + 1):
    print(" " * (height - i) + " ".join(str(n) for n in range(1, i + 1)))


# Q25. break, continue and pass
numbers = [5, -2, 8, -1, 0, 10]

for number in numbers:
    if number == 0:
        break
    if number < 0:
        continue
    print(number)

# break: exits the loop.
# continue: skips the current iteration.
# pass: does nothing; used as a placeholder.


# -------------------- 6. FUNCTIONS --------------------

# Q26. Return Minimum and Maximum
def find_min_max(numbers):
    return min(numbers), max(numbers)


values = [10, 5, 30, 2, 20]
minimum, maximum = find_min_max(values)

print("Minimum:", minimum)
print("Maximum:", maximum)


# Q27. Mutable Default Argument Fix
def add(item, bucket=None):
    if bucket is None:
        bucket = []

    bucket.append(item)
    return bucket


print(add(1))
print(add(2))

# The original mutable default list would be shared across calls.


# Q28. *args and **kwargs
def average_marks(*marks):
    if not marks:
        return 0
    return sum(marks) / len(marks)


def show_settings(**settings):
    for key, value in settings.items():
        print(key, ":", value)


print("Average:", average_marks(80, 90, 70))
show_settings(theme="dark", size=12)


# Q29. Global Variable and Return Approach
counter = 0

def increment_global():
    global counter
    counter += 1


increment_global()
print("Global counter:", counter)


def increment(value):
    return value + 1


counter = increment(counter)
print("Returned counter:", counter)

# global modifies a module-level variable.
# Passing and returning a value is usually easier to test.


# Q30. Factorial and Fibonacci
from functools import lru_cache

def factorial(n):
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n <= 1:
        return 1
    return n * factorial(n - 1)


@lru_cache(maxsize=None)
def fibonacci(n):
    if n < 0:
        raise ValueError("Fibonacci index cannot be negative")
    if n <= 1:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)


print("Factorial:", factorial(5))
print("Fibonacci:", fibonacci(7))

# Memoization avoids recalculating previously computed Fibonacci values.


# Q31. Sort Employees by Salary
employees = [
    ("Asha", 52000),
    ("Ravi", 48000),
    ("Kiran", 61000)
]

sorted_employees = sorted(
    employees,
    key=lambda employee: employee[1],
    reverse=True
)

print(sorted_employees)


# -------------------- 7. COMPREHENSIONS, MAP/FILTER & ITERATORS --------------------

# Q32. Discounted Prices Above 200
prices = [120, 450, 80, 990, 300]

discounted_prices = [p * 0.9 for p in prices if p > 200]
print(discounted_prices)


# Q33. Flatten Nested List
matrix = [[1, 2], [3, 4], [5]]

flattened = [x for sublist in matrix for x in sublist]
print(flattened)


# Q34. Generator vs List Comprehension
# Example assumes numbers.txt contains one number per line.

def read_numbers(filename):
    with open(filename, "r") as file:
        for line in file:
            yield int(line.strip())


# Generator approach: reads and processes values lazily.
# Uncomment when numbers.txt exists:
# total = sum(read_numbers("numbers.txt"))
# print("Total:", total)

# List approach loads all values into memory:
# with open("numbers.txt", "r") as file:
#     numbers = [int(line.strip()) for line in file]
# print("Total:", sum(numbers))


# Q35. Generator for First n Even Numbers
def even_numbers(n):
    for i in range(n):
        yield i * 2


generator = even_numbers(5)

for number in generator:
    print(number)

# After exhaustion, next(generator) raises StopIteration.


# Q36. Numbered Student Report
names = ["A", "B", "C"]
scores = [90, 80, 70]

for index, (name, score) in enumerate(zip(names, scores), start=1):
    print(index, name, score)


# -------------------- 8. EXCEPTION HANDLING --------------------

# Q37. Calculator with Exception Handling
try:
    num1 = float(input("Enter first number: "))
    num2 = float(input("Enter second number: "))

    result = num1 / num2
    print("Result:", result)

except ValueError:
    print("Please enter valid numbers.")

except ZeroDivisionError:
    print("Cannot divide by zero.")

finally:
    print("Calculation finished")


# Q38. try-finally Execution Order
def f():
    try:
        return "try"
    finally:
        print("cleanup")


print(f())

# Output:
# cleanup
# try


# Q39. Custom Insufficient Funds Exception
class InsufficientFundsError(Exception):
    def __init__(self, shortfall):
        self.shortfall = shortfall
        super().__init__(f"Insufficient funds. Shortfall: Rs. {shortfall}")


def withdraw(balance, amount):
    if amount > balance:
        raise InsufficientFundsError(amount - balance)

    return balance - amount


try:
    balance = withdraw(1000, 1500)
    print("Remaining balance:", balance)

except InsufficientFundsError as error:
    print(error)
    print("Shortfall:", error.shortfall)


# Q40. try-else Example
try:
    number = int(input("Enter a number: "))

except ValueError:
    print("Invalid number")

else:
    print("You entered:", number)

# else runs only when no exception occurs.
# Avoid bare except because it can hide unexpected errors.



# ============================================================
# PYTHON CORE TO OOP - SCENARIO BASED PRACTICE
# QUESTIONS 41 TO 77
# ============================================================


# -------------------- 8. EXCEPTION HANDLING --------------------

# Q41. Re-raise Exception Preserving Original Traceback
import logging

logging.basicConfig(level=logging.ERROR)

try:
    result = 10 / 0

except Exception:
    logging.exception("An error occurred")
    raise  # Preserves the original traceback


# -------------------- 9. FILE HANDLING --------------------

# Q42. Read File and Print ERROR Lines
# Create a sample log file first.
with open("application.log", "w") as file:
    file.write("INFO Application started\n")
    file.write("ERROR Database connection failed\n")
    file.write("INFO User logged in\n")
    file.write("ERROR File not found\n")

with open("application.log", "r") as file:
    for line_number, line in enumerate(file, start=1):
        if "ERROR" in line:
            print(line_number, line.strip())

# with automatically closes the file after use.


# Q43. Append Student Record
with open("students.txt", "a") as file:
    file.write("101, Ravi, 85\n")

# "a" appends without deleting existing content.
# "w" overwrites the existing file.


# Q44. Find Most Expensive Product from CSV
import csv

# Sample products.csv:
# name,price
# Laptop,55000
# Mouse,500
# Keyboard,1500

with open("products.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["name", "price"])
    writer.writerow(["Laptop", 55000])
    writer.writerow(["Mouse", 500])
    writer.writerow(["Keyboard", 1500])

with open("products.csv", "r", newline="") as file:
    reader = csv.DictReader(file)
    products = list(reader)

if products:
    expensive_product = max(
        products,
        key=lambda product: float(product["price"])
    )

    with open("product_summary.txt", "w") as file:
        file.write(
            f"Most expensive product: {expensive_product['name']}\n"
        )
        file.write(
            f"Price: Rs. {float(expensive_product['price']):.2f}\n"
        )

    print(expensive_product)


# Q45. Store and Load Dictionary Using JSON
import json

student = {
    "name": "Ravi",
    "age": 21,
    "marks": 85
}

with open("student.json", "w") as file:
    json.dump(student, file, indent=4)

with open("student.json", "r") as file:
    loaded_student = json.load(file)

print(loaded_student)

# Another approach is pickle, but never load untrusted pickle files.


# Q46. Handle Missing File
filename = "unknown.txt"

try:
    with open(filename, "r") as file:
        print(file.read())

except FileNotFoundError:
    print("File does not exist:", filename)


# -------------------- 10. MODULES, PACKAGES & STANDARD LIBRARY --------------------

# Q47. Create utils.py and main.py
# Save the following first section in a file named utils.py:
#
# def greet(name):
#     return f"Hello, {name}!"
#
# Save the following section in main.py:
#
# from utils import greet
#
# if __name__ == "__main__":
#     print(greet("Ravi"))
#
# The __main__ guard runs code only when the file is executed directly.
# It does not run that guarded code when the file is imported.


# Q48. Generate OTP and Pick Winners
import random

otp = random.randint(100000, 999999)
print("OTP:", otp)

participants = [
    f"Participant {i}" for i in range(1, 21)
]

winners = random.sample(participants, 3)
print("Winners:", winners)

# random.sample selects without repetition.


# Q49. Date Difference and Today's Date
from datetime import date

date1 = date(2026, 11, 1)
date2 = date(2026, 11, 19)

difference = abs((date2 - date1).days)
print("Number of days:", difference)

today = date.today()
print("Today's date:", today.strftime("%d-%m-%Y"))


# Q50. Different Ways to Import Math
import math
from math import sqrt
import math as m

print(math.sqrt(25))
print(sqrt(36))
print(m.sqrt(49))

# import math keeps functions inside the math namespace.
# from math import sqrt imports sqrt directly.
# import math as m gives the module a shorter alias.
# Direct imports can conflict with names in your own code.


# Q51. Create Virtual Environment
# Run these commands in your terminal:
#
# Windows:
# python -m venv env
# env\Scripts\activate
# pip install pandas
#
# macOS/Linux:
# python3 -m venv env
# source env/bin/activate
# pip install pandas
#
# A virtual environment keeps project dependencies separate.


# -------------------- 11. OOP: CLASSES, OBJECTS & CONSTRUCTORS --------------------

# Q52. Student Class and Highest Marks
class Student:
    def __init__(self, name, roll_number, marks):
        self.name = name
        self.roll_number = roll_number
        self.marks = marks

    def get_grade(self):
        if self.marks >= 90:
            return "A"
        elif self.marks >= 75:
            return "B"
        elif self.marks >= 50:
            return "C"
        return "Fail"


students = [
    Student("Ravi", 101, 85),
    Student("Asha", 102, 95),
    Student("Kiran", 103, 78)
]

for student in students:
    print(student.name, student.marks, student.get_grade())

top_student = max(students, key=lambda s: s.marks)
print("Highest scorer:", top_student.name, top_student.marks)


# Q53. Class Variable vs Instance Variable
class Dog:
    species = "Canine"

    def __init__(self, name):
        self.name = name


a, b = Dog("Rex"), Dog("Leo")

Dog.species = "Wolf"
a.species = "Husky"

print(a.species, b.species)  # Husky Wolf


# Q54. __str__ and __repr__
class Book:
    def __init__(self, title, author):
        self.title = title
        self.author = author

    def __str__(self):
        return f"{self.title} by {self.author}"

    def __repr__(self):
        return f"Book({self.title!r}, {self.author!r})"


book = Book("Python Basics", "John")
print(str(book))
print(repr(book))


# Q55. Count Employee Objects
class Employee:
    count = 0

    def __init__(self, name):
        self.name = name
        Employee.count += 1

    @classmethod
    def get_count(cls):
        return cls.count


e1 = Employee("Ravi")
e2 = Employee("Asha")
e3 = Employee("Kiran")

print("Total employees:", Employee.get_count())


# Q56. Understanding self
class Demo:
    def show(self):
        print("This method belongs to the object")


obj = Demo()
obj.show()

# self refers to the current instance.
# If self is omitted from an instance method, calling obj.show()
# generally raises TypeError because Python passes the instance automatically.


# -------------------- 12. OOP: ENCAPSULATION & PROPERTIES --------------------

# Q57. Bank Account with Validation
class BankAccount:
    def __init__(self, balance=0):
        if balance < 0:
            raise ValueError("Balance cannot be negative")
        self._balance = balance

    @property
    def balance(self):
        return self._balance

    def deposit(self, amount):
        if amount <= 0:
            raise ValueError("Deposit must be positive")
        self._balance += amount

    def withdraw(self, amount):
        if amount <= 0:
            raise ValueError("Withdrawal must be positive")
        if amount > self._balance:
            raise ValueError("Insufficient balance")
        self._balance -= amount


account = BankAccount(1000)
account.deposit(500)
account.withdraw(200)
print("Balance:", account.balance)


# Q58. Attribute Naming Conventions
class Example:
    def __init__(self):
        self.x = 10
        self._y = 20
        self.__z = 30


obj = Example()

print(obj.x)
print(obj._y)  # Accessible, but intended as internal.
print(obj._Example__z)  # Name-mangled attribute.

# x: public attribute.
# _y: internal-use convention.
# __z: name mangling, not true privacy.


# Q59. Circle with Property and Validated Radius
class Circle:
    def __init__(self, radius):
        self.radius = radius

    @property
    def radius(self):
        return self._radius

    @radius.setter
    def radius(self, value):
        if value <= 0:
            raise ValueError("Radius must be positive")
        self._radius = value

    @property
    def area(self):
        return 3.14159 * self._radius ** 2


circle = Circle(5)
print("Radius:", circle.radius)
print("Area:", circle.area)

# circle.area = 100  # AttributeError: area is read-only.


# Q60. Temperature with Fahrenheit Property
class Temperature:
    def __init__(self, celsius):
        self.celsius = celsius

    @property
    def fahrenheit(self):
        return self.celsius * 9 / 5 + 32


temperature = Temperature(25)
print("Celsius:", temperature.celsius)
print("Fahrenheit:", temperature.fahrenheit)


# -------------------- 13. OOP: INHERITANCE & POLYMORPHISM --------------------

# Q61. Employee, Manager and Developer
class EmployeeBase:
    def __init__(self, name, salary):
        self.name = name
        self.salary = salary

    def calculate_pay(self):
        return self.salary


class Manager(EmployeeBase):
    def calculate_pay(self):
        bonus = self.salary * 0.20
        return self.salary + bonus


class Developer(EmployeeBase):
    def calculate_pay(self):
        bonus = self.salary * 0.10
        return self.salary + bonus


employees = [
    EmployeeBase("Ravi", 40000),
    Manager("Asha", 60000),
    Developer("Kiran", 50000)
]

for employee in employees:
    print(employee.name, employee.calculate_pay())


# Q62. Method Resolution Order (MRO)
class A:
    def hello(self):
        print("A")


class B(A):
    def hello(self):
        print("B")


class C(A):
    def hello(self):
        print("C")


class D(B, C):
    pass


D().hello()  # B
print(D.__mro__)

# MRO: D -> B -> C -> A -> object


# Q63. Shapes and Polymorphism
import math

class CircleShape:
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return math.pi * self.radius ** 2


class Rectangle:
    def __init__(self, length, width):
        self.length = length
        self.width = width

    def area(self):
        return self.length * self.width


class Triangle:
    def __init__(self, base, height):
        self.base = base
        self.height = height

    def area(self):
        return 0.5 * self.base * self.height


shapes = [
    CircleShape(5),
    Rectangle(4, 6),
    Triangle(5, 8)
]

for shape in shapes:
    print("Area:", shape.area())

# This is polymorphism: different objects respond to the same method.


# Q64. isinstance and issubclass
class Person:
    pass


class EmployeeType(Person):
    pass


class ManagerType(EmployeeType):
    pass


manager = ManagerType()

print(isinstance(manager, ManagerType))
print(isinstance(manager, EmployeeType))
print(isinstance(manager, Person))

print(issubclass(ManagerType, EmployeeType))
print(issubclass(ManagerType, Person))


# Q65. Method Overriding and Overloading
# Overriding: a child class provides its own implementation of a parent method.

class Parent:
    def greet(self, name):
        print("Hello", name)


class Child(Parent):
    def greet(self, name):
        print("Welcome", name)


Child().greet("Ravi")


# Python does not support traditional method overloading by signature.
# Use default arguments or *args instead.

class Calculator:
    def add(self, a, b=0, c=0):
        return a + b + c


calc = Calculator()
print(calc.add(5, 10))
print(calc.add(5, 10, 15))


# Q66. Composition: Car Has an Engine
class Engine:
    def start(self):
        print("Engine started")


class Car:
    def __init__(self):
        self.engine = Engine()

    def start_car(self):
        self.engine.start()
        print("Car started")


car = Car()
car.start_car()

# Composition is useful when one object HAS another object,
# rather than being a specialized type of that object.


# -------------------- 14. OOP: ABSTRACTION & DUNDER METHODS --------------------

# Q67. Abstract Payment Method
from abc import ABC, abstractmethod


class PaymentMethod(ABC):
    @abstractmethod
    def pay(self, amount):
        pass


class CreditCard(PaymentMethod):
    def pay(self, amount):
        print(f"Paid Rs. {amount} using Credit Card")


class UPI(PaymentMethod):
    def pay(self, amount):
        print(f"Paid Rs. {amount} using UPI")


payments = [
    CreditCard(),
    UPI()
]

for payment in payments:
    payment.pay(500)

# PaymentMethod() raises TypeError because it has an abstract method.


# Q68. Vector2D Operator Overloading
class Vector2D:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __add__(self, other):
        return Vector2D(self.x + other.x, self.y + other.y)

    def __eq__(self, other):
        if not isinstance(other, Vector2D):
            return NotImplemented
        return self.x == other.x and self.y == other.y

    def __abs__(self):
        return math.sqrt(self.x ** 2 + self.y ** 2)

    def __repr__(self):
        return f"Vector2D({self.x}, {self.y})"


v1 = Vector2D(3, 4)
v2 = Vector2D(2, 1)

print("Addition:", v1 + v2)
print("Equality:", v1 == v2)
print("Magnitude:", abs(v1))


# Q69. Playlist with len, Indexing and Iteration
class Playlist:
    def __init__(self, songs):
        self.songs = songs

    def __len__(self):
        return len(self.songs)

    def __getitem__(self, index):
        return self.songs[index]

    def __iter__(self):
        return iter(self.songs)


playlist = Playlist(["Song A", "Song B", "Song C"])

print("Number of songs:", len(playlist))
print("First song:", playlist[0])

for song in playlist:
    print(song)


# Q70. Class Method and Static Method
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    @classmethod
    def from_string(cls, text):
        name, age = text.split("-")
        return cls(name, int(age))

    @staticmethod
    def is_adult(age):
        return age >= 18


person = Person.from_string("Asha-25")

print(person.name)
print(person.age)
print(Person.is_adult(25))

# classmethod receives cls and can create class instances.
# staticmethod does not receive self or cls.


# Q71. Timer Context Manager
import time


class Timer:
    def __enter__(self):
        self.start_time = time.perf_counter()
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        elapsed = time.perf_counter() - self.start_time
        print(f"Time taken: {elapsed:.4f} seconds")
        return False


with Timer():
    time.sleep(1)


# Q72. Function Execution Time Decorator
from functools import wraps


def execution_time(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        start = time.perf_counter()

        result = func(*args, **kwargs)

        end = time.perf_counter()
        print(f"{func.__name__} took {end - start:.4f} seconds")

        return result

    return wrapper


@execution_time
def calculate_sum(n):
    return sum(range(n + 1))


print(calculate_sum(100000))

# wraps preserves the original function's name, docstring and metadata.


# -------------------- 15. MINI PROJECTS --------------------

# Q73. LIBRARY MANAGEMENT SYSTEM

from datetime import date, timedelta


class LibraryError(Exception):
    pass


class BookNotAvailableError(LibraryError):
    pass


class MemberLimitError(LibraryError):
    pass


class Book:
    def __init__(self, title):
        self.title = title
        self.available = True


class Member:
    def __init__(self, name):
        self.name = name
        self.borrowed_books = {}


class Library:
    MAX_BOOKS = 3
    FINE_PER_DAY = 5

    def __init__(self):
        self.books = {}
        self.members = {}

    def add_book(self, book):
        self.books[book.title] = book

    def add_member(self, member):
        self.members[member.name] = member

    def issue_book(self, member_name, book_title):
        if member_name not in self.members:
            raise LibraryError("Member not found")

        if book_title not in self.books:
            raise LibraryError("Book not found")

        member = self.members[member_name]
        book = self.books[book_title]

        if not book.available:
            raise BookNotAvailableError("Book is not available")

        if len(member.borrowed_books) >= self.MAX_BOOKS:
            raise MemberLimitError("Maximum 3 books allowed")

        book.available = False
        member.borrowed_books[book_title] = date.today()

        print(book_title, "issued to", member_name)

    def return_book(self, member_name, book_title):
        if member_name not in self.members:
            raise LibraryError("Member not found")

        member = self.members[member_name]

        if book_title not in member.borrowed_books:
            raise LibraryError("This book was not issued to the member")

        issue_date = member.borrowed_books.pop(book_title)
        due_date = issue_date + timedelta(days=14)

        overdue_days = max(0, (date.today() - due_date).days)
        fine = overdue_days * self.FINE_PER_DAY

        self.books[book_title].available = True

        print("Book returned:", book_title)
        print("Overdue days:", overdue_days)
        print("Fine: Rs.", fine)

        return fine


library = Library()

library.add_book(Book("Python Basics"))
library.add_book(Book("Data Science"))
library.add_book(Book("SQL Guide"))

library.add_member(Member("Ravi"))

try:
    library.issue_book("Ravi", "Python Basics")
    library.return_book("Ravi", "Python Basics")

except LibraryError as error:
    print("Library Error:", error)


# Q74. ATM / BANKING SYSTEM

class Account:
    def __init__(self, account_number, name, balance=0):
        self.account_number = account_number
        self.name = name
        self._balance = balance
        self.history = []

    @property
    def balance(self):
        return self._balance

    def deposit(self, amount):
        if amount <= 0:
            raise ValueError("Amount must be positive")

        self._balance += amount
        self.history.append(f"Deposited Rs. {amount}")

    def withdraw(self, amount):
        raise NotImplementedError

    def save_history(self, filename="transactions.txt"):
        with open(filename, "a") as file:
            file.write(f"\nAccount: {self.account_number}\n")

            for transaction in self.history:
                file.write(transaction + "\n")


class SavingsAccount(Account):
    INTEREST_RATE = 0.04

    def withdraw(self, amount):
        if amount <= 0 or amount > self.balance:
            raise ValueError("Invalid withdrawal")

        self._balance -= amount
        self.history.append(f"Withdrawn Rs. {amount}")

    def add_interest(self):
        interest = self.balance * self.INTEREST_RATE
        self._balance += interest
        self.history.append(f"Interest added Rs. {interest:.2f}")


class CurrentAccount(Account):
    OVERDRAFT_LIMIT = 5000

    def withdraw(self, amount):
        if amount <= 0:
            raise ValueError("Amount must be positive")

        if amount > self.balance + self.OVERDRAFT_LIMIT:
            raise ValueError("Overdraft limit exceeded")

        self._balance -= amount
        self.history.append(f"Withdrawn Rs. {amount}")


savings = SavingsAccount("SB101", "Ravi", 10000)
savings.deposit(2000)
savings.withdraw(3000)
savings.add_interest()
savings.save_history()

current = CurrentAccount("CA101", "Asha", 5000)
current.withdraw(8000)
current.save_history()

print("Savings balance:", savings.balance)
print("Current balance:", current.balance)


# Q75. STUDENT RESULT SYSTEM USING CSV

import csv


def calculate_grade(percentage):
    if percentage >= 90:
        return "A"
    elif percentage >= 75:
        return "B"
    elif percentage >= 60:
        return "C"
    elif percentage >= 40:
        return "D"
    return "Fail"


# Create sample CSV.
with open("student_marks.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["name", "python", "sql", "excel"])
    writer.writerow(["Ravi", 85, 90, 80])
    writer.writerow(["Asha", 95, 92, 98])
    writer.writerow(["Kiran", 70, 75, 80])


results = []

with open("student_marks.csv", "r", newline="") as file:
    reader = csv.DictReader(file)

    for row in reader:
        marks = [
            float(row["python"]),
            float(row["sql"]),
            float(row["excel"])
        ]

        total = sum(marks)
        percentage = total / len(marks)
        grade = calculate_grade(percentage)

        results.append({
            "name": row["name"],
            "total": total,
            "percentage": percentage,
            "grade": grade
        })


results.sort(key=lambda student: student["percentage"], reverse=True)

with open("student_report.csv", "w", newline="") as file:
    fieldnames = ["rank", "name", "total", "percentage", "grade"]
    writer = csv.DictWriter(file, fieldnames=fieldnames)

    writer.writeheader()

    for rank, student in enumerate(results, start=1):
        writer.writerow({
            "rank": rank,
            "name": student["name"],
            "total": student["total"],
            "percentage": round(student["percentage"], 2),
            "grade": student["grade"]
        })

for rank, student in enumerate(results, start=1):
    print(
        rank,
        student["name"],
        student["total"],
        student["percentage"],
        student["grade"]
    )


# Q76. INVENTORY TRACKER USING JSON

import json
import os


class Inventory:
    def __init__(self, filename="inventory.json"):
        self.filename = filename
        self.products = self.load_data()

    def load_data(self):
        if not os.path.exists(self.filename):
            return {}

        try:
            with open(self.filename, "r") as file:
                return json.load(file)

        except (json.JSONDecodeError, OSError):
            print("Could not read inventory. Starting empty.")
            return {}

    def save_data(self):
        with open(self.filename, "w") as file:
            json.dump(self.products, file, indent=4)

    def add_product(self, name, price, quantity):
        if price < 0 or quantity < 0:
            raise ValueError("Price and quantity cannot be negative")

        if name in self.products:
            raise ValueError("Product already exists")

        self.products[name] = {
            "price": price,
            "quantity": quantity
        }

        self.save_data()

    def update_product(self, name, price=None, quantity=None):
        if name not in self.products:
            raise KeyError("Product not found")

        if price is not None:
            if price < 0:
                raise ValueError("Price cannot be negative")
            self.products[name]["price"] = price

        if quantity is not None:
            if quantity < 0:
                raise ValueError("Quantity cannot be negative")
            self.products[name]["quantity"] = quantity

        self.save_data()

    def remove_product(self, name):
        if name not in self.products:
            raise KeyError("Product not found")

        del self.products[name]
        self.save_data()

    def search_product(self, name):
        return self.products.get(name, "Product not found")

    def show_low_stock(self, threshold=5):
        for name, details in self.products.items():
            if details["quantity"] <= threshold:
                print("Low stock warning:", name, details["quantity"])


inventory = Inventory()

try:
    inventory.add_product("Laptop", 55000, 10)
    inventory.add_product("Mouse", 500, 3)

except ValueError:
    pass  # Products may already exist from a previous run.

inventory.update_product("Laptop", quantity=8)

print(inventory.search_product("Laptop"))
inventory.show_low_stock()


# Q77. PARKING LOT SYSTEM

from datetime import datetime


class Vehicle:
    RATE = 0

    def __init__(self, number):
        self.number = number
        self.entry_time = None

    def calculate_fee(self, hours):
        return self.RATE * hours


class Bike(Vehicle):
    RATE = 20


class Car(Vehicle):
    RATE = 50


class Truck(Vehicle):
    RATE = 100


class ParkingLot:
    def __init__(self, capacity):
        self.capacity = capacity
        self.slots = {}
        self.vehicles = {}

    def park_vehicle(self, vehicle):
        if vehicle.number in self.vehicles:
            raise ValueError("Vehicle is already parked")

        if len(self.vehicles) >= self.capacity:
            raise ValueError("Parking lot is full")

        available_slot = next(
            (slot for slot in range(1, self.capacity + 1)
             if slot not in self.slots),
            None
        )

        if available_slot is None:
            raise ValueError("No available slots")

        vehicle.entry_time = datetime.now()
        self.slots[available_slot] = vehicle.number
        self.vehicles[vehicle.number] = vehicle

        print(
            vehicle.number,
            "parked in slot",
            available_slot
        )

    def remove_vehicle(self, vehicle_number):
        if vehicle_number not in self.vehicles:
            raise ValueError("Vehicle not found")

        vehicle = self.vehicles.pop(vehicle_number)

        exit_time = datetime.now()
        duration = exit_time - vehicle.entry_time

        # Charge at least one hour; round partial hours upward.
        hours = max(1, (duration.total_seconds() + 3599) // 3600)

        fee = vehicle.calculate_fee(int(hours))

        slot = next(
            slot for slot, number in self.slots.items()
            if number == vehicle_number
        )

        del self.slots[slot]

        print("Vehicle:", vehicle_number)
        print("Parking duration:", duration)
        print("Fee: Rs.", fee)

        return fee


parking = ParkingLot(3)

bike = Bike("TS01AB1234")
car = Car("TS02CD5678")
truck = Truck("TS03EF9012")

parking.park_vehicle(bike)
parking.park_vehicle(car)
parking.park_vehicle(truck)

parking.remove_vehicle("TS01AB1234")
