# 1. Remove Spaces from Given Text
def remove_spaces(text):
    return ''.join(text.split())


# 2. Reverse a String
def reverse_string(text):
    return text[::-1]


# 3. Reverse a String After Removing Spaces
def reverse_without_spaces(text):
    return ''.join(text.split())[::-1]


# 4. Snake Case to Camel Case
def snake_to_camel(text):
    words = text.split('_')
    return words[0].lower() + ''.join(w.capitalize() for w in words[1:])


# 5. Snake Case to Pascal Case
def snake_to_pascal(text):
    return ''.join(w.capitalize() for w in text.split('_'))


# 6. Camel Case to Snake Case
def camel_to_snake(text):
    import re
    return re.sub(r'([A-Z])', r'_\1', text).lower().lstrip('_')


# 7. Camel Case to Pascal Case
def camel_to_pascal(text):
    return text[0].upper() + text[1:] if text else text


# 8. Pascal Case to Camel Case
def pascal_to_camel(text):
    return text[0].lower() + text[1:] if text else text


# 9. Pascal Case to Snake Case
def pascal_to_snake(text):
    return camel_to_snake(text)


# 10. Text to Camel Case
def text_to_camel(text):
    words = text.split()
    return words[0].lower() + ''.join(w.capitalize() for w in words[1:]) if words else ''


# 11. Text to Snake Case
def text_to_snake(text):
    return '_'.join(w.lower() for w in text.split())


# 12. Text to Pascal Case
def text_to_pascal(text):
    return ''.join(w.capitalize() for w in text.split())


# 13. Swap Uppercase and Lowercase
def swap_case(text):
    return text.swapcase()


# 14. Separate Digits from Text
def extract_digits(text):
    return ''.join(ch for ch in text if ch.isdigit())


# 15. Print Uppercase, Lowercase, Digits and Special Characters
def separate_characters(text):
    uppercase = [ch for ch in text if ch.isupper()]
    lowercase = [ch for ch in text if ch.islower()]
    digits = [ch for ch in text if ch.isdigit()]
    special = [ch for ch in text if not ch.isalnum()]

    return uppercase, lowercase, digits, special


# 16. Count Uppercase, Lowercase, Digits and Special Characters
def count_characters(text):
    return {
        "uppercase": sum(ch.isupper() for ch in text),
        "lowercase": sum(ch.islower() for ch in text),
        "digits": sum(ch.isdigit() for ch in text),
        "special": sum(not ch.isalnum() for ch in text)
    }


# 17. Check Password Strength
def check_password(password):
    uppercase = any(ch.isupper() for ch in password)
    lowercase = any(ch.islower() for ch in password)
    digit = any(ch.isdigit() for ch in password)
    special = any(not ch.isalnum() for ch in password)

    if uppercase and lowercase and digit and special:
        return "Strong"
    return "Weak"


# 18. Remove Duplicates in a String
def remove_string_duplicates(text):
    result = ''
    for ch in text:
        if ch not in result:
            result += ch
    return result


# 19. Print Duplicates in a String
def string_duplicates(text):
    return list(set(ch for ch in text if text.count(ch) > 1))


# 20. Print Next Characters in a String
def next_characters(text):
    return ''.join(chr(ord(ch) + 1) for ch in text)


# ============================================================
# 2. LIST PROGRAMS
# ============================================================

# 21. Add an Element to a List
def add_element(lst, element):
    lst.append(element)
    return lst


# 22. Remove an Element from a List
def remove_element(lst, element):
    if element in lst:
        lst.remove(element)
    return lst


# 23. Find Maximum in List
def find_max(lst):
    return max(lst)


# 24. Find Minimum in List
def find_min(lst):
    return min(lst)


# 25. Sum of All Elements in List
def list_sum(lst):
    return sum(lst)


# 26. Count Occurrence of an Element
def count_element(lst, element):
    return lst.count(element)


# 27. Reverse a List
def reverse_list(lst):
    return lst[::-1]


# 28. Sort a List
def sort_list(lst):
    return sorted(lst)


# 29. Remove Duplicates from a List
def remove_list_duplicates(lst):
    return list(dict.fromkeys(lst))


