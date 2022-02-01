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
			self neoJSON: spec.
			self seaside: spec.
			self magritte: spec.

			spec
				package: 'DockerUtility' with: [ spec requires: #('Seaside3') ];
				package: 'Quasar-Components' with: [ spec requires: #('Seaside3') ];
				package: 'Quasar-Magritte' with: [ spec requires: #('Quasar-Components' 'Magritte') ];
				package: 'Quasar-Demo' with: [ spec requires: #('Material-Demo' 'Quasar-Magritte') ];
				package: 'Material-Web-Core' with: [ spec requires: #('Seaside3') ];
				package: 'Material-Web-Components' with: [ spec requires: #('Material-Web-Core') ];
				package: 'Material-Web-Magritte' with: [ spec requires: #('Material-Web-Components' 'Magritte') ];
				package: 'Material-Web-Responsive' with: [ spec requires: #('DockerUtility') ];
				package: 'Stripe' with: [ spec requires: #('Material-Web-Responsive') ];
				package: 'Material-Study' with: [ spec requires: #('Material-Web-Responsive' 'Material-Web-Magritte' 'Stripe') ];
				package: 'Material-Demo' with: [ spec requires: #('Material-Web-Responsive' 'Material-Web-Magritte') ].

			spec
				group: 'default' with: #('Quasar-Demo' 'Material-Web-Responsive' 'Material-Web-Magritte' 'Material-Demo' 'Material-Study');
				group: 'Responsive' with: #('Material-Web-Responsive');
				group: 'Components' with: #('Material-Web-Components') ]
]

{ #category : #dependencies }
BaselineOfMaterialComponentsWeb >> magritte: spec [

	spec
		baseline: 'Magritte'
		with: [ spec repository: 'github://magritte-metamodel/magritte:v3.7/source';
			loads: #( 'Magritte-Pharo-Seaside') ]
]

{ #category : #dependencies }
BaselineOfMaterialComponentsWeb >> neoJSON: spec [

	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON:v17/repository' ]
]

{ #category : #dependencies }
BaselineOfMaterialComponentsWeb >> seaside: spec [

	spec
		baseline: 'Seaside3'
		with: [ spec repository: 'github://SeasideSt/Seaside:v3.4.5/repository';
			loads: #('Core' 'JSON' 'Email' 'Javascript' 'JQuery' 'Zinc' 'Seaside-Welcome') ]
]
