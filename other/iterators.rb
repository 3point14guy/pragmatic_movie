# def conversation
#   puts "Hello"
#   yield
#   puts "Good-bye"
# end
#
# conversation { puts "Good to meet you!" }
def n_times(n)
  1.upto(n) { |i| yield i }


end

n_times(5) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end
