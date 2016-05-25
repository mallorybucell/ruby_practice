t = Thread.new do
  puts "[Starting Thread]"
  Thread.stop
  puts "[Resuming thread]"
end

puts "Status of thread: #{t.status}"
puts "Is thread stopped? #{t.stop?}"
puts "Is thread alive? #{t.alive?}"
puts
puts "Waking up thread and joining it..."
t.wakeup
t.join
puts
puts "Is thread alive? #{t.alive?}"
puts "Inspect string for thread: #{t.inspect}"

f = Fiber.new do
  puts "Hi."
  Fiber.yield
  puts "Nice day."
  Fiber.yield
  puts "Bye!"
end
puts
puts
puts
puts
puts "Fiber start:"
f.resume
puts "Back to the fiber:"
f.resume
puts "One last message from the fiber:"
f. resume
puts "That's all"