Class {
	#name : #MDSMenuList,
	#superclass : #MDSComponent,
	#instVars : [
		'subheader',
		'listItems'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MDSMenuList >> closeScript [

	^ 'element = document.getElementById(''', self id, '''); element.MDCMenu.open = false'
]

{ #category : #hack }
MDSMenuList >> iconName [

	^ nil
]

{ #category : #initialization }
MDSMenuList >> initialize [

	super initialize.

	self listItems: OrderedCollection new
]

{ #category : #accessing }
MDSMenuList >> itemsAdd: aListItem [

	self listItems add: aListItem
]

{ #category : #accessing }
MDSMenuList >> itemsAddAll: aCollection [

	aCollection do: [ :eachItem | self itemsAdd: eachItem ]
]

{ #category : #accessing }
MDSMenuList >> listItems [
	^ listItems
]

{ #category : #accessing }
MDSMenuList >> listItems: anObject [
	listItems := anObject
]

{ #category : #rendering }
MDSMenuList >> listTagOn: html [

	self error: 'Not used'

]

{ #category : #rendering }
MDSMenuList >> openScript [

	^ 'element = document.getElementById(''', self id, '''); element.MDCMenu.open = !element.MDCMenu.open'
]

{ #category : #rendering }
MDSMenuList >> renderContentOn: html [

	html div
		mdcMenuSurface_anchor;
		with: [
			html div
				mdcMenu;
				class: 'mdc-menu-surface';
				id: self id;
				mdcAutoInit: 'MDCMenu';
				with:  [ self renderMenuItemsOn: html ] ]
]

{ #category : #rendering }
MDSMenuList >> renderMenuItemsOn: html [

	html unorderedList
		mdcDeprecatedList;
		mdcList_dense_if: self mcwDenseView;
		mdcRole: 'menu';
		attributeAt: 'aria-hidden' put: 'true';
		with: [
			self listItems do: [ :eachMenuItem | html render: eachMenuItem ] ].

]

{ #category : #accessing }
MDSMenuList >> subheader [
	^ subheader
]

{ #category : #accessing }
MDSMenuList >> subheader: anObject [
	subheader := anObject
]
