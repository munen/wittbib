// This functions takes a string containing
// an ISBN (ISBN-10 or ISBN-13) and returns
// true if it's valid or false if it's invalid.
function validateISBN(isbn) {
	if(isbn.match(/[^0-9xX\.\-\s]/)) {
		return false;
	}

	isbn = isbn.replace(/[^0-9xX]/g,'');

	if(isbn.length != 10 && isbn.length != 13) {
		return false;
	}
		
		checkDigit = 0;
	if(isbn.length == 10) {
		checkDigit = 11 - ( (
								 10 * isbn.charAt(0) +
								 9  * isbn.charAt(1) +
								 8  * isbn.charAt(2) +
								 7  * isbn.charAt(3) +
								 6  * isbn.charAt(4) +
								 5  * isbn.charAt(5) +
								 4  * isbn.charAt(6) +
								 3  * isbn.charAt(7) +
								 2  * isbn.charAt(8)
								) % 11);
						 
		if(checkDigit == 10) {
			return (isbn.charAt(9) == 'x' || isbn.charAt(9) == 'X') ? true : false;
		} else {
			return (isbn.charAt(9) == checkDigit ? true : false);
		}
	} else {
		checkDigit = 10 -  ((
								 1 * isbn.charAt(0) +
								 3 * isbn.charAt(1) +
								 1 * isbn.charAt(2) +
								 3 * isbn.charAt(3) +
								 1 * isbn.charAt(4) +
								 3 * isbn.charAt(5) +
								 1 * isbn.charAt(6) +
								 3 * isbn.charAt(7) +
								 1 * isbn.charAt(8) +
								 3 * isbn.charAt(9) +
								 1 * isbn.charAt(10) +
								 3 * isbn.charAt(11)
								) % 10);
						 
		if(checkDigit == 10) {
			return (isbn.charAt(12) == 0 ? true : false) ;
		} else {
			return (isbn.charAt(12) == checkDigit ? true : false);
		}
	}
}
