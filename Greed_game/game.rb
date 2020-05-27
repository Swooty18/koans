 class Score
 def score
    total = 0    
    number = 6
    begin 
        delete = []
        total_round = 0
        dice = Array.new(number) { rand(1..number) } 
        (1..number).each do |i|
            idice = dice.select { |d| d == i }       
            count = idice.size

            if idice.include?(1) || idice.include?(5)
                delete += [i]
            end

            if count >= 3
                delete += [i]
                total_round += (i==1 ? 1000 : i*100)
            end
            
            total_round += (count % 3) * 100  if i == 1
            total_round += (count % 3) *  50 if i == 5
            return total = 0 if total_round == 0
           
        end
        total += total_round
        number = (dice - delete).size
        puts "#{dice} : #{(dice - delete)}"
        puts "#{total}"
        puts "Press 'stop' for stop"
        stop = gets.chomp
        return total if stop == "stop"
    end while (number > 0) 
    total
end
end