# 30. Merge Two Lists
def merge_lists(lst1, lst2):
    return lst1 + lst2


# 31. Find Common Elements in Two Lists
def common_elements(lst1, lst2):
    return list(dict.fromkeys(x for x in lst1 if x in lst2))


# 32. Print Even Numbers in a List
def even_numbers(lst):
    return [x for x in lst if x % 2 == 0]


# 33. Print Odd Numbers in a List
def odd_numbers(lst):
    return [x for x in lst if x % 2 != 0]


# 34. Check if List is Palindrome
def is_list_palindrome(lst):
    return lst == lst[::-1]


# 35. Count Positive, Negative and Zero
def count_positive_negative_zero(lst):
    positive = sum(x > 0 for x in lst)
    negative = sum(x < 0 for x in lst)
    zero = sum(x == 0 for x in lst)

    return positive, negative, zero


# 36. Find Second Largest Number
def second_largest(lst):
    unique = sorted(set(lst), reverse=True)
    return unique[1] if len(unique) >= 2 else None


# 37. Find Second Smallest Number
def second_smallest(lst):
    unique = sorted(set(lst))
    return unique[1] if len(unique) >= 2 else None


# 38. Copy List to Another List
def copy_list(lst):
    return lst.copy()


# 39. Print All Prime Numbers in List
def is_prime(n):
    if n < 2:
        return False

    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False

    return True


def prime_numbers(lst):
    return [x for x in lst if is_prime(x)]


# 40. Replace All Zeroes with a Given Number
def replace_zeros(lst, replacement):
    return [replacement if x == 0 else x for x in lst]


# 41. Check if All Elements Are Same
def all_elements_same(lst):
    return len(set(lst)) <= 1


# 42. Find Frequency of All Elements
def list_frequency(lst):
    frequency = {}

    for x in lst:
        frequency[x] = frequency.get(x, 0) + 1

    return frequency


# 43. Flatten a Nested List
def flatten_list(lst):
    return [item for sublist in lst for item in sublist]


# 44. Split a List into Even and Odd Lists
def split_even_odd(lst):
    even = [x for x in lst if x % 2 == 0]
    odd = [x for x in lst if x % 2 != 0]

    return even, odd


# 45. Find Pairs with Given Sum
def pairs_with_sum(lst, target):
    pairs = set()

    for i in range(len(lst)):
        for j in range(i + 1, len(lst)):
            if lst[i] + lst[j] == target:
                pairs.add(tuple(sorted((lst[i], lst[j]))))

    return list(pairs)


# 46. Remove All Odd Numbers
def remove_odd(lst):
    return [x for x in lst if x % 2 == 0]


# 47. Remove All Even Numbers
def remove_even(lst):
    return [x for x in lst if x % 2 != 0]


# 48. Multiply All Elements by a Number
def multiply_elements(lst, number):
    return [x * number for x in lst]


# 49. Find Difference Between Maximum and Minimum
def max_min_difference(lst):
    return max(lst) - min(lst)


# 50. Check if a List is Empty
def is_empty(lst):
    return len(lst) == 0


# 51. Insert Element at Specific Index
def insert_element(lst, index, value):
    result = lst.copy()
    result.insert(index, value)
    return result


# 52. Remove All Instances of a Value
def remove_all_instances(lst, value):
    return [x for x in lst if x != value]


# 53. Get Index of an Element
def get_index(lst, element):
    return lst.index(element)


# 54. Square All Elements in a List
def square_elements(lst):
    return [x ** 2 for x in lst]


# 55. Filter Out Negative Numbers
def remove_negative(lst):
    return [x for x in lst if x >= 0]


# 56. Get Elements Greater Than a Value
def greater_than(lst, value):
    return [x for x in lst if x > value]


# 57. Find Duplicates in List
def find_list_duplicates(lst):
    return list(dict.fromkeys(x for x in lst if lst.count(x) > 1))


# 58. Rotate List Elements Right
def rotate_right(lst, k):
    if not lst:
        return []

    k = k % len(lst)
    return lst[-k:] + lst[:-k] if k else lst.copy()


