require 'pry'

puts "AoC Day 3:"; print "Enter path to instruction file:"
path = gets

possible_triangles = 0

triangles = File.open(path.strip!, 'r').readlines.map! {|t| t.strip!.split.map! {|e| e.to_i}}
#binding.pry

def is_triangle?(t)
	#binding.pry
	t.sort!
	t[2] > t[0] + t[1] ? false : true
end

triangles.each do |triangle|
	if is_triangle?(triangle)
		possible_triangles = possible_triangles + 1
		triangle.push true
	else
		triangle.push false
	end
end

puts "Possible triangles: #{possible_triangles}"
puts triangles
