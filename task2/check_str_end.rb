def check_str_end(string)
  if string.upcase.end_with?("CS")
    2 ** string.length
  else string.reverse
  end
end

result = check_str_end("foobar")

puts "The result is #{result}"
