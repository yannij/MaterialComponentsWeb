Class {
	#name : #ShrineLogin,
	#superclass : #MDSLogin,
	#category : #'Material-Study-Shrine'
}

{ #category : #rendering }
ShrineLogin >> renderLoginHeaderOn: html [

	html section class: 'mcw-login-header'; with: [
		html div class: 'shrine-logo-spacer'.
		html html: (ShrineApp shrineSvg: 'shrine-logo').
		html heading level: 1; with: 'SHRINE' ]
]
