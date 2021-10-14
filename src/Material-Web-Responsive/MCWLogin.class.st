Class {
	#name : #MCWLogin,
	#superclass : #MDSComponent,
	#instVars : [
		'loginState',
		'loginTitle',
		'loginId',
		'password',
		'tokenTyped',
		'tokenSent',
		'authenticationBlock',
		'recoverBlock',
		'registerBlock',
		'sendTokenBlock'
	],
	#category : #'Material-Web-Responsive'
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
		ifNotNil: [ :block | block value: self loginId value: self tokenTyped value: self tokenSent ].

	userOrNil
		ifNotNil: [
			self transitionOnEvent: self eventTokenMatch.
			self transitionOnEvent: self eventContinue ]
		ifNil: [ self transitionOnEvent: self eventTokenMismatch ]
]

{ #category : #'model - api' }
MCWLogin >> authenticate: aLoginId password: aPassword [

	self authenticationBlock
		ifNotNil: [ :theBlock |
			| userOrNil |
			userOrNil := theBlock value: aLoginId value: aPassword.
			userOrNil
				ifNil: [ self transitionOnEvent: self eventPasswordMismatch ]
				ifNotNil: [ self transitionOnEvent: self eventPasswordMatch ] ]
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

	self password: String new.
	self transitionOnEvent: self eventLoginStart
]

{ #category : #'model - api' }
MCWLogin >> beginRecovering [

	self transitionOnEvent: self eventRecover
]

{ #category : #'model - api' }
MCWLogin >> beginRegistration [

	self transitionOnEvent: self eventRegister
]

{ #category : #private }
MCWLogin >> clearInputs [

	self loginId: String new.
	self password: String new.
	self tokenTyped: String new.
	self tokenSent: String new.

]

{ #category : #'model - api' }
MCWLogin >> confirmRegistration [

	self tokenTyped = self tokenSent
		ifFalse: [
			self mcwApplicationGet logFormat: 'Token mismatch: tokenTyped={1}, tokenSent={2}' with: self tokenTyped with: self tokenSent. 
			self transitionOnEvent: self eventTokenMismatch ]
		ifTrue: [
			self registerBlock
				ifNotNil: [ :theBlock |
					| userOrNil |
					userOrNil := theBlock value: self loginId value: self password.
					userOrNil
						ifNil: [ self error: 'Failed to create user: ', self loginId ]
						ifNotNil: [
							self clearInputs.
							self transitionOnEvent: self eventTokenMatch ] ] ]
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

{ #category : #initialization }
MCWLogin >> initialize [

	super initialize.

	self loginState: self stateLoggingIn.
	self loginTitle: self loginTitleDefault.
	self loginId: String new.
	self password: String new.
]

{ #category : #testing }
MCWLogin >> isLoggedIn [

	^ self loginState = self stateLoggedIn
]

{ #category : #'model - api' }
MCWLogin >> loggedIn [

	self transitionOnEvent: self eventContinue
]

{ #category : #'model - api' }
MCWLogin >> loggedOut [

	self transitionOnEvent: self eventLogout.

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

{ #category : #rendering }
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
MCWLogin >> recoverBlock [
	^ recoverBlock
]

{ #category : #accessing }
MCWLogin >> recoverBlock: anObject [
	recoverBlock := anObject
]

{ #category : #'model - api' }
MCWLogin >> register: aLoginId password: aPassword [

	self registerBlock
		ifNotNil: [ :theBlock |
			| userOrNil |
			userOrNil := theBlock value: aLoginId value: aPassword.
			userOrNil
				ifNil: [ self error: 'Failed to create user: ', aLoginId ]
				ifNotNil: [
					self sendToken.
					self transitionOnEvent: self eventTokenSent ] ]
]

{ #category : #accessing }
MCWLogin >> registerBlock [
	^ registerBlock
]

{ #category : #accessing }
MCWLogin >> registerBlock: anObject [
	registerBlock := anObject
]

{ #category : #rendering }
MCWLogin >> renderButton: aButtonText callback: aBlock on: html [

	html div class: 'mcw-login-action'; with: [
		html submitButton mdcButton; mdcButton_raised; mdcAutoInit: 'MDCRipple';
			callback: aBlock;
			"onClick: ((html jQuery ajax)
				callback: [ :value | self authenticate: value ] value: ((html jQuery id: passwordComponent htmlIdPassword) value);
				script: [ :s | s alert: 'The submitted value is: ''', self password, '''.' ];
				onComplete: html javascript refresh;
				yourself);"
			with: aButtonText ]
]

{ #category : #rendering }
MCWLogin >> renderButtonInline: aButtonText caption: aCaptionText callback: aBlock on: html [

	html form: [
		html div class: 'mcw-login-action'; with: [
			html span mdcTypography_caption; with: aCaptionText.
			html submitButton mdcButton; mdcAutoInit: 'MDCRipple';
				callback: aBlock;
				with: aButtonText ] ]
]

{ #category : #rendering }
MCWLogin >> renderCaption: aString on: html [

	html div style: 'margin: 4px auto 0px auto; width: 300px; text-align: left'; with: [
		html span mdcTypography_caption; with: aString ]
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

	(renderMap at: self loginState ifAbsent: [ nil ]) ifNotNil: [ :value |
		self perform: value with: html ]
]

{ #category : #rendering }
MCWLogin >> renderField: aLabel type: anInputType for: anAspect on: html [
	| fieldId |

	fieldId := html nextId.
	html label
		class: 'mcw-login-username';
		mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; mdcFloatingLabel_floatAbove; mdcAutoInit: 'MDCFloatingLabel';
				id: fieldId;
				with: aLabel.
			html textInput mdcTextField__input;
				type: anInputType;
				ariaDescribedBy: fieldId;
				attributeAt: 'step' put: '1';
				on: anAspect of: self.
			html span mdcLineRipple ]
]

{ #category : #rendering }
MCWLogin >> renderFieldPassword: aLabel for: anAspect on: html [

	self renderField: aLabel type: 'password' for: anAspect on: html
]

{ #category : #rendering }
MCWLogin >> renderFieldText: aLabel for: anAspect on: html [

	self renderField: aLabel type: 'text' for: anAspect on: html
]

{ #category : #rendering }
MCWLogin >> renderLineOn: html [

	html horizontalRule style: 'border-top: 1px dashed black; margin: 12px auto 8px auto; width: 300px'
]

{ #category : #'rendering - model' }
MCWLogin >> renderLoggedInOn: html [

	self renderLoginHeaderOn: html.

	self renderLineOn: html.
	self renderCaption: 'Welcome' on: html
]

{ #category : #'rendering - model' }
MCWLogin >> renderLoggingInOn: html [

	self renderLoginHeaderOn: html.

	self renderSingleSignOnOn: html.

	self renderLineOn: html.
	self renderCaption: 'Or use your email to login' on: html.

	html form with: [
		self renderLoginIdOn: html.
		self renderPasswordOn: html.
		self renderButton: 'Login' callback: [ self authenticate: self loginId password: self password ] on: html ].

	self renderSpacerOn: html.
	self renderButtonInline: 'Recover' caption: 'Forgot password ?' callback: [ self beginRecovering ] on: html.
	self renderButtonInline: 'Register' caption: 'Don''t have an account ?' callback: [ self beginRegistration ] on: html.

]

{ #category : #rendering }
MCWLogin >> renderLoginHeaderOn: html [

	html section class: 'mcw-login-header'; with: [
		html div class: 'mcw-login-header-spacer'.
		html heading level1; mdcTypography_headline3; with: self loginTitle ]
]

{ #category : #rendering }
MCWLogin >> renderLoginIdOn: html [

	self renderFieldText: 'Your email or user ID' for: #loginId on: html
]

{ #category : #rendering }
MCWLogin >> renderPasswordOn: html [

	self renderFieldPassword: 'Password' for: #password on: html
]

{ #category : #'rendering - model' }
MCWLogin >> renderRecoveredOn: html [

	self renderLoginHeaderOn: html.

	self renderLineOn: html.
	self renderCaption: 'Recovered' on: html.

	self renderSpacerOn: html.
	self renderButtonInline: 'Continue' caption: '' callback: [ self loggedIn ] on: html.
]

{ #category : #'rendering - model' }
MCWLogin >> renderRecoveringOn: html [

	self renderLoginHeaderOn: html.

	self renderLineOn: html.
	self renderCaption: 'Enter recovery token' on: html.

	html form with: [
		self renderTokenTypedOn: html.
		self renderButton: 'Recover' callback: [ self attemptRecovery ] on: html ].

	self renderSpacerOn: html.
	self renderButtonInline: 'Login here' caption: 'Already a member ?' callback: [ self beginLoggingIn ] on: html.
]

{ #category : #'rendering - model' }
MCWLogin >> renderRecoveryStartedOn: html [

	self renderLoginHeaderOn: html.

	self renderLineOn: html.
	self renderCaption: 'Reset account' on: html.

	html form with: [
		self renderLoginIdOn: html.
		self renderButton: 'Reset' callback: [ self sendToken ] on: html ].

	self renderSpacerOn: html.
	self renderButtonInline: 'Login here' caption: 'Already a member ?' callback: [ self beginLoggingIn ] on: html.
]

{ #category : #'rendering - model' }
MCWLogin >> renderRegisteredOn: html [

	self renderLoginHeaderOn: html.

	self renderLineOn: html.
	self renderCaption: 'Registered successfully !' on: html.

	self renderSpacerOn: html.
	self renderButtonInline: 'Continue' caption: '' callback: [ self loggedIn ] on: html.
]

{ #category : #'rendering - model' }
MCWLogin >> renderRegisteringOn: html [

	self renderLoginHeaderOn: html.

	self renderLineOn: html.
	self renderCaption: 'Enter registration token' on: html.

	html form with: [
		self renderTokenTypedOn: html.
		self renderButton: 'Submit' callback: [ self confirmRegistration ] on: html ].

	self renderSpacerOn: html.
	self renderButtonInline: 'Login here' caption: 'Already a member ?' callback: [ self beginLoggingIn ] on: html.
]

{ #category : #'rendering - model' }
MCWLogin >> renderRegistrationStartedOn: html [

	self renderLoginHeaderOn: html.

	self renderLineOn: html.
	self renderCaption: 'Create new account' on: html.

	html form with: [
		self renderLoginIdOn: html.
		self renderPasswordOn: html.
		self renderButton: 'Register me' callback: [ self sendToken ] on: html ].

	self renderSpacerOn: html.
	self renderButtonInline: 'Login here' caption: 'Already a member ?' callback: [ self beginLoggingIn ] on: html.
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

{ #category : #rendering }
MCWLogin >> renderSpacerOn: html [

	html div class: 'mcw-login-spacer'
]

{ #category : #rendering }
MCWLogin >> renderTokenTypedOn: html [

	self renderFieldPassword: 'Token' for: #tokenTyped on: html
]

{ #category : #'model - api' }
MCWLogin >> sendToken [
	| token |

	token := self sendTokenTo: self loginId.
	token ifNotNil: [ :value | self tokenSent: token ].

	self transitionOnEvent: self eventTokenSent
]

{ #category : #accessing }
MCWLogin >> sendTokenBlock [
	^ sendTokenBlock
]

{ #category : #accessing }
MCWLogin >> sendTokenBlock: anObject [
	sendTokenBlock := anObject
]

{ #category : #private }
MCWLogin >> sendTokenTo: aLoginId [

	^ self sendTokenBlock
		ifNil: [ nil ]
		ifNotNil: [ :block | block value: self loginId ]
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

{ #category : #accessing }
MCWLogin >> tokenSent [
	^ tokenSent
]

{ #category : #accessing }
MCWLogin >> tokenSent: anObject [
	tokenSent := anObject
]

{ #category : #accessing }
MCWLogin >> tokenTyped [
	^ tokenTyped
]

{ #category : #accessing }
MCWLogin >> tokenTyped: anObject [
	tokenTyped := anObject
]

{ #category : #'model - events' }
MCWLogin >> transitionOnEvent: anEvent [
	| currentState nextState |

	anEvent = self eventLoginStart ifTrue: [ ^ self loginState: self stateLoggingIn ].

	currentState := self loginState.
	"Stay in same state when not specified, to avoid noise from error"
	nextState := currentState.

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
		anEvent = self eventTokenMatch ifTrue: [ nextState := self stateRegistered.
		anEvent = self eventTokenMismatch ifTrue: [ nextState := self stateRegistering ] ] ].

	currentState = self stateRegistered ifTrue: [
		anEvent = self eventContinue ifTrue: [ nextState := self stateLoggedIn ] ].

	currentState = self stateLoggedIn ifTrue: [
		anEvent = self eventLogout ifTrue: [ nextState := self stateLoggedOut ] ].

	nextState = #none
		ifTrue: [ self error: self printString, ' has no transition from: ', currentState printString, ' on: ', anEvent printString ]
		ifFalse: [
			self mcwApplicationGet logFormat: '{1}: {2} -> {3} on {4}' with: self printString with: currentState printString with: nextState printString with: anEvent printString.
			self loginState: nextState ]
]
