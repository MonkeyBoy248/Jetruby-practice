def foobar (first_op, second_op)
  if (first_op == 20)
    second_op
  elsif (second_op == 20)
    first_op
  else
    first_op + second_op
  end
end

result = foobar(21, 20)

puts result
