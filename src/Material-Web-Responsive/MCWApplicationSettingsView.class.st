Class {
	#name : #MCWApplicationSettingsView,
	#superclass : #MCWLayoutComponent,
	#instVars : [
		'colorThemeComponent'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MCWApplicationSettingsView >> colorThemeComponent [
	^ colorThemeComponent
]

{ #category : #accessing }
MCWApplicationSettingsView >> colorThemeComponent: anObject [
	colorThemeComponent := anObject
]

{ #category : #accessing }
MCWApplicationSettingsView >> colorThemeComponentLazy [

	self colorThemeComponent ifNil: [
		self colorThemeComponent: self mcwApplicationGet settings colorTheme asComponent addValidatedForm ].

	^ self colorThemeComponent
]

{ #category : #initialization }
MCWApplicationSettingsView >> initialize [

	super initialize.

	self beHidden
]

{ #category : #rendering }
MCWApplicationSettingsView >> renderContentOn: html [

	html div style: 'padding: 8px'; with: [
		html div
			style: 'width: 320px';
			with: self colorThemeComponentLazy ]

]
