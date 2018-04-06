baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [
			spec
				package: 'Material-Components-Web-Core';
				package: 'Material-Components-Web-Examples' with: [ spec requires: #('Material-Components-Web-Core') ].

			spec
				group: 'default' with: #('Core' 'Examples');
				group: 'Core' with: #('Material-Components-Web-Core');
				group: 'Examples' with: #('Material-Components-Web-Examples') ]