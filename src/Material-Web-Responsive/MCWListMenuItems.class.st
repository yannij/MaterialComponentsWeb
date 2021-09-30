Class {
	#name : #MCWListMenuItems,
	#superclass : #MCWList,
	#category : #'Material-Web-Responsive'
}

{ #category : #hack }
MCWListMenuItems >> iconName [

	^ nil
]

{ #category : #rendering }
MCWListMenuItems >> listTagOn: html [

	self error: 'Not used'

]

{ #category : #rendering }
MCWListMenuItems >> renderContentOn: html [

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
MCWListMenuItems >> renderMenuItemsOn: html [

	html unorderedList
		mdcDeprecatedList;
		mdcList_dense_if: self mcwDenseView;
		mdcRole: 'menu';
		attributeAt: 'aria-hidden' put: 'true';
		with: [
			self listItems do: [ :eachMenuItem | html render: eachMenuItem ] ].

]
