note
	description: "Summary description for {LIBRARY_SPEC}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LIBRARY_SPEC

feature
	holding_available_books (b: BOOK; p1, p2: PATRON; l: LIBRARY)
		require
			b.is_available
			p1 /= p2
			l.has_patron (p1)
			l.has_patron (p2)
		do
			l.place_book_on_hold (b, p1)
			l.place_book_on_hold (b, p2)
		ensure
			l.book_is_on_hold (b, p1)
			not l.book_is_on_hold (b, p2)
		end

end
