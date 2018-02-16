this project combines the calendar and the scheduler.   I use the calendar to figure out who is available for which shifts and calculate the total time or points that should be associated to each shift.

it's cool but silly.


To use it, import the 'Calendar.ergo' file  

query: eachPersonShiftCombo(?eachPersonShift).

should give you a list of all the shifts to each person in the 'Caleder.ergo' file.   Only 3 or 4 shifts work before we run out of memory.