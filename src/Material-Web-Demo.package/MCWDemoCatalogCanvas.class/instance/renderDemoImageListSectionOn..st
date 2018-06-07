rendering - image list
renderDemoImageListSectionOn: html

	html section class: 'example'; with: [
	html html: '
        <div dir="ltr">
          <div>
            <div class="mdc-form-field">
              <div class="mdc-checkbox mdc-checkbox--upgraded mdc-ripple-upgraded mdc-ripple-upgraded--unbounded" style="--mdc-ripple-fg-size:24px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:8px; --mdc-ripple-top:8px;">
                <input type="checkbox" class="mdc-checkbox__native-control" id="toggle-rtl" aria-labelledby="toggle-rtl-label">
                <div class="mdc-checkbox__background">
                  <svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24">
                    <path class="mdc-checkbox__checkmark-path" fill="none" stroke="white" d="M1.73,12.91 8.1,19.28 22.79,4.59"></path>
                  </svg>
                  <div class="mdc-checkbox__mixedmark"></div>
                </div>
              </div>
              <label for="toggle-rtl" id="toggle-rtl-label">Toggle RTL</label>
            </div>
          </div>
          <div>
            <div class="mdc-form-field">
              <div class="mdc-checkbox mdc-checkbox--upgraded mdc-ripple-upgraded mdc-ripple-upgraded--unbounded" style="--mdc-ripple-fg-size:24px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:8px; --mdc-ripple-top:8px;">
                <input type="checkbox" class="mdc-checkbox__native-control" id="toggle-radius" aria-labelledby="toggle-radius-label">
                <div class="mdc-checkbox__background">
                  <svg class="mdc-checkbox__checkmark" viewBox="0 0 24 24">
                    <path class="mdc-checkbox__checkmark-path" fill="none" stroke="white" d="M1.73,12.91 8.1,19.28 22.79,4.59"></path>
                  </svg>
                  <div class="mdc-checkbox__mixedmark"></div>
                </div>
              </div>
              <label for="toggle-radius" id="toggle-radius-label">Toggle Rounded Corners</label>
            </div>
          </div>
        </div>

        <h1 class="mdc-typography--headline5">Standard Image List</h1>
        <div>
          <div class="mdc-form-field">
            <div class="mdc-radio mdc-ripple-upgraded mdc-ripple-upgraded--unbounded" style="--mdc-ripple-fg-size:24px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:8px; --mdc-ripple-top:8px;">
              <input class="mdc-radio__native-control" type="radio" id="standard-label-below" name="standard-labels" checked="">
              <div class="mdc-radio__background">
                <div class="mdc-radio__outer-circle"></div>
                <div class="mdc-radio__inner-circle"></div>
              </div>
            </div>
            <label for="standard-label-below">Labels below images</label>
          </div>
          <div class="mdc-form-field">
            <div class="mdc-radio mdc-ripple-upgraded mdc-ripple-upgraded--unbounded" style="--mdc-ripple-fg-size:24px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:8px; --mdc-ripple-top:8px;">
              <input class="mdc-radio__native-control" type="radio" id="standard-label-protected" name="standard-labels">
              <div class="mdc-radio__background">
                <div class="mdc-radio__outer-circle"></div>
                <div class="mdc-radio__inner-circle"></div>
              </div>
            </div>
            <label for="standard-label-protected">Labels over images with text protection</label>
          </div>
          <div class="mdc-form-field">
            <div class="mdc-radio mdc-ripple-upgraded mdc-ripple-upgraded--unbounded" style="--mdc-ripple-fg-size:24px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:8px; --mdc-ripple-top:8px;">
              <input class="mdc-radio__native-control" type="radio" id="standard-label-none" name="standard-labels">
              <div class="mdc-radio__background">
                <div class="mdc-radio__outer-circle"></div>
                <div class="mdc-radio__inner-circle"></div>
              </div>
            </div>
            <label for="standard-label-none">No labels</label>
          </div>
        </div>'.

	self renderDemoImageListStandardOn: html.

	html html: '

        <h1 class="mdc-typography--headline5">Masonry Image List</h1>
        <div>
          <div class="mdc-form-field">
            <div class="mdc-radio mdc-ripple-upgraded mdc-ripple-upgraded--unbounded" style="--mdc-ripple-fg-size:24px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:8px; --mdc-ripple-top:8px;">
              <input class="mdc-radio__native-control" type="radio" id="masonry-label-below" name="masonry-labels" checked="">
              <div class="mdc-radio__background">
                <div class="mdc-radio__outer-circle"></div>
                <div class="mdc-radio__inner-circle"></div>
              </div>
            </div>
            <label for="masonry-label-below">Labels below images</label>
          </div>
          <div class="mdc-form-field">
            <div class="mdc-radio mdc-ripple-upgraded mdc-ripple-upgraded--unbounded" style="--mdc-ripple-fg-size:24px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:8px; --mdc-ripple-top:8px;">
              <input class="mdc-radio__native-control" type="radio" id="masonry-label-protected" name="masonry-labels">
              <div class="mdc-radio__background">
                <div class="mdc-radio__outer-circle"></div>
                <div class="mdc-radio__inner-circle"></div>
              </div>
            </div>
            <label for="masonry-label-protected">Labels over images with text protection</label>
          </div>
          <div class="mdc-form-field">
            <div class="mdc-radio mdc-ripple-upgraded mdc-ripple-upgraded--unbounded" style="--mdc-ripple-fg-size:24px; --mdc-ripple-fg-scale:1.66667; --mdc-ripple-left:8px; --mdc-ripple-top:8px;">
              <input class="mdc-radio__native-control" type="radio" id="masonry-label-none" name="masonry-labels">
              <div class="mdc-radio__background">
                <div class="mdc-radio__outer-circle"></div>
                <div class="mdc-radio__inner-circle"></div>
              </div>
            </div>
            <label for="masonry-label-none">No labels</label>
          </div>
        </div>
'.
	self renderDemoImageListMasonryOn: html]