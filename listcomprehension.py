#1 def squares(nums):
#     return [x**2 for x in nums]
# nums=[1,2,3,4]
# print(squares(nums))

#2 def even(nums):
#     return [x for x in nums if x%2==0]
# nums=[1,2,3,4]
# print(even(nums))

#3 def length(strings):
#     return [len(x) for x in strings]
# strings=input().split(' ')
# print(length(strings))

#4 def replace_negatives(nums):
#     return [0 if x<0 else x for x in nums]
# nums=list(map(int,input().split()))
# print(replace_negatives(nums))

#5 def pairs(list_a, list_b):
#     return [(a,b) for a in list_a for b in list_b]
# print(pairs([1,2,3],[5,6,7]))

#6 matrix = [[1, 2, 3], [4, 5], [6, 7, 8, 9]]

# Flatten the list
# def flatten(matrix):
#     return [j for i in matrix for j in i]
# matrix=[[1,2],[3,4]]
# print(flatten(matrix))

# x=[2,4,3,5,7,9]
# prime=[]
# for i in x:
#     count=0
#     for j in range(1,i+1):
#         if i%j==0:
#             count+=1
#     if count==2:
#         prime.append(j)
# print(prime)


#7 def is_prime(n):
#     count=0
#     for j in range(1,n+1):
#         if n%j==0:
#             count+=1
#     if count==2:
#         return True
#     else:
#         return False

# nums=[2,4,3,5,7,9]
# def primes(nums):
#     return [n for n in nums if is_prime(n)]
# print(primes(nums))

# strings=['hema','hema','latha','chitty','hema']
# seti=set()
# unique=[]
# for i in chars:
#     for j in i:
#         if j not in seti:
#             seti.add(j)
#             unique.append(j)
# print(unique)

#8 seen=set()
# def unique_chars(strings):
#     return [j for i in strings for j in i if j not in seen and not seen.add(j)]
# print(unique_chars(strings))

#9 def weighted_sum(pairs):
#     return [v*w for v,w in pairs]
# pairs=[(1,2),(3,4)]
# print(weighted_sum(pairs))



#10 mat=[[1,2,8],[3,4,9],[5,6,0]]
# for i in range(len(mat)): 
#     for j in range(len(mat)): 
#         if i<j:
#             mat[i][j],mat[j][i]=mat[j][i],mat[i][j]
# print(mat)

# def matrix_transpose(mat):
#     return [[mat[j][i] for j in range(len(mat))] for i in range(len(mat))]
# mat=[[1,2,8],[3,4,9],[5,6,0]]
# print(matrix_transpose(mat))