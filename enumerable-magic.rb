#Create a method each_cons that accepts a list and a number n, and returns cascading subsets of the list of size n, like so:
#each_cons([1,2,3,4], 2)
#=> [[1,2], [2,3], [3,4]]
#each_cons([1,2,3,4], 3)
#=> [[1,2,3],[2,3,4]]#As you can see, the lists are cascading; ie, they overlap, but never out of order.
#If you need help, here's a reference:
#http://www.rubycuts.com/enum-each-cons


#My solution


def each_cons list, n
  list.each_cons(n).to_a
end

#my tests
describe "each_cons" do
  list = [3, 5, 8, 13]
  list2 = [1,2,3,4,5]
  list3 = ['a','b','x']
  Test.assert_equals(each_cons(list, 2), [[3,5],[5,8],[8,13]], "should return cascading lists of 2 elements")
  Test.assert_equals(each_cons(list2, 3), [[1,2,3], [2,3,4], [3,4,5]], "should return cascading list of 3 elements")
  Test.assert_equals(each_cons(list3, 3), [['a','b','x']], "should return a single nested array")

end


#alternative solution1 not using the built-in method
def each_cons list, n
  cons = Array.new
  last = list.size
  for i in (0..last-n)
    cons << list[0+i,n]
  end
  p cons
  cons
end

#alternative solution2 not using the built-in method
def each_cons list, n
  i = 0
  result = []
  while i < list.length - n + 1
    result << list[i..(i + n - 1)]
    i += 1
  end
  result
end
