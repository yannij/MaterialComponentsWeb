rendering
renderSetGoogleFont: aGoogleFont on: html

	html script with: 
		'document.querySelector("body").style.setProperty("--mdc-typography-font-family"'
		, ', "''', aGoogleFont familyName, ''', ', aGoogleFont genericFamily, '")'