# 59. Check If List Contains a Value
def contains_value(lst, value):
    return value in lst


# 60. Chunk List into Smaller Lists
def chunk_list(lst, size):
    if size <= 0:
        raise ValueError("Chunk size must be positive")

    return [lst[i:i + size] for i in range(0, len(lst), size)]


# ============================================================
# 3. SET PROGRAMS
# ============================================================

# 61. Add an Element to a Set
def add_set_element(s, element):
    s.add(element)
    return s


# 62. Remove an Element from a Set
def remove_set_element(s, element):
    s.discard(element)
    return s


# 63. Union of Two Sets
def set_union(s1, s2):
    return s1.union(s2)


# 64. Intersection of Two Sets
def set_intersection(s1, s2):
    return s1.intersection(s2)


# 65. Difference of Two Sets
def set_difference(s1, s2):
    return s1.difference(s2)


# 66. Check Subset
def check_subset(s1, s2):
    return s1.issubset(s2)


# 67. Set Length
def set_length(s):
    return len(s)


# 68. Clear a Set
def clear_set(s):
    s.clear()
    return s


# 69. Symmetric Difference
def symmetric_difference(s1, s2):
    return s1.symmetric_difference(s2)


# 70. Convert List to Set
def list_to_set(lst):
    return set(lst)


# ============================================================
# 4. DICTIONARY PROGRAMS
# ============================================================

# 71. Create Dictionary from Two Lists
def create_dictionary(keys, values):
    return dict(zip(keys, values))


# 72. Update Dictionary Value
def update_value(d, key, value):
    d[key] = value
    return d


# 73. Remove Key from Dictionary
def remove_key(d, key):
    d.pop(key, None)
    return d


# 74. Check Key Existence
def check_key(d, key):
    return key in d


# 75. Iterate Over Dictionary
def iterate_dictionary(d):
    return list(d.items())


# 76. Dictionary Length
def dictionary_length(d):
    return len(d)


# 77. Merge Two Dictionaries
def merge_dictionaries(d1, d2):
    return {**d1, **d2}


# 78. Get Value with Default
def get_value(d, key, default):
    return d.get(key, default)


# 79. Count Frequency of Elements
def count_frequency(lst):
    frequency = {}

    for x in lst:
        frequency[x] = frequency.get(x, 0) + 1

    return frequency


# 80. Invert a Dictionary
def invert_dictionary(d):
    return {value: key for key, value in d.items()}


# 81. Find Key with Maximum Value
def key_with_max_value(d):
    return max(d, key=d.get)


# 82. Sort Dictionary by Values
def sort_dictionary_by_values(d):
    return sorted(d.items(), key=lambda item: item[1])


# 83. Create Dictionary of Squares
def dictionary_of_squares(start, end):
    return {x: x ** 2 for x in range(start, end + 1)}


# 84. Filter Dictionary by Value Condition
def filter_dictionary(d, threshold):
    return {k: v for k, v in d.items() if v > threshold}


# 85. Combine Values of Duplicate Keys
def combine_dictionary_values(d1, d2):
    result = d1.copy()

    for key, value in d2.items():
        result[key] = result.get(key, 0) + value

    return result


# 86. Count Word Frequency in Sentence
def word_frequency(sentence):
    frequency = {}

    for word in sentence.lower().split():
        frequency[word] = frequency.get(word, 0) + 1

    return frequency


# 87. Remove Duplicate Values from Dictionary
def remove_duplicate_values(d):
    result = {}
    seen = set()

    for key, value in d.items():
        if value not in seen:
            result[key] = value
            seen.add(value)

    return result


# 88. Find Common Keys in Two Dictionaries
def common_keys(d1, d2):
    return [key for key in d1 if key in d2]


# 89. Swap Keys and Values Safely
def swap_keys_values(d):
    values = list(d.values())

    if len(values) != len(set(values)):
        raise ValueError("Dictionary values must be unique")

    return {value: key for key, value in d.items()}


# 90. Delete Items by Value
def delete_items_by_value(d, target):
    return {key: value for key, value in d.items() if value != target}

