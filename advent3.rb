require 'pry'

KEYPAD = [[1,2,3],
	  [4,5,6],
	  [7,8,9]]

@current_key = KEYPAD[1][1]
@current_index = [1, 1]
@bathroom_code = []


#keypad[row][column]


def navigate(direction)
	#binding.pry
	begin
		new_index = @current_index.clone
		case direction
		when 'u'
			new_index[0] = @current_index[0] - 1 
		when 'd'
			new_index[0] = @current_index[0] + 1 
		when 'r'
			new_index[1] = @current_index[1] + 1 
		when 'l' 
			new_index[1] = @current_index[1] - 1
		end
	new_key = KEYPAD[new_index[0]][new_index[1]]	
	#binding.pry
	rescue NoMethodError
		return 
	else
		return unless new_key
		return if new_index[0] < 0 || new_index[1] < 0
	       	@current_key = new_key
		@current_index = new_index
	end
end

def calculate_index(key)
	index = []
	KEYPAD.each_index {|i| index = [i, KEYPAD[i].index(key)] if KEYPAD[i].include? key}; index
end

puts "Keypad code identifier: AoC Day 2"
print "Enter path to instruction file:"; filename = gets

instructions = File.open(filename.strip!, 'r').readlines

instructions.each do |line|
	line.each_char {|c| navigate(c.downcase)}
	#binding.pry
	@bathroom_code.push @current_key
end

puts "Bathroom code: #{@bathroom_code}"
