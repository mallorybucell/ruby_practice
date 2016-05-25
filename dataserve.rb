require 'socket'

s = TCPServer.new(3939)
while (conn = s.accept)
  Thread.new(conn) do |c|
    c.print "Hi, what's your name? "
    name = c.gets.chomp
    c.puts "Hi, #{name}. Here's the date."
    c.puts `say 'printing the date' `
    c.puts `date`
    c.close
  end
end