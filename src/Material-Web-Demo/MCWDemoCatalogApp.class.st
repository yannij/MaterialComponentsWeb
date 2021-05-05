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

	^ self mcwRegisterDeployment: self applicationPath

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
MCWDemoCatalogApp >> initializeLayout [

	self materialVersionDefault.

	"Side nav initialization needs the catalog list from the catalog canvas,
	so this must be set before the initialize is invoked"
	self catalogCanvas: MCWDemoCatalogCanvas new.

	self settings: self buildApplicationSettings.
	self layout: self buildLayout.
	self beLayoutStructureDesktop.

	self layout topAppBar appBarTitle: self applicationTitle.
	self layout contentArea component: self catalogCanvas.
]

{ #category : #rendering }
MCWDemoCatalogApp >> renderTopAppBarTitleOn: html [

	html span mdcTopAppBar__title; class: 'catalog-top-app-bar__title'; with: [
		html span class: 'catalog-top-app-bar__title--small-screen'; with: 'MDC Seaside'.
		html span class: 'catalog-top-app-bar__title--large-screen'; with: 'Material Components for Seaside' ]
]

{ #category : #updating }
MCWDemoCatalogApp >> updateRoot: anHtmlRoot [

	super updateRoot: anHtmlRoot.

	anHtmlRoot stylesheet url: (MCWDemoCatalogLibrary urlOf: #appCss).
	anHtmlRoot stylesheet url: (MCWDemoCatalogLibrary urlOf: #buttonCatalogCss).

	anHtmlRoot bodyAttributes addClass: 'mdc-typography'.

]
