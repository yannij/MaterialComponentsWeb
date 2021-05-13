Class {
	#name : #MCWListItemSeparator,
	#superclass : #MCWListItemComponent,
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MCWListItemSeparator >> renderContentOn: html [

	html listItem
		mdcListDivider;
		"mdcListDivider_inset;"
		mdcRole: 'separator';
		yourself

]

{ #category : #accessing }
MCWListItemSeparator >> selected [

	^ false
]

{ #category : #accessing }
MCWListItemSeparator >> selected: ignored [
]
