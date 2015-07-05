# We're given some typical *nix commands and want to parse them into their arguments. We'll ignore quoted arguments and other special characters, although if any of the characters &, ;, >, | show up, those signify that a new command has started (so we can ignore any arguments after it).

# Examples

# ls -R /

#  ["ls", "-R", "/"]
# cat /tmp/data.txt | less

#  ["cat", "/tmp/data.txt"]

def args(cmd)
  arr = cmd.split('')
  if arr.include?('|')
    arr = arr.take(arr.index("|"))
  elsif arr.include?('&')
    arr = arr.take(arr.index("&"))
  elsif arr.include?(';')
    arr = arr.take(arr.index(";"))
  elsif arr.include?('>')
    arr = arr.take(arr.index(">"))
  end
  arr.join.split
end


Test.expect(args("ls -R /") == ["ls", "-R", "/"], "failed parsing \"ls -R /\"")
Test.expect(args("cat /tmp/data.txt | less") == ["cat", "/tmp/data.txt"], "failed parsing command with pipe (|) operator")

#################
# Alternative Solution
#################

def args(cmd)
  cmd.strip.split(/[&;>|]/).first.split(/\s+/)
end
