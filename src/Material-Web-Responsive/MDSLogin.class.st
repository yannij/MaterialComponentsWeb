Class {
	#name : #MDSLogin,
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
MDSLogin class >> passwordHashFor: aPassword [

	^ (Base64MimeConverter mimeEncode: (ReadStream on: (SHA1 hashMessage: aPassword))) contents
]

{ #category : #'model - api' }
MDSLogin >> attemptRecovery [
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
MDSLogin >> authenticate: aLoginId password: aPassword [

	self authenticationBlock
		ifNotNil: [ :theBlock |
			| userOrNil |
			userOrNil := theBlock value: aLoginId value: aPassword.
			userOrNil
				ifNil: [ self transitionOnEvent: self eventPasswordMismatch ]
				ifNotNil: [ self transitionOnEvent: self eventPasswordMatch ] ]
]

{ #category : #accessing }
MDSLogin >> authenticationBlock [
	^ authenticationBlock
]

{ #category : #accessing }
MDSLogin >> authenticationBlock: anObject [
	authenticationBlock := anObject
]

{ #category : #'model - api' }
MDSLogin >> beginLoggingIn [

	self password: String new.
	self transitionOnEvent: self eventLoginStart
]

{ #category : #'model - api' }
MDSLogin >> beginRecovering [

	self transitionOnEvent: self eventRecover
]

{ #category : #'model - api' }
MDSLogin >> beginRegistration [

	self transitionOnEvent: self eventRegister
]

{ #category : #private }
MDSLogin >> clearInputs [

	self loginId: String new.
	self password: String new.
	self tokenTyped: String new.
	self tokenSent: String new.

]

{ #category : #'model - api' }
MDSLogin >> confirmRegistration [

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
MDSLogin >> eventContinue [

	^ #Continue
]

{ #category : #'model - events' }
MDSLogin >> eventLoginStart [

	^ #LoginStart
]

{ #category : #'model - events' }
MDSLogin >> eventLogout [

	^ #Logout
]

{ #category : #'model - events' }
MDSLogin >> eventPasswordMatch [

	^ #PasswordMatch
]

{ #category : #'model - events' }
MDSLogin >> eventPasswordMismatch [

	^ #PasswordMismatch
]

{ #category : #'model - events' }
MDSLogin >> eventRecover [

	^ #Recover
]

{ #category : #'model - events' }
MDSLogin >> eventRegister [

	^ #Register
]

{ #category : #'model - events' }
MDSLogin >> eventTokenMatch [

	^ #TokenMatch
]

{ #category : #'model - events' }
MDSLogin >> eventTokenMismatch [

	^ #TokenMismatch
]

{ #category : #'model - events' }
MDSLogin >> eventTokenSent [

	^ #TokenSent
]

{ #category : #initialization }
MDSLogin >> initialize [

	super initialize.

	self loginState: self stateLoggingIn.
	self loginTitle: self loginTitleDefault.
	self loginId: String new.
	self password: String new.
]

{ #category : #testing }
MDSLogin >> isLoggedIn [

	^ self loginState = self stateLoggedIn
]

{ #category : #'model - api' }
MDSLogin >> loggedIn [

	self transitionOnEvent: self eventContinue
]

{ #category : #'model - api' }
MDSLogin >> loggedOut [

	self transitionOnEvent: self eventLogout.

	self session ifNotNil: [ :value | value unregister ].
	self mcwApplicationGet redirect
]

{ #category : #accessing }
MDSLogin >> loginId [
	^ loginId
]

{ #category : #accessing }
MDSLogin >> loginId: anObject [
	loginId := anObject
]

{ #category : #accessing }
MDSLogin >> loginState [
	^ loginState
]

{ #category : #accessing }
MDSLogin >> loginState: anObject [
	loginState := anObject
]

{ #category : #accessing }
MDSLogin >> loginTitle [
	^ loginTitle
]

{ #category : #accessing }
MDSLogin >> loginTitle: anObject [
	loginTitle := anObject
]

{ #category : #initialization }
MDSLogin >> loginTitleDefault [

	^ 'MCW Seaside'
]

{ #category : #rendering }
MDSLogin >> onClickNotYetImplementedScript: html [

	^ (html jQuery ajax)
		callback: [ :value | ];
		script: [ :s | s alert: 'Not yet implemented' ];
		yourself
]

{ #category : #accessing }
MDSLogin >> password [
	^ password
]

{ #category : #accessing }
MDSLogin >> password: anObject [
	password := anObject
]

{ #category : #accessing }
MDSLogin >> recoverBlock [
	^ recoverBlock
]

{ #category : #accessing }
MDSLogin >> recoverBlock: anObject [
	recoverBlock := anObject
]

{ #category : #'model - api' }
MDSLogin >> register: aLoginId password: aPassword [

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
MDSLogin >> registerBlock [
	^ registerBlock
]

{ #category : #accessing }
MDSLogin >> registerBlock: anObject [
	registerBlock := anObject
]

{ #category : #rendering }
MDSLogin >> renderButton: aButtonText callback: aBlock on: html [

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
MDSLogin >> renderButtonInline: aButtonText caption: aCaptionText callback: aBlock on: html [

	html form: [
		html div class: 'mcw-login-action'; with: [
			html span mdcTypography_caption; with: aCaptionText.
			html submitButton mdcButton; mdcAutoInit: 'MDCRipple';
				callback: aBlock;
				with: aButtonText ] ]
]

{ #category : #rendering }
MDSLogin >> renderCaption: aString on: html [

	html div style: 'margin: 4px auto 0px auto; width: 300px; text-align: left'; with: [
		html span mdcTypography_caption; with: aString ]
]

{ #category : #rendering }
MDSLogin >> renderContentOn: html [

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
MDSLogin >> renderCurrentStateOn: html [
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
MDSLogin >> renderField: aLabel type: anInputType for: anAspect on: html [
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
MDSLogin >> renderFieldPassword: aLabel for: anAspect on: html [

	self renderField: aLabel type: 'password' for: anAspect on: html
]

{ #category : #rendering }
MDSLogin >> renderFieldText: aLabel for: anAspect on: html [

	self renderField: aLabel type: 'text' for: anAspect on: html
]

{ #category : #rendering }
MDSLogin >> renderLineOn: html [

	html horizontalRule style: 'border-top: 1px dashed black; margin: 12px auto 8px auto; width: 300px'
]

{ #category : #'rendering - model' }
MDSLogin >> renderLoggedInOn: html [

	self renderLoginHeaderOn: html.

	self renderLineOn: html.
	self renderCaption: 'Welcome' on: html
]

{ #category : #'rendering - model' }
MDSLogin >> renderLoggingInOn: html [

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
MDSLogin >> renderLoginHeaderOn: html [

	html section class: 'mcw-login-header'; with: [
		html div class: 'mcw-login-header-spacer'.
		html heading level1; mdcTypography_headline3; with: self loginTitle ]
]

{ #category : #rendering }
MDSLogin >> renderLoginIdOn: html [

	self renderFieldText: 'Your email or user ID' for: #loginId on: html
]

{ #category : #rendering }
MDSLogin >> renderPasswordOn: html [

	self renderFieldPassword: 'Password' for: #password on: html
]

{ #category : #'rendering - model' }
MDSLogin >> renderRecoveredOn: html [

	self renderLoginHeaderOn: html.

	self renderLineOn: html.
	self renderCaption: 'Recovered' on: html.

	self renderSpacerOn: html.
	self renderButtonInline: 'Continue' caption: '' callback: [ self loggedIn ] on: html.
]

{ #category : #'rendering - model' }
MDSLogin >> renderRecoveringOn: html [

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
MDSLogin >> renderRecoveryStartedOn: html [

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
MDSLogin >> renderRegisteredOn: html [

	self renderLoginHeaderOn: html.

	self renderLineOn: html.
	self renderCaption: 'Registered successfully !' on: html.

	self renderSpacerOn: html.
	self renderButtonInline: 'Continue' caption: '' callback: [ self loggedIn ] on: html.
]

{ #category : #'rendering - model' }
MDSLogin >> renderRegisteringOn: html [

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
MDSLogin >> renderRegistrationStartedOn: html [

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
MDSLogin >> renderSingleSignOnOn: html [

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
MDSLogin >> renderSpacerOn: html [

	html div class: 'mcw-login-spacer'
]

{ #category : #rendering }
MDSLogin >> renderTokenTypedOn: html [

	self renderFieldPassword: 'Token' for: #tokenTyped on: html
]

{ #category : #'model - api' }
MDSLogin >> sendToken [
	| token |

	token := self sendTokenTo: self loginId.
	token ifNotNil: [ :value | self tokenSent: token ].

	self transitionOnEvent: self eventTokenSent
]

{ #category : #accessing }
MDSLogin >> sendTokenBlock [
	^ sendTokenBlock
]

{ #category : #accessing }
MDSLogin >> sendTokenBlock: anObject [
	sendTokenBlock := anObject
]

{ #category : #private }
MDSLogin >> sendTokenTo: aLoginId [

	^ self sendTokenBlock
		ifNil: [ nil ]
		ifNotNil: [ :block | block value: self loginId ]
]

{ #category : #'model - states' }
MDSLogin >> stateLoggedIn [

	^ #Authenticated
]

{ #category : #'model - states' }
MDSLogin >> stateLoggedOut [

	^ #LoggedOut
]

{ #category : #'model - states' }
MDSLogin >> stateLoggingIn [

	^ #LoggingIn
]

{ #category : #'model - states' }
MDSLogin >> stateRecovered [

	^ #Recovered
]

{ #category : #'model - states' }
MDSLogin >> stateRecovering [

	^ #Recovering
]

{ #category : #'model - states' }
MDSLogin >> stateRecoveryStarted [

	^ #RecoveryStarted
]

{ #category : #'model - states' }
MDSLogin >> stateRegistered [

	^ #Registered
]

{ #category : #'model - states' }
MDSLogin >> stateRegistering [

	^ #Registering
]

{ #category : #'model - states' }
MDSLogin >> stateRegistrationStarted [

	^ #RegistrationStarted
]

{ #category : #accessing }
MDSLogin >> tokenSent [
	^ tokenSent
]

{ #category : #accessing }
MDSLogin >> tokenSent: anObject [
	tokenSent := anObject
]

{ #category : #accessing }
MDSLogin >> tokenTyped [
	^ tokenTyped
]

{ #category : #accessing }
MDSLogin >> tokenTyped: anObject [
	tokenTyped := anObject
]

{ #category : #'model - events' }
MDSLogin >> transitionOnEvent: anEvent [
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
