-- last_by_one.hs
-- returns the element before the last in a list
-- the following function cannot handle [] (empty list)

myLast xs =
	if length xs <= 2
		then head xs
	else
		myLast (tail xs)