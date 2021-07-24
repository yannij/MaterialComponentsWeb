"
I handle the communication with the ""stripe API"" (https://stripe.com/docs/api)
"
Class {
	#name : #StripeAPI,
	#superclass : #Object,
	#classVars : [
		'Current'
	],
	#category : #Stripe
}

{ #category : #accessing }
StripeAPI class >> current [

	^ Current ifNil: [ Current := self new ]
]

{ #category : #accessing }
StripeAPI class >> currentReset [

	Current := nil
]

{ #category : #'class initialization' }
StripeAPI class >> dockerDeployPreLoad [
	<dockerDeployPreLoad>

	DockerDeploy current secretNamesAdd: self dockerSecretsName
]

{ #category : #initialization }
StripeAPI class >> dockerSecretsName [

	^ 'shrine'
]

{ #category : #accessing }
StripeAPI class >> stripePublishableKey [
	"
	DockerDeploy current loadSecretNamed: ShrineApp dockerSecretsName.
	ShrineApp stripePublishableKey.
	"

	^ DockerDeploy current
		secretsAt: self dockerSecretsName
		atKey: 'stripePublishableKey'
		ifAbsent: [ 'missing-stripePublishableKey' ]
]

{ #category : #accessing }
StripeAPI class >> stripeSecretKey [
	"
	DockerDeploy current loadSecretNamed: ShrineApp dockerSecretsName.
	ShrineApp stripeSecretKey.
	"

	^ DockerDeploy current
		secretsAt: self dockerSecretsName
		atKey: 'stripeSecretKey'
		ifAbsent: [ 'missing-stripeSecretKey' ]
]

{ #category : #accessing }
StripeAPI >> stripePublishableKey [

	^ self class stripePublishableKey
]

{ #category : #accessing }
StripeAPI >> stripeSecretKey [

	^ self class stripeSecretKey
]
