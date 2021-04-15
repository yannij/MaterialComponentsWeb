Class {
	#name : #MCWLogin,
	#superclass : #MCWWebComponent,
	#instVars : [
		'loginId',
		'password',
		'loginTitle',
		'authenticationBlock'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #'utility - password' }
MCWLogin class >> passwordHashFor: aPassword [

	^ (Base64MimeConverter mimeEncode: (ReadStream on: (SHA1 hashMessage: aPassword))) contents
]

{ #category : #actions }
MCWLogin >> authenticate [

	self authenticationBlock
		ifNotNil: [ :theBlock | theBlock value: self loginId value: self password ]
]

{ #category : #accessing }
MCWLogin >> authenticationBlock [
	^ authenticationBlock
]

{ #category : #accessing }
MCWLogin >> authenticationBlock: anObject [
	authenticationBlock := anObject
]

{ #category : #'accessing - magritte' }
MCWLogin >> descriptionLoginId [
	<magritteDescription>

	^ MAStringDescription new
		accessor: #loginId;
		default: '';
		label: 'Your email or user ID';
		cssClass: 'mcw-login-username';
		priority: 10;
		yourself
]

{ #category : #'accessing - magritte' }
MCWLogin >> descriptionPassword [
	<magritteDescription>

	^ MAPasswordDescription new
		accessor: #password;
		default: '';
		label: 'Password';
		cssClass: 'mcw-login-password';
		priority: 20;
		yourself
]

{ #category : #initialization }
MCWLogin >> initialize [

	super initialize.

	self loginId: String new.
	self password: String new.
	self loginTitle: self loginTitleDefault
]

{ #category : #accessing }
MCWLogin >> loginId [
	^ loginId
]

{ #category : #accessing }
MCWLogin >> loginId: anObject [
	loginId := anObject
]

{ #category : #accessing }
MCWLogin >> loginTitle [
	^ loginTitle
]

{ #category : #accessing }
MCWLogin >> loginTitle: anObject [
	loginTitle := anObject
]

{ #category : #initialization }
MCWLogin >> loginTitleDefault [

	^ 'MCW Seaside'
]

{ #category : #accessing }
MCWLogin >> password [
	^ password
]

{ #category : #accessing }
MCWLogin >> password: anObject [
	password := anObject
]

{ #category : #rendering }
MCWLogin >> renderContentOn: html [ 

	self renderLoginOn: html
]

{ #category : #rendering }
MCWLogin >> renderLoginFormOn: html [
	| loginIdComponent passwordComponent |

	loginIdComponent := MCWTextInputComponent
		memento: (MAStraightMemento model: self description: self descriptionLoginId).
	passwordComponent := MCWTextPasswordComponent
		memento: (MAStraightMemento model: self description: self descriptionPassword).

	html form with: [
		html render: loginIdComponent.
		html render: passwordComponent.

		html div class: 'mcw-login-button'; with: [
			html button mdcButton; mdcButton_raised; mdcAutoInit: 'MDCRipple'; class: 'next';
				onClick: ((html jQuery ajax)
					callback: [ self authenticate ];
					onComplete: html javascript refresh);
				with: 'Login' ] ]
]

{ #category : #rendering }
MCWLogin >> renderLoginHeaderOn: html [

	html section class: 'mcw-login-header'; with: [
		html heading level1; mdcTypography_headline3; with: self loginTitle ]
]

{ #category : #rendering }
MCWLogin >> renderLoginOn: html [

	html div class: 'mcw-login'; with: [
		html div class: 'mdc-layout-grid'; with: [
			html div class: 'mdc-layout-grid__inner'; with: [
				html div class: 'mdc-layout-grid__cell grid-padding-off-mobile'; mdcLayoutGrid__cell_span1.
				html div class: 'mdc-layout-grid__cell grid-padding-off-mobile'; mdcLayoutGrid__cell_span1.
				html div class: 'mdc-layout-grid__cell grid-padding-off-tablet'; mdcLayoutGrid__cell_span1.
				html div class: 'mdc-layout-grid__cell grid-padding-off-tablet'; mdcLayoutGrid__cell_span1.
				html div class: 'mdc-layout-grid__cell'; with: [
					self renderLoginHeaderOn: html.
					self renderLoginFormOn: html ] ] ] ]
]
