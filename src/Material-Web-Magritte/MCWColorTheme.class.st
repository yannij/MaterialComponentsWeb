Class {
	#name : #MCWColorTheme,
	#superclass : #MCWModel,
	#instVars : [
		'themeItems'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #'accessing-magritte' }
MCWColorTheme >> backgroundDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #background));
		default: (Color fromHexString: 'ffffff');
		label: 'Background';
		priority: 140;
		yourself
]

{ #category : #initialization }
MCWColorTheme >> buildThemeItems [

	#(
('primary' '6200ee')
"('on-primary' '#757de8')"
('secondary' '018786')
"('on-secondary' '#018786')"
"('surface' '#ffffff')"
"('on-surface' '#ff6090')"
"('background' '#ffffff')"
	) do: [ :each |
		self themeItems at: each first put: (Color fromHexString: each second) ]
]

{ #category : #initialization }
MCWColorTheme >> initialize [

	super initialize.

	self themeItems: OrderedIdentityDictionary new.
	"self buildThemeItems"

]

{ #category : #'accessing-magritte' }
MCWColorTheme >> onPrimaryDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #'on-primary'));
		default: (Color fromHexString: 'ffffff');
		label: 'On Primary';
		priority: 105;
		yourself
]

{ #category : #'accessing-magritte' }
MCWColorTheme >> onSecondaryDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #'on-secondary'));
		default: (Color fromHexString: 'ffffff');
		label: 'On Secondary';
		priority: 115;
		yourself
]

{ #category : #'accessing-magritte' }
MCWColorTheme >> onSurfaceDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #'on-surface'));
		default: (Color fromHexString: 'ff6090');
		label: 'On Surface';
		priority: 135;
		yourself
]

{ #category : #'accessing-magritte' }
MCWColorTheme >> primaryDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #primary));
		default: (Color fromHexString: '6200ee');
		label: 'Primary';
		priority: 100;
		yourself
]

{ #category : #'accessing-magritte' }
MCWColorTheme >> secondaryDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #secondary));
		default: (Color fromHexString: '018786');
		label: 'Secondary';
		priority: 110;
		yourself
]

{ #category : #'accessing-magritte' }
MCWColorTheme >> surfaceDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #surface));
		default: (Color fromHexString: 'ffffff');
		label: 'Surface';
		priority: 130;
		yourself
]

{ #category : #accessing }
MCWColorTheme >> themeItems [
	^ themeItems
]

{ #category : #accessing }
MCWColorTheme >> themeItems: anObject [
	themeItems := anObject
]
