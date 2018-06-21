instance creation
familyName: aFamilyName genericFamily: aGenericFamily

	^self new
		googleFontsFamily: (aFamilyName collect: [:ch | (ch = $ ) ifTrue: [$ ] ifFalse: [ch]]);
		familyName: aFamilyName;
		genericFamily: aGenericFamily;
		yourself