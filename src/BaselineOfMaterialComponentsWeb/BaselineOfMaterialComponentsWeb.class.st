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
				package: 'Material-Study-Shrine' with: [ spec requires: #('Material-Web-Magritte') ];
				package: 'Material-Web-Demo' with: [ spec requires: #('Material-Web-Magritte') ].

			spec
				group: 'default' with: #('Material-Web-Magritte' 'Material-Web-Demo' 'Material-Study-Shrine');
				group: 'MagritteComponents' with: #('Material-Web-Magritte');
				group: 'Components' with: #('Material-Web-Components');
				group: 'Core' with: #('Material-Web-Core');
				"Use preload for staged docker build"
				group: 'preload' with: #('Seaside3' 'Magritte') ]
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
			loads: #( 'OneClick' ) ].

]
