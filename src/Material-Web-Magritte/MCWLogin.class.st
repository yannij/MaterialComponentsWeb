Class {
	#name : #MCWLogin,
	#superclass : #MCWWebComponent,
	#instVars : [
		'loginState',
		'loginTitle',
		'loginId',
		'password',
		'recoveryToken',
		'authenticationBlock',
		'recoverBlock',
		'registerBlock',
		'loginIdComponent',
		'passwordComponent'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #'utility - password' }
MCWLogin class >> passwordHashFor: aPassword [

	^ (Base64MimeConverter mimeEncode: (ReadStream on: (SHA1 hashMessage: aPassword))) contents
]

{ #category : #'model - api' }
MCWLogin >> attemptRecovery [
	| userOrNil |

	userOrNil := self recoverBlock
		ifNil: [ nil ]
		ifNotNil: [ :block | block value: self loginId value: self password value: self recoveryToken ].

	userOrNil
		ifNotNil: [ self handleEvent: self eventTokenMatch ]
		ifNil: [ self handleEvent: self eventTokenMismatch ]
]

{ #category : #'model - api' }
MCWLogin >> authenticate: aPassword [

	self authenticationBlock
		ifNotNil: [ :theBlock |
			| userOrNil |
			userOrNil := theBlock value: self loginId value: aPassword.
			userOrNil
				ifNil: [ self handleEvent: self eventPasswordMismatch ]
				ifNotNil: [ self handleEvent: self eventPasswordMatch ] ]
]

{ #category : #accessing }
MCWLogin >> authenticationBlock [
	^ authenticationBlock
]

{ #category : #accessing }
MCWLogin >> authenticationBlock: anObject [
	authenticationBlock := anObject
]

{ #category : #'model - api' }
MCWLogin >> beginLoggingIn [

	self handleEvent: self eventLoginStart
]

{ #category : #'model - api' }
MCWLogin >> beginRecovering [

	self handleEvent: self eventRecover
]

{ #category : #'model - api' }
MCWLogin >> beginRegistration [

	self handleEvent: self eventRegister
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

{ #category : #'model - events' }
MCWLogin >> eventContinue [

	^ #Continue
]

{ #category : #'model - events' }
MCWLogin >> eventLoginStart [

	^ #LoginStart
]

{ #category : #'model - events' }
MCWLogin >> eventLogout [

	^ #Logout
]

{ #category : #'model - events' }
MCWLogin >> eventPasswordMatch [

	^ #PasswordMatch
]

{ #category : #'model - events' }
MCWLogin >> eventPasswordMismatch [

	^ #PasswordMismatch
]

{ #category : #'model - events' }
MCWLogin >> eventRecover [

	^ #Recover
]

{ #category : #'model - events' }
MCWLogin >> eventRegister [

	^ #Register
]

{ #category : #'model - events' }
MCWLogin >> eventTokenMatch [

	^ #TokenMatch
]

{ #category : #'model - events' }
MCWLogin >> eventTokenMismatch [

	^ #TokenMismatch
]

{ #category : #'model - events' }
MCWLogin >> eventTokenSent [

	^ #TokenSent
]

{ #category : #'model - api' }
MCWLogin >> handleEvent: anEvent [
	| currentState nextState |

	anEvent = self eventLoginStart ifTrue: [ ^ self stateLoggingIn ].

	currentState := self loginState.
	nextState := #none.

	currentState = self stateLoggingIn ifTrue: [
		anEvent = self eventPasswordMismatch ifTrue: [ nextState := self stateLoggingIn ].
		anEvent = self eventPasswordMatch ifTrue: [ nextState := self stateLoggedIn ].
		anEvent = self eventRecover ifTrue: [ nextState := self stateRecoveryStarted ].
		anEvent = self eventRegister ifTrue: [ nextState := self stateRegistrationStarted ] ].

	currentState = self stateRecoveryStarted ifTrue: [
		anEvent = self eventTokenSent ifTrue: [ nextState := self stateRecovering ] ].

	currentState = self stateRecovering ifTrue: [
		anEvent = self eventTokenMatch ifTrue: [ nextState := self stateRecovered ].
		anEvent = self eventTokenMismatch ifTrue: [ nextState := self stateRecovering ] ].

	currentState = self stateRecovered ifTrue: [
		anEvent = self eventContinue ifTrue: [ nextState := self stateLoggedIn ] ].

	currentState = self stateRegistrationStarted ifTrue: [
		anEvent = self eventTokenSent ifTrue: [ nextState := self stateRegistering ] ].

	currentState = self stateRegistering ifTrue: [
		anEvent = self eventTokenMatch ifTrue: [ nextState := self stateRegistered ] ].

	currentState = self stateRegistered ifTrue: [
		anEvent = self eventContinue ifTrue: [ nextState := self stateLoggedIn ] ].

	currentState = self stateLoggedIn ifTrue: [
		nextState := self stateLoggedIn.
		anEvent = self eventLogout ifTrue: [ nextState := self stateLoggedOut ] ].

	nextState = #none
		ifTrue: [ self error: self printString, ' has no transition from: ', currentState printString, ' on: ', anEvent printString ]
		ifFalse: [
			Transcript crShow: self printString, ' ', currentState printString, ' -> ', nextState printString, ' on: ', anEvent printString.
			self loginState: nextState ]
]

{ #category : #initialization }
MCWLogin >> initialize [

	super initialize.

	self loginState: self stateLoggingIn.
	self loginTitle: self loginTitleDefault.

	self loginId: String new.
	self loginIdComponent:
		(MCWTextInputComponent memento: (MAStraightMemento model: self description: self descriptionLoginId)).

	self password: String new.
	self passwordComponent:
		(MCWTextPasswordComponent memento: (MAStraightMemento model: self description: self descriptionPassword)).
]

{ #category : #testing }
MCWLogin >> isLoggedIn [

	^ self loginState = self stateLoggedIn
]

{ #category : #'model - api' }
MCWLogin >> loggedIn [

	self handleEvent: self eventContinue
]

{ #category : #'model - api' }
MCWLogin >> loggedOut [

	self handleEvent: self eventLogout.

	self session ifNotNil: [ :value | value unregister ].
	self mcwApplicationGet redirect
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
MCWLogin >> loginIdComponent [
	^ loginIdComponent
]

{ #category : #accessing }
MCWLogin >> loginIdComponent: anObject [
	loginIdComponent := anObject
]

{ #category : #accessing }
MCWLogin >> loginState [
	^ loginState
]

{ #category : #accessing }
MCWLogin >> loginState: anObject [
	loginState := anObject
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

{ #category : #'model - api' }
MCWLogin >> onClickNotYetImplementedScript: html [

	^ (html jQuery ajax)
		callback: [ :value | ];
		script: [ :s | s alert: 'Not yet implemented' ];
		yourself
]

{ #category : #accessing }
MCWLogin >> password [
	^ password
]

{ #category : #accessing }
MCWLogin >> password: anObject [
	password := anObject
]

{ #category : #accessing }
MCWLogin >> passwordComponent [
	^ passwordComponent
]

{ #category : #accessing }
MCWLogin >> passwordComponent: anObject [
	passwordComponent := anObject
]

{ #category : #accessing }
MCWLogin >> recoverBlock [
	^ recoverBlock
]

{ #category : #accessing }
MCWLogin >> recoverBlock: anObject [
	recoverBlock := anObject
]

{ #category : #accessing }
MCWLogin >> recoveryToken [
	^ recoveryToken
]

{ #category : #accessing }
MCWLogin >> recoveryToken: anObject [
	recoveryToken := anObject
]

{ #category : #accessing }
MCWLogin >> registerBlock [
	^ registerBlock
]

{ #category : #accessing }
MCWLogin >> registerBlock: anObject [
	registerBlock := anObject
]

{ #category : #'model - api' }
MCWLogin >> registerUser: aPassword [

	"self authenticationBlock
		ifNotNil: [ :theBlock | theBlock value: self loginId value: aPassword ]"
]

{ #category : #rendering }
MCWLogin >> renderContentOn: html [

	html div class: 'mcw-login'; with: [
		html div class: 'mdc-layout-grid'; with: [
			html div class: 'mdc-layout-grid__inner'; with: [
				html div class: 'mdc-layout-grid__cell grid-padding-off-mobile'; mdcLayoutGrid__cell_span1.
				html div class: 'mdc-layout-grid__cell grid-padding-off-mobile'; mdcLayoutGrid__cell_span1.
				html div class: 'mdc-layout-grid__cell grid-padding-off-tablet'; mdcLayoutGrid__cell_span1.
				html div class: 'mdc-layout-grid__cell grid-padding-off-tablet'; mdcLayoutGrid__cell_span1.
				html div class: 'mdc-layout-grid__cell'; with: [
					self renderCurrentStateOn: html ] ] ] ]
]

{ #category : #rendering }
MCWLogin >> renderCurrentStateOn: html [
	| renderMap |

	renderMap := IdentityDictionary new
		at: self stateLoggedIn put: #renderLoggedInOn:;
		at: self stateLoggingIn put: #renderLoggingInOn:;
		at: self stateRecovered put: #renderRecoveredOn:;
		at: self stateRecovering put: #renderRecoveringOn:;
		at: self stateRecoveryStarted put: #renderRecoveryStartedOn:;
		at: self stateRegistered put: #renderRegisteredOn:;
		at: self stateRegistering put: #renderRegisteringOn:;
		at: self stateRegistrationStarted put: #renderRegistrationStartedOn:;
		yourself.

Transcript crShow: self loginState printString.
	(renderMap at: self loginState ifAbsent: [ nil ]) ifNotNil: [ :value |
		self perform: value with: html ]
]

{ #category : #rendering }
MCWLogin >> renderFieldLoginIdOn: html [

	html render: self loginIdComponent
]

{ #category : #rendering }
MCWLogin >> renderFieldPasswordOn: html [

	html render: self passwordComponent
]

{ #category : #rendering }
MCWLogin >> renderFormButton: aButtonText caption: aCaptionText callback: aBlock on: html [

	html form: [
		html div class: 'mcw-login-action'; with: [
			html span mdcTypography_caption; with: aCaptionText.
			html button mdcButton; mdcAutoInit: 'MDCRipple';
				callback: aBlock;
				with: aButtonText ] ]
]

{ #category : #'rendering - model' }
MCWLogin >> renderLoggedInOn: html [

	self renderLoginHeaderOn: html.

	html horizontalRule style: 'border-top: 1px dashed black; margin: 8px auto; width: 300px'.
	html div style: 'margin: 0px auto; width: 300px; text-align: left'; with: [
		html span mdcTypography_caption; with: 'Welcome' ]
]

{ #category : #'rendering - model' }
MCWLogin >> renderLoggingInOn: html [

	self renderLoginHeaderOn: html.
	self renderSingleSignOnOn: html.

	html horizontalRule style: 'border-top: 1px dashed black; margin: 8px auto; width: 300px'.
	html div style: 'margin: 0px auto; width: 300px; text-align: left'; with: [
		html span mdcTypography_caption; with: 'Or use your email to login' ].

	html form with: [
		self renderFieldLoginIdOn: html.
		self renderFieldPasswordOn: html.

		html div class: 'mcw-login-button'; with: [
			html submitButton mdcButton; mdcButton_raised; mdcAutoInit: 'MDCRipple';
				callback: [ self authenticate: self password ];
				"onClick: ((html jQuery ajax)
					callback: [ :value | self authenticate: value ] value: ((html jQuery id: passwordComponent htmlIdPassword) value);
					script: [ :s | s alert: 'The submitted value is: ''', self password, '''.' ];
					onComplete: html javascript refresh;
					yourself);"
				with: 'Login' ] ].

	html div class: 'mcw-login-spacer'.
	self renderFormButton: 'Recover' caption: 'Forgot password ?' callback: [ self beginRecovering ] on: html.
	self renderFormButton: 'Register' caption: 'Don''t have an account ?' callback: [ self beginRegistration ] on: html.

]

{ #category : #rendering }
MCWLogin >> renderLoginHeaderOn: html [

	html section class: 'mcw-login-header'; with: [
		html div class: 'mcw-login-header-spacer'.
		html heading level1; mdcTypography_headline3; with: self loginTitle ]
]

{ #category : #'rendering - model' }
MCWLogin >> renderRecoveredOn: html [

	self renderLoginHeaderOn: html.

	html horizontalRule style: 'border-top: 1px dashed black; margin: 8px auto; width: 300px'.
	html div style: 'margin: 0px auto; width: 300px; text-align: left'; with: [
		html span mdcTypography_caption; with: 'Recovered' ].

	html div class: 'mcw-login-spacer'.
	self renderFormButton: 'Continue' caption: '' callback: [ self loggedIn ] on: html.
]

{ #category : #'rendering - model' }
MCWLogin >> renderRecoveringOn: html [

	self renderLoginHeaderOn: html.

	html horizontalRule style: 'border-top: 1px dashed black; margin: 8px auto; width: 300px'.
	html div style: 'margin: 0px auto; width: 300px; text-align: left'; with: [
		html span mdcTypography_caption; with: 'Enter recovery token ...' ].

	html form with: [
		self renderFieldPasswordOn: html.

		html div class: 'mcw-login-button'; with: [
			html submitButton mdcButton; mdcButton_raised; mdcAutoInit: 'MDCRipple';
				callback: [ self attemptRecovery ];
				with: 'Recover' ] ].

	html div class: 'mcw-login-spacer'.
	self renderFormButton: 'Login here' caption: 'Already a member ?' callback: [ self beginLoggingIn ] on: html.
]

{ #category : #'rendering - model' }
MCWLogin >> renderRecoveryStartedOn: html [

	self renderLoginHeaderOn: html.

	html horizontalRule style: 'border-top: 1px dashed black; margin: 8px auto; width: 300px'.
	html div style: 'margin: 0px auto; width: 300px; text-align: left'; with: [
		html span mdcTypography_caption; with: 'Reset account ...' ].

	html form with: [
		self renderFieldLoginIdOn: html.

		html div class: 'mcw-login-button'; with: [
			html submitButton mdcButton; mdcButton_raised; mdcAutoInit: 'MDCRipple';
				callback: [ self sendToken ];
				with: 'Reset' ] ].

	html div class: 'mcw-login-spacer'.
	self renderFormButton: 'Login here' caption: 'Already a member ?' callback: [ self beginLoggingIn ] on: html.
]

{ #category : #'rendering - model' }
MCWLogin >> renderRegistrationStartedOn: html [

	self renderLoginHeaderOn: html.

	html horizontalRule style: 'border-top: 1px dashed black; margin: 8px auto; width: 300px'.
	html div style: 'margin: 0px auto; width: 300px; text-align: left'; with: [
		html span mdcTypography_caption; with: 'Create new account ...' ].

	html form with: [
		self renderFieldLoginIdOn: html.
		self renderFieldPasswordOn: html.

		html div class: 'mcw-login-button'; with: [
			html submitButton mdcButton; mdcButton_raised; mdcAutoInit: 'MDCRipple';
				callback: [ self registerUser: self password ];
				with: 'Submit' ] ].

	html div class: 'mcw-login-spacer'.
	self renderFormButton: 'Login here' caption: 'Already a member ?' callback: [ self beginLoggingIn ] on: html.
]

{ #category : #rendering }
MCWLogin >> renderSingleSignOnOn: html [

	html div style: 'margin: 0px auto; width: 300px; text-align: left'; with: [
		html span mdcTypography_caption; with: 'Login with' ].
	html div style: 'margin: 0px auto; width: 300px; text-align: center'; with: [
		html button mdcButton; mdcAutoInit: 'MDCRipple';
			onClick: (self onClickNotYetImplementedScript: html);
			with: 'Google'.
		html button mdcButton; mdcAutoInit: 'MDCRipple';
			onClick: (self onClickNotYetImplementedScript: html);
			with: 'Twitter'.
		html button mdcButton; mdcAutoInit: 'MDCRipple';
			onClick: (self onClickNotYetImplementedScript: html);
			with: 'Facebook' ]
]

{ #category : #'model - api' }
MCWLogin >> sendRecoveryTokenTo: aUser [

	^ '123456'
]

{ #category : #'model - api' }
MCWLogin >> sendToken [
	| token |

	token := self sendRecoveryTokenTo: self loginId.
	token ifNotNil: [ :value | self recoveryToken: token ].

	self handleEvent: self eventTokenSent
]

{ #category : #'model - states' }
MCWLogin >> stateLoggedIn [

	^ #Authenticated
]

{ #category : #'model - states' }
MCWLogin >> stateLoggedOut [

	^ #LoggedOut
]

{ #category : #'model - states' }
MCWLogin >> stateLoggingIn [

	^ #LoggingIn
]

{ #category : #'model - states' }
MCWLogin >> stateRecovered [

	^ #Recovered
]

{ #category : #'model - states' }
MCWLogin >> stateRecovering [

	^ #Recovering
]

{ #category : #'model - states' }
MCWLogin >> stateRecoveryStarted [

	^ #RecoveryStarted
]

{ #category : #'model - states' }
MCWLogin >> stateRegistered [

	^ #Registered
]

{ #category : #'model - states' }
MCWLogin >> stateRegistering [

	^ #Registering
]

{ #category : #'model - states' }
MCWLogin >> stateRegistrationStarted [

	^ #RegistrationStarted
]
