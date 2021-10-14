Class {
	#name : #MDMApplicationSettingsView,
	#superclass : #MDSComponent,
	#instVars : [
		'mdcDensityComponent',
		'mdcTypographyComponent',
		'mdcThemeComponent'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #initialization }
MDMApplicationSettingsView >> initialize [

	super initialize.

	self beHidden
]

{ #category : #accessing }
MDMApplicationSettingsView >> mdcDensityComponent [
	^ mdcDensityComponent
]

{ #category : #accessing }
MDMApplicationSettingsView >> mdcDensityComponent: anObject [
	mdcDensityComponent := anObject
]

{ #category : #accessing }
MDMApplicationSettingsView >> mdcDensityComponentLazy [

	self mdcDensityComponent ifNil: [
		self mdcDensityComponent: self mcwApplicationGet settings mdcDensity asComponent addValidatedForm ].

	^ self mdcDensityComponent
]

{ #category : #accessing }
MDMApplicationSettingsView >> mdcThemeComponent [
	^ mdcThemeComponent
]

{ #category : #accessing }
MDMApplicationSettingsView >> mdcThemeComponent: anObject [
	mdcThemeComponent := anObject
]

{ #category : #accessing }
MDMApplicationSettingsView >> mdcThemeComponentLazy [

	self mdcThemeComponent ifNil: [
		self mdcThemeComponent: self mcwApplicationGet settings mdcTheme asComponent addValidatedForm ].

	^ self mdcThemeComponent
]

{ #category : #accessing }
MDMApplicationSettingsView >> mdcTypographyComponent [
	^ mdcTypographyComponent
]

{ #category : #accessing }
MDMApplicationSettingsView >> mdcTypographyComponent: anObject [
	mdcTypographyComponent := anObject
]

{ #category : #accessing }
MDMApplicationSettingsView >> mdcTypographyComponentLazy [

	self mdcTypographyComponent ifNil: [
		self mdcTypographyComponent: self mcwApplicationGet settings mdcTypography asComponent addValidatedForm ].

	^ self mdcTypographyComponent
]

{ #category : #rendering }
MDMApplicationSettingsView >> renderContentOn: html [

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
MDMApplicationSettingsView >> renderDismissButtonOn: html [

	html anchor
		mdcIconButton;
		mdcButton_raised;
		callback: [ self mcwApplicationGet configureStyle ];
		with: [
			html span mdcMaterialIcons; with: 'expand_less' ]
]
