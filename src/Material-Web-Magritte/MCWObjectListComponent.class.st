Class {
	#name : #MCWObjectListComponent,
	#superclass : #MAOneToManyComponent,
	#instVars : [
		'onClickBlock',
		'listStyle'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #initialization }
MCWObjectListComponent >> initialize [

	super initialize.

	self onClickBlock: [ :value | ].
	self listStyle: #singleLine
]

{ #category : #accessing }
MCWObjectListComponent >> listStyle [
	^ listStyle
]

{ #category : #accessing }
MCWObjectListComponent >> listStyle: anObject [
	listStyle := anObject
]

{ #category : #accessing }
MCWObjectListComponent >> onClickBlock [
	^ onClickBlock
]

{ #category : #accessing }
MCWObjectListComponent >> onClickBlock: anObject [
	onClickBlock := anObject
]

{ #category : #rendering }
MCWObjectListComponent >> renderListOn: html [

	self listStyle = #singleLine
		ifTrue: [ self renderListSingleLineAjaxOn: html ]
		ifFalse: [ self renderListTwoLineAjaxOn: html ]
]

{ #category : #rendering }
MCWObjectListComponent >> renderListSingleLineAjaxOn: html [

	html unorderedList
		mdcList;
		mdcList_dense;
		style: 'min-width: 200px';
		with: [
			self value do: [ :eachItem |
				html listItem
					mdcListItem;
					with: [
						html span
							mdcListItem__text;
							onClick: ((html jQuery ajax)
								callback: [ self onClickBlock value: eachItem ];
								onComplete: html javascript refresh);
							with: [
								html text: eachItem mdPrimaryString ] ] ] ]
]

{ #category : #rendering }
MCWObjectListComponent >> renderListTwoLineAjaxOn: html [

	html unorderedList
		mdcList;
		mdcList_dense;
		mdcList_twoLine;
		"style: 'border: 1px solid rgba(0, 0, 0, 0.1);';"
		with: [
			self value do: [ :eachItem |
				html listItem
					mdcListItem;
					with: [
						html span
							mdcListItem__text;
							onClick: ((html jQuery ajax)
								callback: [ self onClickBlock value: eachItem ];
								onComplete: html javascript refresh);
							with: [
								html text: eachItem mdPrimaryString.
								html span
									mdcListItem__secondaryText;
									with: [ html text: eachItem mdSecondaryString ] ].
						"html span mdcListItem__meta; with: [
							html span mdcMaterialIcons; mdcAriaHidden: 'true'; with: 'more_vert']"
						] ] ]
]

{ #category : #'rendering-tools' }
MCWObjectListComponent >> renderSelectListOn: html [
]

{ #category : #rendering }
MCWObjectListComponent >> renderViewerOn: html [
	| listId |

	listId := html nextId.

	html div
		mdcListGroup;
		"style: 'border: 1px solid rgba(0, 0, 0, 0.1);';"
		"style: 'width: 400px';"
		with: [
			html heading level3; mdcListGroup__subheader; with: [
				html text: self magritteDescription label ].
			html div mdcListDivider; mdcRole: 'separator'.
			html div id: listId; with: [ self renderListOn: html ] ]
]
