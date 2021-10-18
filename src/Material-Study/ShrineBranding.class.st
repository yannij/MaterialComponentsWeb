Class {
	#name : #ShrineBranding,
	#superclass : #MDSComponent,
	#category : #'Material-Study-Shrine'
}

{ #category : #accessing }
ShrineBranding >> isSelected [

	^ self selected
]

{ #category : #accessing }
ShrineBranding >> list [

	^ false
]

{ #category : #accessing }
ShrineBranding >> list: ignored [
]

{ #category : #rendering }
ShrineBranding >> renderContentOn: html [

	html div "mdcListItem;" style: 'text-align: center; margin-bottom: 48px'; with: [
		self renderLogoOn: html.
		self renderTitleOn: html ]
]

{ #category : #rendering }
ShrineBranding >> renderLogoOn: html [

	html html: (ShrineApp shrineSvg: 'shrine-logo-drawer')
]

{ #category : #rendering }
ShrineBranding >> renderTitleOn: html [

	html heading
		level1;
		class: 'shrine-title';
		mdcTypography_headline6;
		with: 'SHRINE'
]

{ #category : #accessing }
ShrineBranding >> selected [

	^ false
]

{ #category : #accessing }
ShrineBranding >> selected: ignored [
]
