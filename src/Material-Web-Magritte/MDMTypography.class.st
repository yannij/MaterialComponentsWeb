Class {
	#name : #MDMTypography,
	#superclass : #MDMModel,
	#instVars : [
		'fontFamily',
		'fontFamilies'
	],
	#classVars : [
		'AvailableFonts'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #accessing }
MDMTypography class >> availableFonts [

	AvailableFonts ifNil: [
		| list |
		list := DockerDeploy current configsAt: 'google-fonts' atKey: 'fonts'.
		list ifNil: [
			list := (WAJsonParser parse: self defaultGoogleFontsJson) at: 'fonts' ].
		AvailableFonts := list collect: [ :each | each first ] ].

	^ AvailableFonts
]

{ #category : #accessing }
MDMTypography class >> availableFontsClear [

	AvailableFonts := nil
]

{ #category : #accessing }
MDMTypography class >> defaultGoogleFontsJson [

	^ '
{
"fonts": [
	["Acme", "sans-serif" ],
	["Asap", "sans-serif" ],
	["Dancing Script", "handwriting" ],
	["Karma", "serif" ],
	["Newsreader", "serif" ],
	["Noto Sans", "sans-serif" ],
	["Noto Serif", "serif" ],
	["Noto Sans JP", "sans-serif" ],
	["Noto Serif JP", "serif" ],
	["Noto Sans KR", "sans-serif" ],
	["Noto Serif KR", "serif" ],
	["Noto Sans SC", "sans-serif" ],
	["Noto Serif SC", "serif" ],
	["Noto Sans TC", "sans-serif" ],
	["Noto Serif TC", "serif" ],
	["Roboto", "sans-serif" ],
	["Roboto Condensed", "sans-serif" ],
	["Roboto Mono", "monospace" ],
	["Roboto Slab", "serif" ],
	["Sansita", "sans-serif" ],
	["Sansita Swashed", "display" ],
	["Ubuntu", "sans-serif" ],
	["Ubuntu Condensed", "sans-serif" ],
	["Ubuntu Mono", "monospace" ],
	["Zhi Mang Xing", "handwriting" ] ]
}'
]

{ #category : #accessing }
MDMTypography class >> fontFamilyDefault [

	^ 'Roboto'
]

{ #category : #accessing }
MDMTypography >> fontFamilies [
	^ fontFamilies
]

{ #category : #accessing }
MDMTypography >> fontFamilies: anObject [
	fontFamilies := anObject
]

{ #category : #accessing }
MDMTypography >> fontFamiliesAdd: aFontFamilyName [

	self fontFamilies add: aFontFamilyName
]

{ #category : #accessing }
MDMTypography >> fontFamily [
	^ fontFamily
]

{ #category : #accessing }
MDMTypography >> fontFamily: anObject [
	fontFamily := anObject
]

{ #category : #'accessing - magritte' }
MDMTypography >> fontFamilyDescription [
	<magritteDescription>

	^ MASingleOptionDescription new
		accessor: #fontFamily;
		default: '';
		label: 'FontFamily';
		cssClass: 'mcw-textfield';
		options: self class availableFonts;
		priority: 10;
		yourself
]

{ #category : #initialization }
MDMTypography >> initialize [

	super initialize.

	self fontFamily: self class fontFamilyDefault.
	self fontFamilies: OrderedCollection new
]
