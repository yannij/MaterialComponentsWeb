Class {
	#name : #MCWColorTheme,
	#superclass : #MCWModel,
	#instVars : [
		'themeItems'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #'accessing-magritte' }
MCWColorTheme >> backgroundDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #background));
		default: (self themeItemAt: 'background');
		label: 'Background';
		priority: 140;
		yourself
]

{ #category : #accessing }
MCWColorTheme >> colorThemeDefault [
	"
TODO:
--mdc-theme-text-<TEXT_STYLE>-on-light
--mdc-theme-text-<TEXT_STYLE>-on-dark
--mdc-theme-text-<TEXT_STYLE>-on-background
where:
	TEXT_STYLE = { primary secondary hint disabled icon }
	"

	^ #(
(#'primary' '#6200ee')
(#'on-primary' '#ffffff')
(#'secondary' '#03dac6')
(#'on-secondary' '000000')
(#'surface' '#ffffff')
(#'on-surface' '#000000')
(#'error' '#b00020')
(#'on-error' '#ffffff')
(#'background' '#ffffff')
	)
]

{ #category : #accessing }
MCWColorTheme >> colorThemeMCWSeaside [
	"
TODO:
--mdc-theme-text-<TEXT_STYLE>-on-light
--mdc-theme-text-<TEXT_STYLE>-on-dark
--mdc-theme-text-<TEXT_STYLE>-on-background
where:
	TEXT_STYLE = { primary secondary hint disabled icon }
	"

	^ #(
(#'primary' '#00695C')
(#'on-primary' '#ffffff')
(#'secondary' '#EF6C00')
(#'on-secondary' '000000')
(#'surface' '#E0F2F1')
(#'on-surface' '#000000')
(#'error' '#b00020')
(#'on-error' '#ffffff')
(#'background' '#ffffff')
	)
]

{ #category : #initialization }
MCWColorTheme >> initialize [

	super initialize.

	self themeItemsSetDefault

]

{ #category : #'accessing-magritte' }
MCWColorTheme >> onPrimaryDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #'on-primary'));
		default: (self themeItemAt: 'on-primary');
		label: 'On Primary';
		priority: 105;
		yourself
]

{ #category : #'accessing-magritte' }
MCWColorTheme >> onSecondaryDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #'on-secondary'));
		default: (self themeItemAt: 'on-secondary');
		label: 'On Secondary';
		priority: 115;
		yourself
]

{ #category : #'accessing-magritte' }
MCWColorTheme >> onSurfaceDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #'on-surface'));
		default: (self themeItemAt: 'on-surface');
		label: 'On Surface';
		priority: 135;
		yourself
]

{ #category : #'accessing-magritte' }
MCWColorTheme >> primaryDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #primary));
		default: (self themeItemAt: 'primary');
		label: 'Primary';
		priority: 100;
		yourself
]

{ #category : #'accessing-magritte' }
MCWColorTheme >> secondaryDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #secondary));
		default: (self themeItemAt: 'secondary');
		label: 'Secondary';
		priority: 110;
		yourself
]

{ #category : #'accessing-magritte' }
MCWColorTheme >> surfaceDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #surface));
		default: (self themeItemAt: 'surface');
		label: 'Surface';
		priority: 130;
		yourself
]

{ #category : #accessing }
MCWColorTheme >> themeItemAt: aKey [

	^ self themeItemAt: aKey ifAbsent: [ Color fromHexString: '888888' ]
]

{ #category : #accessing }
MCWColorTheme >> themeItemAt: aKey ifAbsent: aBlock [

	^ self themeItems at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
MCWColorTheme >> themeItems [
	^ themeItems
]

{ #category : #accessing }
MCWColorTheme >> themeItems: anObject [
	themeItems := anObject
]

{ #category : #accessing }
MCWColorTheme >> themeItemsSet: aThemeItemList [

	self themeItems: OrderedIdentityDictionary new.

	aThemeItemList do: [ :each |
		self themeItems at: each first put: (Color fromHexString: each second) ]
]

{ #category : #accessing }
MCWColorTheme >> themeItemsSetDefault [

	self themeItemsSet: self colorThemeMCWSeaside
]
