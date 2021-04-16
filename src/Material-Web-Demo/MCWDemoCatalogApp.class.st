Class {
	#name : #MCWDemoCatalogApp,
	#superclass : #MCWResponsiveApplication,
	#instVars : [
		'catalogCanvas'
	],
	#category : #'Material-Web-Demo'
}

{ #category : #initialization }
MCWDemoCatalogApp class >> applicationPath [

	^ 'material/catalog'

]

{ #category : #'class initialization' }
MCWDemoCatalogApp class >> initialize [
	"Register path with Seaside.
	WAAdmin unregister: self applicationPath.
	"

	^ self registerMaterialWebDeployment: self applicationPath

]

{ #category : #initialization }
MCWDemoCatalogApp >> appBarTitle [

	^ 'MDC Seaside'
]

{ #category : #accessing }
MCWDemoCatalogApp >> applicationTitle [

	^ 'Material Design Catalog'
]

{ #category : #initialization }
MCWDemoCatalogApp >> buildMainFab [

	^ nil
]

{ #category : #initialization }
MCWDemoCatalogApp >> buildSideNavList [
	| navList |

	navList := MCWListBasic new.
	navList addListItem: (MCWListItemIcon itemText: 'Home' callback: [ self catalogCanvas pageName: #home ]).
	self catalogCanvas catalogList do: [ :eachItem |
		navList addListItem: (MCWListItemIcon
				itemText: eachItem second
				callback: [ self catalogCanvas pageName: eachItem first asSymbol ]) ].
	^ navList
]

{ #category : #accessing }
MCWDemoCatalogApp >> catalogCanvas [
	^ catalogCanvas
]

{ #category : #accessing }
MCWDemoCatalogApp >> catalogCanvas: anObject [
	catalogCanvas := anObject
]

{ #category : #initialization }
MCWDemoCatalogApp >> initialize [

	"Side nav initialization needs the catalog list from the catalog canvas,
	so this must be set before the initialize is invoked"
	self catalogCanvas: MCWDemoCatalogCanvas new.

	super initialize.
	self layout topAppBar toolbarTitle: (MCWDemoCatalogTopAppBarTtile titled: self appBarTitle).
	self layout contentArea component: self catalogCanvas.

]

{ #category : #updating }
MCWDemoCatalogApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot stylesheet url: (MCWDemoCatalogLibrary urlOf: #appCss).
	anHtmlRoot stylesheet url: (MCWDemoCatalogLibrary urlOf: #buttonCatalogCss).

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.

]
