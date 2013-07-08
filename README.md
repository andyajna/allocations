allocations
===========
I built this ruby algorithm to allocate people into groups/teams/terms/rotations based on their preferences.
I use it at work - it will save about 1 weeks' work for us when we allocate about 100 trainees to rotations.

For example, I have 10 people to allocate to four teams. There are ten teams to choose from (or 9 or whatever).
They each rank their team preferences 1 to 10 (up to how many teams there are).
It will allocate people to give the lowest average preference ranking for everybody.
ie Given everybody's preferences, the allocations will be the most preferred for everyone.

It is based on the Hungarian combinatorial algorithm (https://en.wikipedia.org/wiki/Hungarian_algorithm).

To use:
Run as a ruby fle from the command line. Results will STOUT on the terminal - just print from there to pdf.
Feel free to use the logic in a rails project - I might one day. If you do, let me know as I'm curious how to do it.

Andrew Kemp: GitHub = andyajna, 2013

Instructions:
Set constant 'A' to the number of trainees / people
For 'A' people, make sure there are 'A' zeros in the howmanyterms array
Replace 'Trainee x' with the trainees names - there should be A elements in the trainees array
Set constant 'B' to the number of rotations available
For 'B' rotations, make sure there are 'B' zeros in the howmanytimes array
Replace 'Rotation x' with the rotation names - there should be B elements in the trainees array
Input trainee's preferences in the prefs array. The first block is for trainee 1. 
Each element is that trainee's preference for the corresponding rotation

Tracers are commented out - if you find a bug, uncomment to run, 
and follow the STOUT to find what the algorithm is doing

Contact me if you have any questions / comments etc.
