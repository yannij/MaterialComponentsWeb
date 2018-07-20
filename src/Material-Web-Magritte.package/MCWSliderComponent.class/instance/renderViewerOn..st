rendering
renderViewerOn: html
	| sliderId sliderElementId sliderThumbContainerId hiddenInputRangeId |

	sliderId := html nextId.
	sliderElementId := sliderId, '_slider'.
	sliderThumbContainerId := sliderId, '_thumbContainer'.
	hiddenInputRangeId := html nextId.

	html div mdcFormField; with: [
	html textInput
		id: hiddenInputRangeId;
		attributeAt: 'hidden' put: 'true';
		on: #string of: self.
	].

	html div mdcFormField; with: [
	html label for: sliderId; with: self magritteDescription label.
	html space; space.
	html div
		id: sliderId;
		mdcSlider; mdcSlider_discrete;
		mdcRole: 'slider';
		"mdcAutoInit: 'MDCSlider';"
		tabIndex: 0;
		ariaLabel: 'Select Value';
		script: (html javascript add: (JSStream new
				nextPutAll: 'var sliderEl = document.getElementById(''', sliderId, ''');';
				nextPutAll: sliderElementId, ' = new mdc.slider.MDCSlider(sliderEl);';
				nextPutAll: sliderElementId, '.foundation_.setValue(', self value printString, ');';
				nextPutAll: '', sliderElementId, '.listen(''MDCSlider:change'', function() {';
				nextPutAll: 'document.getElementById(''', hiddenInputRangeId, ''').value = ', sliderElementId, '.value.toString();';
				nextPutAll: '});';
				yourself)
				);
		with: [
			html div
				mdcSlider__trackContainer;
				with: [html div mdcSlider__track].
			html div
				mdcSlider__thumbContainer;
				id: sliderThumbContainerId;
				with: [
					html div mdcSlider__pin; with: [
						html span mdcSlider__pinValueMarker
							with: self value].
					html svg mdcSlider__thumb;
						attributeAt: 'width' put: '21';
						attributeAt: 'height' put: '21';
						with: [html html: '<circle cx="10.5" cy="10.5" r="7.875"></circle>'].
					html div mdcSlider__focusRing]]].
