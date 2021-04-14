Class {
	#name : #MCWListItemSelectionControl,
	#superclass : #MCWListItemComponent,
	#category : #'Material-Web-Components'
}

{ #category : #rendering }
MCWListItemSelectionControl >> renderContentOn: html [

	html listItem
		mdcListItem;
		mdcRole: 'menuitem';
		tabIndex: 0;
		with: [
			html html:
'
                <span class="mdc-list-item__graphic">
                  <div class="mdc-checkbox mdc-checkbox--upgraded mdc-ripple-upgraded mdc-ripple-upgraded--unbounded" style="--mdc-ripple-fg-size:24px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:8px; --mdc-ripple-top:8px;">
                    <input type="checkbox" class="mdc-checkbox__native-control" id="leading-checkbox-blueberries">
                    <div class="mdc-checkbox__background">
                      <svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24">
                        <path class="mdc-checkbox__checkmark-path" fill="none" stroke="white" d="M1.73,12.91 8.1,19.28 22.79,4.59"></path>
                      </svg>
                      <div class="mdc-checkbox__mixedmark"></div>
                    </div>
                  </div>
                </span>
                <label for="leading-checkbox-blueberries">',
self itemText, '</label>
' ]
]
