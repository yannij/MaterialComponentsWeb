Class {
	#name : #MCWApplicationSettingsView,
	#superclass : #MDSComponent,
	#instVars : [
		'mdcDensityComponent',
		'mdcTypographyComponent',
		'mdcThemeComponent'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #initialization }
MCWApplicationSettingsView >> initialize [

	super initialize.

	self beHidden
]

{ #category : #accessing }
MCWApplicationSettingsView >> mdcDensityComponent [
	^ mdcDensityComponent
]

{ #category : #accessing }
MCWApplicationSettingsView >> mdcDensityComponent: anObject [
	mdcDensityComponent := anObject
]

{ #category : #accessing }
MCWApplicationSettingsView >> mdcDensityComponentLazy [

	self mdcDensityComponent ifNil: [
		self mdcDensityComponent: self mcwApplicationGet settings mdcDensity asComponent addValidatedForm ].

	^ self mdcDensityComponent
]

{ #category : #accessing }
MCWApplicationSettingsView >> mdcThemeComponent [
	^ mdcThemeComponent
]

{ #category : #accessing }
MCWApplicationSettingsView >> mdcThemeComponent: anObject [
	mdcThemeComponent := anObject
]

{ #category : #accessing }
MCWApplicationSettingsView >> mdcThemeComponentLazy [

	self mdcThemeComponent ifNil: [
		self mdcThemeComponent: self mcwApplicationGet settings mdcTheme asComponent addValidatedForm ].

	^ self mdcThemeComponent
]

{ #category : #accessing }
MCWApplicationSettingsView >> mdcTypographyComponent [
	^ mdcTypographyComponent
]

{ #category : #accessing }
MCWApplicationSettingsView >> mdcTypographyComponent: anObject [
	mdcTypographyComponent := anObject
]

{ #category : #accessing }
MCWApplicationSettingsView >> mdcTypographyComponentLazy [

	self mdcTypographyComponent ifNil: [
		self mdcTypographyComponent: self mcwApplicationGet settings mdcTypography asComponent addValidatedForm ].

	^ self mdcTypographyComponent
]

{ #category : #rendering }
MCWApplicationSettingsView >> renderContentOn: html [

	html div style: 'padding: 8px'; with: [
		self renderDismissButtonOn: html ].

	html div style: 'padding: 8px'; with: [
		html div
			style: 'width: 320px';
			with: self mdcDensityComponentLazy  ].

	html div style: 'padding: 8px'; with: [
		html div
			style: 'width: 320px';
			with: self mdcTypographyComponentLazy  ].

	html div style: 'padding: 8px'; with: [
		html div
			style: 'width: 320px';
			with: self mdcThemeComponentLazy ]
]

{ #category : #rendering }
MCWApplicationSettingsView >> renderDismissButtonOn: html [

	html anchor
		mdcIconButton;
		mdcButton_raised;
		callback: [ self mcwApplicationGet configureStyle ];
		with: [
			html span mdcMaterialIcons; with: 'expand_less' ]
]
