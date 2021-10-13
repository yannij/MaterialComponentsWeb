Class {
	#name : #MDSDemoButtonPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoButtonPage >> pageInfo [

	^ #(
	'Button'
	'Buttons communicate an action a user can take. They are typically placed throughout your UI, in places like dialogs, forms, cards, and toolbars.'
	'https://material.io/go/design-buttons'
	'https://material.io/components/web/catalog/buttons/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-button'
	)
]

{ #category : #rendering }
MDSDemoButtonPage >> renderDemosOn: html [

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Text Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon' ] ].

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Raised Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_raised; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_raised; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_raised; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon' ] ].

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Unelevated Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon' ] ].

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Outlined Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_outlined; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_outlined; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_outlined; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon' ] ].

	html div with: [
		html heading level3; mdcTypography_subtitle1; with: 'Shaped Button'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; class: 'demo-button-shaped'; mdcRippleUpgraded; with: 'Default'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; class: 'demo-button-shaped'; mdcRippleUpgraded; with: 'Dense'.
		html button type: ''; class: 'demo-button'; mdcButton; mdcButton_unelevated; class: 'demo-button-shaped'; mdcRippleUpgraded; with: [
			html span mdcMaterialIcons; mdcButton__icon; with: 'favorite'.
			html text: 'Icon' ] ]
]

{ #category : #rendering }
MDSDemoButtonPage >> renderHeroOn: html [

	html button type: ''; class: 'hero-button'; mdcButton; mdcRippleUpgraded; with: 'Text'.
	html button type: ''; class: 'hero-button'; mdcButton; mdcButton_raised; mdcRippleUpgraded; with: 'Raised'.
	html button type: ''; class: 'hero-button'; mdcButton; mdcButton_unelevated; mdcRippleUpgraded; with: 'Unelevated'.
	html button type: ''; class: 'hero-button'; mdcButton; mdcButton_outlined; mdcRippleUpgraded; with: 'Outlined'
]
