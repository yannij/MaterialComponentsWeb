Class {
	#name : #RallyView,
	#superclass : #WAComponent,
	#category : #'Material-Study-Rally'
}

{ #category : #rendering }
RallyView >> goto: aModel [

	self mdqApplicationGet bodyRegion component: (aModel asComponent addValidatedForm; yourself)
]

{ #category : #rendering }
RallyView >> instanceList [

	self subclassResponsibility
]

{ #category : #rendering }
RallyView >> renderAsCard: aModel with: params on: html [

	html div mdcCard; with: [
		html div mdcCard__primaryAction; tabIndex: 0;
			onClick: ((html jQuery ajax)
				callback: [ self goto: aModel ];
				onComplete: html javascript refresh);
			with: [
				params first ifNotNil: [ :value |
					html heading level2; mdcTypography_headline6; with: value ].
				params second ifNotNil: [ :value |
					html div mdcTypography_body2;  style: 'padding: 0 8px 4px 8px'; with: value ] ] ]
]

{ #category : #rendering }
RallyView >> renderAsCards: aList on: html [

	html div mdcLayoutGrid; "style: 'padding-left: 0px; padding-right: 0px';" with: [
		html div mdcLayoutGrid__inner; with: [
			aList do: [ :eachInstance |
				html div mdcLayoutGrid__cell_span2;
					with: [ self renderAsCard: eachInstance with: eachInstance cardParameters on: html ] ] ] ]
]

{ #category : #rendering }
RallyView >> renderAsList: aList on: html [

	html unorderedList mdcDeprecatedList; mdcDeprecatedList_twoLine; with: [
		aList do: [ :eachInstance |
			self renderAsListItem: eachInstance on: html ] ]
]

{ #category : #rendering }
RallyView >> renderAsListItem: aModel on: html [

	self
		renderAsListItem: aModel
		with: aModel listItemParameters
		on: html
]

{ #category : #rendering }
RallyView >> renderAsListItem: aModel with: params on: html [

	html listItem
		mdcDeprecatedListItem;
		onClick: ((html jQuery ajax)
			callback: [ self goto: aModel ];
			onComplete: html javascript refresh);
		with: [
			html div mdcDeprecatedListItem__text; with: [
				html span mdcListItem__primaryText; style: 'font-family: Eczar'; with: params first.
				html span mdcListItem__secondaryText; style: 'font-family: Eczar'; with: params second ].
			params size >= 3 ifTrue: [
				html span
					mdcListItem__secondaryText;
					mdcTypography_headline4;
					style: 'padding: 0 16px 0 16px;text-align: right;width: 400px;font-family: Eczar';
					with: params third ].
			params size >= 4 ifTrue: [
				html span mdcDeprecatedListItem__meta; with: [
					html span mdcMaterialIcons; mdcIconButton__icon; with: params fourth ] ] ]
]

{ #category : #rendering }
RallyView >> renderContentOn: html [

	self renderInstancesOn: html
]

{ #category : #rendering }
RallyView >> renderInstancesOn: html [

	self renderAsList: self instanceList on: html
]
