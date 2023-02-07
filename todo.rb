require "byebug"
array  = []
while true 
  puts "enter x to exit "
  puts "what is your next todo?: "  
  # stripg the space and line carriage return
  todo = gets.chomp
  # debugger
  if todo == "x"
    break
  else
    array.push(todo)
  end 
end
# added a line for comment

puts array
