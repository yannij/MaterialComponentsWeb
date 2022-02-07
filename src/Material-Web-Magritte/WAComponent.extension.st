Extension { #name : #WAComponent }

{ #category : #'*Material-Web-Magritte' }
WAComponent >> mcwApplicationGet [

	^ self session
		ifNil: [ nil ]
		ifNotNil: [ :value | value presenter ]
]

{ #category : #'*Material-Web-Magritte' }
WAComponent >> mcwDenseView [

	^ self mcwApplicationGet
		ifNil: [ false ]
		ifNotNil: [ :value | value mcwIsResponsiveApplication
			ifTrue: [ value denseView ]
			ifFalse: [ false ] ]
]

{ #category : #'*Material-Web-Magritte' }
WAComponent >> mcwIsResponsiveApplication [

	^ false
]

{ #category : #'*Material-Web-Magritte' }
WAComponent class >> mcwPublicServerUrl [
	"Answer URL based on Seaside configuration of:
		serverProtocol
		serverHostname
		serverPort
		serverPath
	Answer nil if serverHostname is not set.
	Example:
		WAComponent mcwPublicServerUrl
	"
	| serverUrl |

	serverUrl := WADispatcher default url.
	^ serverUrl host
		ifNil: [ nil ]
		ifNotNil: [ :value | serverUrl ]
]

{ #category : #'*Material-Web-Magritte' }
WAComponent >> mcwPublicServerUrl [

	^ self class mcwPublicServerUrl
]

{ #category : #'*Material-Web-Magritte' }
WAComponent class >> mcwPublicServerUrl: aUrlString [
	"Set Seaside configuration of:
		serverProtocol
		serverHostname
		serverPort
		serverPath

	Example:
		WAComponent mcwPublicServerUrl: 'http://foobar.com'.
		WAComponent mcwPublicServerUrl: 'http://localhost:8080'.
	"
	| newUrl |

	newUrl := WAUrl absolute: aUrlString.

	WADispatcher default
	serverProtocol: newUrl scheme;
	serverHostname: newUrl host;
	serverPort: newUrl port;
	serverPath: newUrl pathStringUnencoded.
]

{ #category : #'*Material-Web-Magritte' }
WAComponent class >> mcwPublicServerUrlInstallDockerConfig [
	"
	DockerDeploy current loadConfigNamed: DockerDeploy defaultConfigName.
	WAComponent mcwPublicServerUrlInstallDockerConfig
	"
	| publicServerUrl |

	publicServerUrl := DockerDeploy current configsAt: DockerDeploy defaultConfigName atKey: 'publicServerUrl'.
	publicServerUrl ifNil: [ ^ self ].

	self mcwPublicServerUrl: publicServerUrl
]
