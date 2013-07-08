# Andrew Kemp: GitHub = andyajna, 2013
# This algorithm is yours to use and adapt for free - I hope it helps!
# This algorithm is based on the Hungarian algorithm (https://en.wikipedia.org/wiki/Hungarian_algorithm) 
# that solves a combinatorial allocation problem.
# The matrix rows each represent a person; the matrix columns each represent an allocation.
# 
# Instructions:
# Change A to the number of trainees / people
# For A people, make sure there are A zeros in the howmanyterms array
# Replace 'Trainee x' with the trainees names - there should be A elements in the trainees array
# Change B to the number of rotations available
# For B rotations, make sure there are B zeros in the howmanytimes array
# Replace 'Rotation x' with the rotation names - there should be B elements in the trainees array
# Input trainee's preferences in the prefs array. The first block is for trainee 1. Each element is that trainee's preference for the corresponding rotation
#
# Tracers are commented out - if you find a bug, uncomment to run, and follow the STOUT to find what the algorithm is doing


# Constants
A = 12 # Number of trainees (number of rows)
B = 11 # Number of rotations available (number of columns)
C = 4 # Number of choices to make (ie a trainee can have a max of C rotations; a rotation can be allocated C times)

# Variables
l = 1 # Preference number to check, starts at 1
x = 0 # Position in howmanyterms array
y = 0 # Position in howmanytimes array



results = [[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]]  #axb array
prefs = [[1, 9, 8, 3, 6, 5, 7, 10, 2, 4, 11], [3, 9, 8, 5, 4, 2, 7, 6, 10, 1, 11], [3, 1, 7, 9, 6, 3, 8, 10, 5, 2, 11], [7, 8, 1, 11, 3, 5, 6, 9, 4, 10, 2], [8, 11, 2, 9, 1, 7, 6, 3, 5, 10, 4], 
		 [1, 6, 7, 3, 4, 5, 9, 8, 11, 2, 10], [2, 9, 8, 11, 6, 1, 7, 4, 5, 3, 10], [1, 11, 5, 8, 5, 3, 10, 7, 2, 6, 9], [2, 7, 1, 9, 3, 4, 8, 10, 5, 6, 11], [1, 9, 7, 10, 5, 2, 3, 11, 6, 4, 8], 
		 [4, 9, 5, 10, 6, 2, 1, 11, 7, 3, 8], [3, 9, 10, 7, 6, 2, 1, 5, 8, 4, 11]]  # This is an A x B array
howmanytimes = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] # Holds the number of times a rotation has been allocated - set the maximum at constant C above
howmanyterms = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] # Holds the number of rotations a trainee has been allocated - this is set at C above
trainees = ["TRAINEE 1", "TRAINEE 2", "TRAINEE 3", "TRAINEE 4", "TRAINEE 5", "TRAINEE 6", "TRAINEE 7", "TRAINEE 8", "TRAINEE 9", "TRAINEE 10", "TRAINEE 11", "TRAINEE 12"]
terms = ["ROTATION 1", "ROTATION 2", "ROTATION 3", "ROTATION 4", "ROTATION 5", "ROTATION 6", "ROTATION 7", "ROTATION 8", "ROTATION 9", "ROTATION 10", "ROTATION 11"]

def whichcolumn(l, x, y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
	if y == B #if the last column has been processed
		#puts "tracer 1"
		l +=1
		x = 0
		y = 0
		allocation(l, x, y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
	else
		#puts "tracer 2"
		allocation(l, x, y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
	end
end

def allocation(l,x,y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
	#puts "---------------------------------------------------------------"
	#puts "tracer 3"
	#puts "Testing pref l is #{l}"
	#puts "x is #{x} and y is #{y}"
	#puts "prefs for [x][y] = #{prefs[x][y]}"
	#puts "#{terms[y]} has been allocated #{howmanytimes[y]} times."
	#puts "#{trainees[x]} has been allocated #{howmanyterms[x]} terms."
	if l <= B
		#puts "tracer 4"
		if x < A
			#puts "tracer 5"
			if howmanytimes[y] < C
				#puts "tracer 6"
				if howmanyterms[x] < C
					if prefs[x][y] == l
						#puts "tracer 7"
						howmanytimes[y] +=1
						howmanyterms[x] +=1
						results[x][y] = 1
						puts "#{trainees[x]} has been allocated #{terms[y]}\n"
						#puts "#{terms[y]} has been allocated #{howmanytimes[y]} times."
						#puts "#{trainees[x]} has been allocated #{howmanyterms[x]} terms."
						if howmanytimes[y] == C
							#puts "tracer 8"
							y += 1
							x = 0
							whichcolumn(l,x,y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
						else
							#puts "tracer 9"
							if x == A-1 #end of column test
								#puts "tracer 10"
								if y == B-1
									#puts "tracer 11"
									puts "------------------------------------------------------------"
									puts "You have finished allocating."
									finish(l,x,y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
								else
								#puts "tracer 12"
								y +=1 
								x = 0 
								whichcolumn(l,x,y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
								end
							else
								#puts "tracer 13"
								x +=1
								allocation(l,x,y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
							end
						end
					else
						if x == A-1 #end of column test
						#puts "tracer 14"
							if y == B-1
								#puts "tracer 15"
								puts "You have finished allocating preference #{l}."
								puts "------------------------------------------------------------"
								puts ""
								y = B
								whichcolumn(l,x,y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
							else
								#puts "tracer 16"
								y +=1 
								x = 0 
								whichcolumn(l,x,y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
							end
						else
							#puts "tracer 17"
							x +=1
							allocation(l,x,y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
						end
					end
				else
					#advance to next column
					#puts "tracer 18"
					x += 1
					whichcolumn(l,x,y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
				end
			else
				#advance to next column
				#puts "tracer 19"
				x = 0
				y +=1
				whichcolumn(l,x,y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
			end
		else
			#puts "tracer 20"
			if y == B-1
				#puts "tracer 21"
				puts "------------------------------------------------------------"
				puts "You have finished allocating."
				finish(l,x,y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
			else
				#puts "tracer 22"
				y +=1 
				x = 0 
				whichcolumn(l,x,y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
			end
		end
	else
		#puts "tracer 23"
		puts "------------------------------------------------------------"
		puts "You have finished allocating everything, bye!"
		exit()
	end
end


def start(l, x, y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
puts ""
puts "-----------------------------------------------------"
puts ""
puts "           Term Allocations for 2013" # Change to whatever title you want
puts ""
puts "-----------------------------------------------------"
whichcolumn(l, x, y, trainees, terms, prefs, results, howmanytimes, howmanyterms)
end

start(l, x, y, trainees, terms, prefs, results, howmanytimes, howmanyterms)