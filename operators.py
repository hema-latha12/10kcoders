#A. Arithmetic operators

#1 addition
a = 20
b = 10
c = a+b
print(c)

#2 add,sub,mul,div
a = 20
b = 5
add = a+b
sub = a-b
mul = a*b
div = a/b
print(add,sub,mul,div)


#3. remainder
a = 25
b = 4
print(25%4)

#4. power
a = 5
b = 3
print(a**b)

#B. relational/comparision operators

#5. compare two numbers
a = 50
b = 30
print(a>b)

#6. check equality
a = 25
b = 25
print(25 == 25)

#7. greater or smaller
a = 100
b = 100
print(a>=b)

#8. compare 2 ages
age = 20
print(age>=18)

#C. logical operators

#9. using and
age = 30
print(age>=18 and age<=60) 

#10. using or
maths = 80
science = 35
print(maths>35 or science>35)

#11. using not
x = True
print(not(x))

#12. multiple logical conditions
age = 25
qualification = 'Degree'

print(age>=25 and qualification=='Degree')

#D. membership operators
#13. using in
languages = ['Java','Python','C++','SQL']
print('Python' in languages)

#14. using not in
languages = ['Java','Python','C++']
print('Javascript' not in languages)

#15. string membership
name = 'Aparna'
print('a' in name)

#E. Identity operators
#16. using is
a = [1,2,3]
b = a
print(id(a),id(b))
print(a is b)

#17. using is not
a = [1,2,3]
b = [1,2,3]
print(id(a),id(b))
print(a is not b)

#F. assignment operators
#18 += operator
x = 20
x+=10
print(x)

#19 *= operator
x = 10
x*=50
print(x)

#20. assignment-multiple
x = 100
x+=20
print(x)
x-=10
print(x)
x*=2
print(x)
x/=2
print(x)









