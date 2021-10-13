Class {
	#name : #MDSComponentDemoPage,
	#superclass : #WAComponent,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSComponentDemoPage >> pageInfo [

	self subclassResponsibility
]

{ #category : #rendering }
MDSComponentDemoPage >> renderContentOn: html [
	| pageInfo |

	pageInfo := self pageInfo.

	self renderHeadline: pageInfo first summary: pageInfo second on: html.
	self renderHeroSectionOn: html.
	self renderResources: pageInfo on: html.
	self renderDemoSectionOn: html
]

{ #category : #rendering }
MDSComponentDemoPage >> renderDemoSectionOn: html [

	html heading level2; class: 'demo-title'; mdcTypography_headline6; with: 'Demos'.
	html div with: [ self renderDemosOn: html ]
]

{ #category : #rendering }
MDSComponentDemoPage >> renderDemosOn: html [

	self subclassResponsibility
]

{ #category : #rendering }
MDSComponentDemoPage >> renderHeadline: aHeadline summary: aSummary on: html [

	html heading level1; mdcTypography_headline5; with: aHeadline.
	html paragraph mdcTypography_body1; with: aSummary
]

{ #category : #rendering }
MDSComponentDemoPage >> renderHeroOn: html [

	self subclassResponsibility
]

{ #category : #rendering }
MDSComponentDemoPage >> renderHeroSectionOn: html [

	html div class: 'hero'; with: [
		html div with: [ self renderHeroOn: html ] ]
]

{ #category : #rendering }
MDSComponentDemoPage >> renderResources: resources on: html [

	html heading level6; class: 'demo-title'; mdcTypography_headline6; with: 'Resources'.
	html anchor
		url: resources third;
		mdcRole: 'listitem'; mdcDeprecatedListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcDeprecatedListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Material Design Guidelines icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_material_design_24px.svg' ].
			html text: 'Material Design Guidelines' ].
	html anchor
		url: resources fourth;
		mdcRole: 'listitem'; mdcDeprecatedListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcDeprecatedListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Documentation icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_drive_document_24px.svg' ].
			html text: 'Documentation' ].
	html anchor
		url: resources fifth;
		mdcRole: 'listitem'; mdcDeprecatedListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcDeprecatedListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Source Code icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_code_24px.svg' ].
			html text: 'Source Code' ]
]
