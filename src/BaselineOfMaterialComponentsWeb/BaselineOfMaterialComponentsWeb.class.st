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
			self magritte: spec.

			spec
				package: 'Material-Web-Core' with: [ spec requires: #('Seaside3') ];
				package: 'Material-Web-Components' with: [ spec requires: #('Material-Web-Core') ];
				package: 'Material-Web-Magritte' with: [ spec requires: #('Magritte' 'Material-Web-Components') ];
				package: 'Material-Web-Responsive' with: [ spec requires: #('Material-Web-Magritte') ];
				package: 'Material-Study-Shrine' with: [ spec requires: #('Material-Web-Responsive') ];
				package: 'Material-Web-Demo' with: [ spec requires: #('Material-Web-Responsive') ].

			spec
				group: 'default' with: #('Material-Web-Responsive' 'Material-Web-Demo' 'Material-Study-Shrine');
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
BaselineOfMaterialComponentsWeb >> seaside: spec [

	spec
		baseline: 'Seaside3'
		with: [ spec repository: 'github://SeasideSt/Seaside:v3.4.4/repository';
			loads: #('Core' 'JSON' 'Email' 'Javascript' 'JQuery' 'Zinc' 'Seaside-Welcome') ].

]
