# Is n divisible by x and y?
# Create a function isDivisible(n,x,y) that checks if a number n is divisible by two numbers x AND y
# Example:
# is_divisible(3,1,3)--> true because 3 is divisible by 1 and 3
# is_divisible(12,2,6)--> true because 12 is divisible by 2 and 6
# is_divisible(100,5,3)--> false because 100 is not divisible by 3
# is_divisible(12,7,5)--> false because 12 is neither divisible by 7 nor 5


def is_divisible(n,x,y)
  #divide n by x
  #if that equals 0, try dividing it by y
  #if that also equals 0, then n is divisible by both numbers
  #else, it is not
  if try_with_x(n,x) && try_with_y(n,y)
    true
  else
    false
  end
end

def try_with_x(n,x)
  n % x == 0 ? true : false
end

def try_with_y(n,y)
  n % y == 0 ? true : false
end

Test.assert_equals(is_divisible(3,3,4),false)
Test.assert_equals(is_divisible(12,3,4),true)
Test.assert_equals(is_divisible(8,3,4),false)
Test.assert_equals(is_divisible(48,3,4),true)
Test.assert_equals(is_divisible(198,2,12), false)



############
# Alternative Solution
# ##########

def is_divisible(n,x,y)
  (n % x == 0) && (n % y == 0)
end
