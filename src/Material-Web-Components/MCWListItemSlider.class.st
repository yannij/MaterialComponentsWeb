Class {
	#name : #MCWListItemSlider,
	#superclass : #MCWListItemComponent,
	#category : 'Material-Web-Components'
}

{ #category : #rendering }
MCWListItemSlider >> renderContentOn: html [

	html listItem
		mdcListItem;
		mdcRole: 'menuitem';
		tabIndex: 0;
		with: [
			html html:
'<div id="continuous-mdc-slider" class="mdc-slider" tabindex="0" role="slider" aria-valuemin="0" aria-valuemax="50" aria-valuenow="20" aria-label="Select Value">
              <div class="mdc-slider__track-container">
                <div class="mdc-slider__track" style="transform: scaleX(0.4);"></div>
              </div>
              <div class="mdc-slider__thumb-container" style="transform: translateX(80px) translateX(-50%);">
                <svg class="mdc-slider__thumb" width="21" height="21">
                  <circle cx="10.5" cy="10.5" r="7.875"></circle>
                </svg>
                <div class="mdc-slider__focus-ring"></div>
              </div>
</div>']
]
