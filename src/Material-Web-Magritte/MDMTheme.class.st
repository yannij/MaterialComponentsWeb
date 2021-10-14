Class {
	#name : #MDMTheme,
	#superclass : #MDMModel,
	#instVars : [
		'themeItems'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #'accessing-magritte' }
MDMTheme >> backgroundDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #background));
		default: (self themeItemAt: #'background');
		label: 'Background';
		priority: 140;
		yourself
]

{ #category : #accessing }
MDMTheme >> colorThemeDefault [
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
MDMTheme >> colorThemeMCWSeaside [
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
MDMTheme >> initialize [

	super initialize.

	self themeItemsSetDefault

]

{ #category : #'accessing-magritte' }
MDMTheme >> onPrimaryDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #'on-primary'));
		default: (self themeItemAt: #'on-primary');
		label: 'On Primary';
		priority: 105;
		yourself
]

{ #category : #'accessing-magritte' }
MDMTheme >> onSecondaryDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #'on-secondary'));
		default: (self themeItemAt: #'on-secondary');
		label: 'On Secondary';
		priority: 115;
		yourself
]

{ #category : #'accessing-magritte' }
MDMTheme >> onSurfaceDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #'on-surface'));
		default: (self themeItemAt: #'on-surface');
		label: 'On Surface';
		priority: 135;
		yourself
]

{ #category : #'accessing-magritte' }
MDMTheme >> primaryDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #primary));
		default: (self themeItemAt: #'primary');
		label: 'Primary';
		priority: 100;
		yourself
]

{ #category : #'accessing-magritte' }
MDMTheme >> secondaryDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #secondary));
		default: (self themeItemAt: #'secondary');
		label: 'Secondary';
		priority: 110;
		yourself
]

{ #category : #'accessing-magritte' }
MDMTheme >> surfaceDescription [
	<magritteDescription>

	^ MAColorDescription new
		accessor: ((MAChainAccessor on: #themeItems) accessor: (MADictionaryAccessor key: #surface));
		default: (self themeItemAt: #'surface');
		label: 'Surface';
		priority: 130;
		yourself
]

{ #category : #accessing }
MDMTheme >> themeItemAt: aKey [

	^ self themeItemAt: aKey ifAbsent: [ Color fromHexString: '888888' ]
]

{ #category : #accessing }
MDMTheme >> themeItemAt: aKey ifAbsent: aBlock [

	^ self themeItems at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
MDMTheme >> themeItems [
	^ themeItems
]

{ #category : #accessing }
MDMTheme >> themeItems: anObject [
	themeItems := anObject
]

{ #category : #accessing }
MDMTheme >> themeItemsSet: aThemeItemList [

	self themeItems: OrderedIdentityDictionary new.

	aThemeItemList do: [ :each |
		self themeItems at: each first put: (Color fromHexString: each second) ]
]

{ #category : #accessing }
MDMTheme >> themeItemsSetDefault [

	self themeItemsSet: self colorThemeMCWSeaside
]
