require './validation_test2.rb'
require './validation_test.rb'

test = {}
test[:a ] = Validation2Test.new("Divya", 21, "divya@gmail.com")
test[:a1] = Validation2Test.new(nil, 25, "divya@gmail.com")
test[:a2] = Validation2Test.new("Divya", nil, "divya@gmail.com")
 
test[:b ] = ValidationTest.new("Divya", 21, "di\\vya@gmail.com")
test[:b1] = ValidationTest.new("Divya28", 21, "divya@gmail.com")

test[:c ] = ValidationTest.new("divya", 21, 125)
test[:c1] = ValidationTest.new("divya", "21", 125)

puts "Valid object validation#{test[:a].valid?.to_s} "
puts "Innvalid object validation with preesnce #{test[:a1].valid?.to_s}, #{test[:a2].valid?.to_s} "
puts "Invalid object validation with format   #{test[:b].valid?.to_s}, #{test[:b1].valid?.to_s} "
puts "Invalid object validation with type     #{test[:c].valid?.to_s}, #{test[:c1].valid?.to_s} "

test.each_pair do |k, v|
  begin
    v.validate!
  rescue StandardError => e
    puts e.to_s
  end
end