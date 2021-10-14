Class {
	#name : #MDSListItemSeparator,
	#superclass : #MDSComponent,
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSListItemSeparator >> isSelected [

	^ self selected
]

{ #category : #accessing }
MDSListItemSeparator >> list [

	^ false
]

{ #category : #accessing }
MDSListItemSeparator >> list: ignored [
]

{ #category : #rendering }
MDSListItemSeparator >> renderContentOn: html [

	html listItem
		mdcDeprecatedListDivider;
		"mdcListDivider_inset;"
		mdcRole: 'separator';
		yourself

]

{ #category : #accessing }
MDSListItemSeparator >> selected [

	^ false
]

{ #category : #accessing }
MDSListItemSeparator >> selected: ignored [
]
