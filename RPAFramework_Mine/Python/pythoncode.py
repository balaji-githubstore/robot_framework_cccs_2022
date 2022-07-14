from RPA.core.geometry import Point
print('bala')

a = 333
b = 200

if b > a:
  print("b is greater than a")
else:
  print("me")
  
  
a = 200
b = 33
if b > a:
  print("b is greater than a")
elif a == b:
  print("a and b are equal")
else:
  print("a is greater than b")
  
fruits = ["apple", "banana", "cherry"]
for x in fruits:
  print(x)
  
def my_function(fname):
  print(fname + " Refsnes")
  
def get_point(a,b):
    p=Point(a,b)
    
    return p
    
    