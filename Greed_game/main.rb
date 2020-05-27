require_relative "game"

puts "how many people will play?"
number_of_users = gets.chomp.to_i
users = Array.new(number_of_users).fill(0)
h = Hash[(0...users.size).zip users]
puts "Let's start the game"
total = 0
begin
	h.update(h) do |index , value|
			
		puts "Now play user#{index}"
		user = Score.new
		total = user.score
		value += total
	end
	puts "-------------------------"
	puts "#{h} : #{h.values.max}"
	puts "-------------------------"
end while h.values.max <= 3000

puts "Final Round"

h.update(h) do |index , value|
			
	puts "Now play user#{index}"
	user = Score.new
	total = user.score
	value += total
end
h.each { |k, v| puts "#{k} ; #{v}" if v == h.values.max }
	
		