rendering
renderViewerOn: html
	| sliderId |
'aria-valuemin="0" aria-valuemax="50" aria-valuenow="9"'.

	sliderId := html nextId.
	html div mdcFormField; with: [
	html label for: sliderId; with: self magritteDescription label.
	html space; space.
	html div
		"id: 'discrete-mdc-slider';"
		id: sliderId;
		mdcSlider; mdcSliderDiscrete;
		mdcRole: 'slider';
		mdcAutoInit: 'MDCSlider';
		tabIndex: 0;
		ariaLabel: 'Select Value';
		with: [
			html div
				mdcSlider__trackContainer;
				with: [html div mdcSlider__track"; style: 'transform: scaleX(0.18)'"].
			html div
				mdcSlider__thumbContainer;
				"style: 'transform: translateX(228.6px) translateX(-50%)';"
				style: 'transform: translateX(-50%)';
				with: [
					html div mdcSlider__pin; with: [
						html span mdcSlider__pinValueMarker with: '9'].
					html svg mdcSlider__thumb;
						attributeAt: 'width' put: '21';
						attributeAt: 'height' put: '21';
						with: [html html: '<circle cx="10.5" cy="10.5" r="7.875"></circle>'].
			html div mdcSlider__focusRing]]].
