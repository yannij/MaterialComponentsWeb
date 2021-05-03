"
I represent the configuration values passed by Docker when deploying via a Docker container.

I load a config or secret file. The file should be located in the default Docker location,
or mapped by the Docker command invocation to appear in the Smalltalk image directory.

The default directory for a config is ""/"".
The default directory for a secret is ""/run/secrets/""

In this implementation the ""config"" and ""secret"" files are expected to be in json format,
and contain a single json dictionary. For example, the machine name for the mongo database
could be passed in a config file. Assume a file named ""mongo.json"" has content:
	{
		""mongo-host"":""mongo-data-center-1""
	}

Create the config in Docker using:
% docker config create mongo.json - < mongo.json

During image startup, or afterward, the following code needs to run:
	DockerDeploy current loadConfigNamed: 'mongo'

Then the config value is avaialbe using:
	DockerDeploy current at: 'mongo' atKey: 'mongo-host'
which should answer
	'mongo-data-center-1'
"
Class {
	#name : #DockerDeploy,
	#superclass : #Object,
	#instVars : [
		'configNames',
		'configs',
		'secretNames',
		'secrets'
	],
	#classVars : [
		'Current'
	],
	#classInstVars : [
		'default'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #accessing }
DockerDeploy class >> configNameDefault [

	^ 'default'
]

{ #category : #accessing }
DockerDeploy class >> current [

	^ Current ifNil: [ Current := self new ]
]

{ #category : #accessing }
DockerDeploy class >> currentReset [

	Current := nil
]

{ #category : #accessing }
DockerDeploy >> configNames [
	^ configNames
]

{ #category : #accessing }
DockerDeploy >> configNames: anObject [
	configNames := anObject
]

{ #category : #'api - configs' }
DockerDeploy >> configNamesAdd: aConfigName [

	self configNames add: aConfigName
]

{ #category : #'api - configs' }
DockerDeploy >> configNamesAddDefault [

	self configNamesAdd: self class configNameDefault
]

{ #category : #'api - configs' }
DockerDeploy >> configNamesRemove: aConfigName [

	self configNames remove: aConfigName ifAbsent: [ nil ]
]

{ #category : #accessing }
DockerDeploy >> configs [
	^ configs
]

{ #category : #accessing }
DockerDeploy >> configs: anObject [
	configs := anObject
]

{ #category : #'api - configs' }
DockerDeploy >> configsAt: aConfigName atKey: aKey [

	^ self configsAt: aConfigName atKey: aKey ifAbsent: [ nil ]
]

{ #category : #'api - configs' }
DockerDeploy >> configsAt: aConfigName atKey: aKey ifAbsent: aBlock [
	| json |

	json := self configs at: aConfigName ifAbsent: [ ^ aBlock value ].
	^ json at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
DockerDeploy >> configsAt: aString put: aJsonDictionary [

	self configs at: aString put: aJsonDictionary
]

{ #category : #initialization }
DockerDeploy >> initialize [

	super initialize.

	self configNames: Set new.
	self configs: Dictionary new.
	self secretNames: Set new.
	self secrets: Dictionary new
]

{ #category : #'api - configs' }
DockerDeploy >> loadAllConfigs [
	"
	DockerDeploy current loadAllConfigs
	"

	self configNames do: [ :eachName |
		self loadConfigNamed: eachName ]
]

{ #category : #'api - secrets' }
DockerDeploy >> loadAllSecrets [
	"
	DockerDeploy current loadAllSecrets
	"

	self secretNames do: [ :eachName |
		self loadSecretNamed: eachName ]
]

{ #category : #'api - configs' }
DockerDeploy >> loadConfigNamed: aString [
	"
	DockerDeploy current loadConfigNamed: DockerDeploy configNameDefault
	"
	| configFileName configFile json |

	configFileName := aString, '.json'.
	configFile := SmalltalkImage current imageDirectory / configFileName.
	configFile exists
		ifFalse: [ configFile := FileSystem root / configFileName ].

	json := WAJsonParser parse: configFile contents.

	self configsAt: aString put: json
]

{ #category : #'api - secrets' }
DockerDeploy >> loadSecretNamed: aSecretName [
	"
	DockerDeploy current loadSecretNamed: 'foobar'
	"
	| secretFileName secretFile json |

	secretFileName := aSecretName, '.json'.
	secretFile := SmalltalkImage current imageDirectory / secretFileName.
	secretFile exists
		ifFalse: [ secretFile := FileSystem root / 'run' / 'secrets' / secretFileName ].

	json := WAJsonParser parse: secretFile contents.

	self secretsAt: aSecretName put: json
]

{ #category : #private }
DockerDeploy >> runAppMethodsWithPragmaNamed: aPragmaName [
	| appRootClass |

	appRootClass := #MCWApplication asClassInEnvironment: Smalltalk globals ifAbsent: [ nil ].
	appRootClass ifNil: [ ^ self ].

	appRootClass allSubclasses do: [ :eachClass | | pragmas appMetaClass |
		appMetaClass := eachClass class.
		pragmas := Pragma allNamed: aPragmaName in: appMetaClass.
		pragmas do: [ :eachPragma |
			appMetaClass soleInstance perform: eachPragma method selector asSymbol ] ]
]

{ #category : #'api - deploy' }
DockerDeploy >> runStartup [
	"
	Invoke this method during Docker container start up.

	DockerDeploy current runStartup
	"

	self runStartupPreLoad.
	self loadAllConfigs.
	self loadAllSecrets.
	self runStartupPostLoad
]

{ #category : #private }
DockerDeploy >> runStartupPostLoad [

	self runAppMethodsWithPragmaNamed: #dockerDeployPostLoad
]

{ #category : #private }
DockerDeploy >> runStartupPreLoad [

	self runAppMethodsWithPragmaNamed: #dockerDeployPreLoad
]

{ #category : #accessing }
DockerDeploy >> secretNames [
	^ secretNames
]

{ #category : #accessing }
DockerDeploy >> secretNames: anObject [
	secretNames := anObject
]

{ #category : #'api - secrets' }
DockerDeploy >> secretNamesAdd: aSecretName [

	self secretNames add: aSecretName
]

{ #category : #'api - secrets' }
DockerDeploy >> secretNamesRemove: aSecretName [

	self secretNames remove: aSecretName ifAbsent: [ nil ]
]

{ #category : #accessing }
DockerDeploy >> secrets [
	^ secrets
]

{ #category : #accessing }
DockerDeploy >> secrets: anObject [
	secrets := anObject
]

{ #category : #'api - secrets' }
DockerDeploy >> secretsAt: aSecretName atKey: aKey [

	^ self secretsAt: aSecretName atKey: aKey ifAbsent: [ nil ]
]

{ #category : #'api - secrets' }
DockerDeploy >> secretsAt: aSecretName atKey: aKey ifAbsent: aBlock [
	| json |

	json := self secrets at: aSecretName ifAbsent: [ ^ aBlock value ].
	^ json at: aKey ifAbsent: aBlock
]

{ #category : #accessing }
DockerDeploy >> secretsAt: aString put: aJsonDictionary [

	self secrets at: aString put: aJsonDictionary
]
