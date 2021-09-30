Class {
	#name : #MCWObjectListAnchorComponent,
	#superclass : #MCWObjectListComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWObjectListAnchorComponent >> renderListAnchorOn: html [

	html unorderedList
		mdcDeprecatedList;
		mdcDeprecatedList_dense;
		style: 'min-width: 200px';
		with: [
			self value do: [ :eachItem |
				html listItem
					with: [
						html anchor
							mdcDeprecatedListItem;
							callback: [ self onClickBlock value: eachItem ];
							with: [
								html text: eachItem mdPrimaryString ] ] ] ]
]

{ #category : #rendering }
MCWObjectListAnchorComponent >> renderListOn: html [

	self renderListAnchorOn: html
]
