require 'pry'

CARDINAL_ROSE = %w(n e s w)
START = [0, 0]
@location = [0, 0]
@locations = [[0,0]]

@orientation = CARDINAL_ROSE.clone

def turn(relative_dir)
	relative_dir == 'R' ? @orientation.rotate!(1) : @orientation.rotate!(-1)
end

def direction
	@orientation[0]
end

def travel(direction, travel_distance)

	travel_distance.times do 

		case direction
		when 'n'
			@location[0] = @location[0] + 1
		when 's'
			@location[0] = @location[0] - 1
		when 'e'
			@location[1] = @location[1] + 1
		when 'w' 
			@location[1] = @location[1] - 1
		end

		#binding.pry

		puts "New Coordinates: #{@location}"
		
		if @locations.include? @location 			
			puts "First location visited twice is #{distance} blocks away"
			abort
		end

	@locations.push @location.clone
	@locations.each {|l| puts l}
	end
end

def distance
	(@location[0] - START[0]).abs + (@location[1] - START[1]).abs
end	

def move(instruction)
	match = /(R|L)(\d+)/i.match(instruction)

	puts "Captures: #{match.captures}"

	puts "Match 0 : #{match[0]}"
	puts "Turn: #{match[1]}"
	puts "Distance to move: #{match[2]}"

	#binding.pry
	turn(match[1])

	puts "Orientation: #{@orientation}"

	travel(direction, match[2].to_i)
	
	puts "Current location: #{@location}"

	puts "Current blocks away: #{distance}"
end

puts "Distance calculator!"
print "Enter path of instruction file: "
filename = gets.strip!
File.open(filename, 'r').read.split(',').each {|s| s.strip!; move(s)}
puts "Total Blocks Away: #{distance}"

#loop do
#	puts "Enter next turn:"
#	input = gets
#	exit if input == 'exit'
#	move(input)
#	puts "Total Blocks Away: #{distance.abs}"
#end
