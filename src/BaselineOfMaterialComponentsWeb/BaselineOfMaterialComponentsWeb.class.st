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
				package: 'Material-Web-CoreExtra' with: [ spec requires: #('Material-Web-Core') ];
				package: 'Material-Web-Components' with: [ spec requires: #('Material-Web-CoreExtra' 'Magritte') ];
				package: 'Material-Study-Shrine' with: [ spec requires: #('Material-Web-Components') ];
				package: 'Material-Web-Demo' with: [ spec requires: #('Material-Web-Components') ].

			spec
				group: 'default' with: #('Demo' 'Shrine');
				group: 'Components' with: #('Material-Web-Components');
				group: 'Shrine' with: #('Material-Study-Shrine');
				group: 'Demo' with: #('Material-Web-Demo') ]
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
		with: [ spec repository: 'github://SeasideSt/Seaside:master/repository';
			loads: #( 'default' ) ].

]
