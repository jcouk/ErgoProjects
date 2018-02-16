the goal here was to create a rulebase that can determine the optimal combinatinos of shifts to workers.  
It's all kind of a mess right now because I was trying to understand and ideally fix the issue of running out of memory during processing.

It does some cool stuff like find all valid combinations of shifts to each person, but when it comes to all combinations valid shifts to a person in combination with all other persons where each shift is unique..  it blows up.  Deep down i know i can do better.

To use it, import the 'Main.ergo' file    Most of the real logic is in 'Employee.ergo'

query: identifyScore(?scoreShift).

should give you a list of all the shifts to each person in the 'Caleder.ergo' file.   Only 4 or 5 shifts work before we run out of memory.