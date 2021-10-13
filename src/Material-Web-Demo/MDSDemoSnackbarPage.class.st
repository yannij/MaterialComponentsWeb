Class {
	#name : #MDSDemoSnackbarPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoSnackbarPage >> pageInfo [

	^ #(
	'Snackbar'
	'Snackbars provide brief messages about app processes at the bottom of the screen.'
	'https://material.io/go/design-snackbar'
	'https://material.io/components/web/catalog/snackbars/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-snackbar'
	)
]

{ #category : #rendering }
MDSDemoSnackbarPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoSnackbarPage >> renderHeroOn: html [

	html html: '<div class="snackbar-hero"><div class="mdc-snackbar mdc-snackbar--open"><div class="mdc-snackbar__surface"><div class="mdc-snackbar__label" role="status" aria-live="polite">Can''t send photo. Retry in 5 seconds.</div><div class="mdc-snackbar__actions"><button type="button" class="mdc-button mdc-snackbar__action"><div class="mdc-button__ripple"></div>Retry</button><button class="mdc-icon-button mdc-snackbar__dismiss material-icons" title="Dismiss">close</button></div></div></div></div>'
]
