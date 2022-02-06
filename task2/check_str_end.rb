def check_str_end(string)
  string.upcase.end_with?("CS") ? 2 ** string.length : string.reverse
end

result = check_str_end("foobarcs")

puts "The result is #{result}"
