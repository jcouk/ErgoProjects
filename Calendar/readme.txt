/* 	
	Given the object Day, Month and Year, determine Day.
	Query: dayOfWeekCalcObj(?X, '08', October, 2017).
	
	for all values:
	dayOfWeekCalcObj(?dayOfWeek, ?dayNum, ?month, ?year)
	
	I have variables defined to limit the start and end date of time time frame we care about.  This will limit which dates you ask ask about.
	
	I was inspired to make these rules because of this podcast from reply all - https://www.gimletmedia.com/reply-all/104-case-phantom-caller
	
	I thought a service, or rulesengine that determines simple things like the day of the week, and whether or not it's a holiday might be useful in the future.
	I think ultimately there are way better ways of getting at this data - but it was a fun and pretty cool project anyway.  
	
	I applied these rules to a the scheduler app in the same repo, but again it's easier to use the /duration basetype to accomplish the same thing.
*/