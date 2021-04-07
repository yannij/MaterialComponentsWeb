page - textfield
renderCatalogPageTextfieldOn: html
	| labelId |

	html break; break; break; yourself.

	html break; break; html: '<label class="mdc-text-field mdc-text-field--filled mdc-text-field--label-floating">
  <span class="mdc-text-field__ripple"></span>
  <span class="mdc-floating-label mdc-floating-label--float-above" id="my-label-id">
    Label in correct place
  </span>
  <input class="mdc-text-field__input" type="text" aria-labelledby="my-label-id" value="Pre-filled value">
  <span class="mdc-line-ripple"></span>
</label>'.
	html break; break.
	labelId := html nextId.
	html label
		mdcTextField; mdcTextField_filled; mdcTextField_labelFloating; mdcAutoInit: 'MDCTextField';
		with: [
			html span mdcTextField__ripple.
			html span mdcFloatingLabel; "mdcFloatingLabel_floatAbove;" mdcAutoInit: 'MDCFloatingLabel';
				id: labelId;
				with: 'Label in correct place'.
			html textInput mdcTextField__input; ariaDescribedBy: labelId; yourself.
			html span mdcLineRipple ].
		