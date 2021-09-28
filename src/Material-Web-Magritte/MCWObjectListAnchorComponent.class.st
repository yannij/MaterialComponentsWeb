Class {
	#name : #MCWObjectListAnchorComponent,
	#superclass : #MCWObjectListComponent,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWObjectListAnchorComponent >> renderListAnchorOn: html [

	html unorderedList
		mdcList;
		mdcDeprecatedList_dense;
		style: 'min-width: 200px';
		with: [
			self value do: [ :eachItem |
				html listItem
					with: [
						html anchor
							mdcListItem;
							callback: [ self onClickBlock value: eachItem ];
							with: [
								html text: eachItem mdPrimaryString ] ] ] ]
]

{ #category : #rendering }
MCWObjectListAnchorComponent >> renderListOn: html [

	self renderListAnchorOn: html
]
