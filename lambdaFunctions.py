Define a lambda is_prime that takes an integer n and returns True if n is a prime number, otherwise False.

def prime(n):
    c=0
    for i in range(1,n+1):
        if n%i==0:
            c+=1
    return c==2

is_prime=lambda n: True if prime(n) else False
print(is_prime(7))

is_prime=lambda n: n>1 and all([n%i for i in range(2, int(n**0.5)+1)])
print(is_prime(7))

Define a lambda is_armstrong that takes an integer n and returns True if n is an Armstrong (narcissistic) number, otherwise False.

def armstrong(n):
    temp=n
    armsum=0
    l=len(str(n))
    for i in range(l):
        ld=temp%10
        armsum+=ld**l
        temp=temp//10
    return armsum==n

is_armstrong=lambda n: True if armstrong(n) else False
print(is_armstrong(153))

is_armstrong=lambda n: sum(int(digit) ** len(str(n)) for digit in str(n))==n
print(is_armstrong(153))

Define a lambda is_spy that takes an integer n and returns True if n is a Spy number (sum of its digits equals the product of its digits), otherwise False.

def spy_num(n):
    sum=0
    prod=1
    l=len(str(n))
    for i in range(l):
        ld=n%10
        sum+=ld
        prod*=ld
        n=n//10
    return sum==prod

is_spy=lambda n:True if spy_num(n) else False
print(is_spy(123))

import math
is_spy=lambda n: sum(int(i) for i in str(n)) == math.prod(int(i) for i in str(n))
print(is_spy(123))

Define a lambda is_neon that takes an integer n and returns True if n is a Neon number (the sum of the digits of n² equals n), otherwise False.

def neon_num(n):
    sq=n**2
    s=0
    l=len(str(sq))
    for i in range(l):
        ld=sq%10
        s+=ld
        sq=sq//10
    return s==n

is_neon=lambda n:True if neon_num(n) else False
print(is_neon(9))

is_neon=lambda n: sum(int(d) for d in str(n**2)) == n
print(is_neon(9))

Create a lambda digit_sum that returns the sum of the decimal digits of its integer argument.

def sumdigit(n):
    l=len(str(n))
    s=0
    for i in range(l):
        ld=n%10
        s+=ld
        n=n//10
    return s

digit_sum=lambda n: sumdigit(n)
print(digit_sum(123))

digit_sum=lambda n: sum(int(i) for i in str(n))
print(digit_sum(12))

Create a lambda digit_product that returns the product of the decimal digits of its integer argument.

def proddigit(n):
    prod=1
    l=len(str(n))
    for i in range(l):
        ld=n%10
        prod*=ld
        n=n//10
    return prod

digit_product=lambda n: proddigit(n)
print(digit_product(123))

import math

digit_product=lambda n: math.prod(int(i) for i in str(n))
print(digit_product(45))

Using the previously defined lambdas, implement a lambda is_palindrome that returns True when the integer reads the same forward and backward.

def palindrome(n):
    strnum=str(n)
    return strnum==strnum[::-1]

is_palindrome=lambda n: True if palindrome(n) else False
print(is_palindrome(121))

is_palindrome=lambda n: str(n)==str(n)[::-1]
print(is_palindrome(121))

Write a lambda is_perfect that returns True if the integer is a perfect number (sum of its proper divisors equals the number).

def perfect_num(n):
    s=0
    for i in range(1,n):
        if n%i==0:
            s+=i
    return s==n

is_perfect=lambda n: True if perfect_num(n) else False 
print(is_perfect(6))

is_perfect=lambda n: sum([i for i in range(1,n) if n%i==0])==n
print(is_perfect(6))

Combine any two of the above lambdas in a single expression to produce a new predicate (e.g., a lambda that returns True only when a number is both prime and a palindrome). Name this combined lambda appropriately.

def prime(n):
    c=0
    for i in range(1,n+1):
        if n%i==0:
            c+=1
    return c==2

def palindrome(n):
    strnum=str(n)
    return strnum==strnum[::-1]

is_prime_palindrome=lambda n: True if prime(n) and palindrome(n) else False 
print(is_prime_palindrome(151))

is_prime_palindrome=lambda n: n>1 and all([n%i for i in range(2, int(n**0.5)+1)]) and (str(n)==str(n)[::-1])
print(is_prime_palindrome(151))


