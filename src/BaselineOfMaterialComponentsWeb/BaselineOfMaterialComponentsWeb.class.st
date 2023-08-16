Class {
	#name : #BaselineOfMaterialComponentsWeb,
	#superclass : #BaselineOf,
	#category : #BaselineOfMaterialComponentsWeb
}

{ #category : #baselines }
BaselineOfMaterialComponentsWeb >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			self seaside: spec.

			spec
				package: 'DockerUtility' with: [ spec requires: #('Seaside3') ];
				package: 'Material-Web-Core' with: [ spec requires: #('Seaside3') ];
				package: 'Material-Web-Components' with: [ spec requires: #('Material-Web-Core') ];
				package: 'Material-Web-Responsive' with: [ spec requires: #('DockerUtility') ];
				package: 'Material-Demo' with: [ spec requires: #('Material-Web-Responsive') ].

			spec
				group: 'default' with: #('Material-Demo');
				group: 'Responsive' with: #('Material-Web-Responsive');
				group: 'Components' with: #('Material-Web-Components') ]
]

{ #category : #dependencies }
BaselineOfMaterialComponentsWeb >> seaside: spec [

	spec
		baseline: 'Seaside3'
		with: [ spec repository: 'github://SeasideSt/Seaside:v3.4.5/repository';
			loads: #('Core' 'JSON' 'Email' 'Javascript' 'JQuery' 'Zinc' 'Seaside-Welcome') ]
]
