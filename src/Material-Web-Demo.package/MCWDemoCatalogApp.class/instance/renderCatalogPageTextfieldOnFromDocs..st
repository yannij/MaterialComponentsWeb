page - textfield
renderCatalogPageTextfieldOnFromDocs: html

	html break; break; break; yourself.

	html html: '<label class="mdc-text-field mdc-text-field--filled">
  <span class="mdc-text-field__ripple"></span>
  <span class="mdc-floating-label" id="my-label-id">Hint text</span>
  <input class="mdc-text-field__input" type="text" aria-labelledby="my-label-id">
  <span class="mdc-line-ripple"></span>
</label>'.

	html break; break; html: '<label class="mdc-text-field mdc-text-field--filled mdc-text-field--no-label">
  <span class="mdc-text-field__ripple"></span>
  <input class="mdc-text-field__input" type="text" placeholder="Placeholder text" aria-label="Label">
  <span class="mdc-line-ripple"></span>
</label>'.

	html break; break; html: '<label class="mdc-text-field mdc-text-field--filled mdc-text-field--label-floating">
  <span class="mdc-text-field__ripple"></span>
  <span class="mdc-floating-label mdc-floating-label--float-above" id="my-label-id">
    Label in correct place
  </span>
  <input class="mdc-text-field__input" type="text" aria-labelledby="my-label-id" value="Pre-filled value">
  <span class="mdc-line-ripple"></span>
</label>'