rendering
renderViewerOn: html
	| sliderId hiddenInputRangeId |

	sliderId := html nextId.
	hiddenInputRangeId := html nextId.

	html div mdcFormField; with: [
	html textInput
		id: hiddenInputRangeId;
		"attributeAt: 'hidden' put: 'true';"
		on: #string of: self.
	].

	html div mdcFormField; with: [
	html label for: sliderId; with: self magritteDescription label.
	html space; space.
	html div
		"id: 'discrete-mdc-slider';"
		id: sliderId;
		mdcSlider; mdcSliderDiscrete;
		mdcRole: 'slider';
		"mdcAutoInit: 'MDCSlider';"
		tabIndex: 0;
		ariaLabel: 'Select Value';
		onChange: (html jQuery
				script: [ :s | s << (html jQuery id: hiddenInputRangeId)
					value: ((html jQuery id: sliderId) value) ]);
		script: (html javascript add: (JSStream new
				nextPutAll: 'var sliderEl = document.getElementById(''', sliderId, ''');';
				nextPutAll: 'var foobar = new mdc.slider.MDCSlider(sliderEl);';
				nextPutAll: 'foobar.listen(''MDCSlider:change'', function() {';
				nextPutAll: 'document.getElementById(''', hiddenInputRangeId, ''').value = foobar.value.toString();';
				"nextPutAll: 'document.getElementById(''', 'foobar', ''').textContent = foobar.value;';"
				nextPutAll: '});';
				yourself)
				);
		with: [
			html div
				mdcSlider__trackContainer;
				with: [html div mdcSlider__track].
			html div
				mdcSlider__thumbContainer;
				"style: 'transform: translateX( (<parent-width> / 21) * 100 %)'; --needs Javascript to set the initial translateX value"
				with: [
					html div mdcSlider__pin; with: [
						html span mdcSlider__pinValueMarker
							with: self value].
					html svg mdcSlider__thumb;
						attributeAt: 'width' put: '21';
						attributeAt: 'height' put: '21';
						with: [html html: '<circle cx="10.5" cy="10.5" r="7.875"></circle>'].
					html div mdcSlider__focusRing]]].
