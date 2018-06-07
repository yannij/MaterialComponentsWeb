baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [
			spec
				package: 'Material-Web-Core';
				package: 'Material-Web-Components' with: [ spec requires: #('Material-Web-Core') ];
				package: 'Material-Web-Magritte' with: [ spec requires: #('Material-Web-Components') ];
				package: 'Material-Study-Shrine' with: [ spec requires: #('Material-Web-Components') ];
				package: 'Material-Web-Demo' with: [ spec requires: #('Material-Web-Components') ].

			spec
				group: 'default' with: #('Demo' 'Magritte' 'Shrine');
				group: 'demo' with: #('Demo');
				group: 'Components' with: #('Material-Web-Components');
				group: 'Magritte' with: #('Material-Web-Magritte');
				group: 'Shrine' with: #('Material-Study-Shrine');
				group: 'Demo' with: #('Material-Web-Demo') ]