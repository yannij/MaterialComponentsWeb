Class {
	#name : #MCWFormDecoration,
	#superclass : #MAFormDecoration,
	#category : #'Material-Web-Magritte'
}

{ #category : #rendering }
MCWFormDecoration >> renderButtonsOLDOn: html [

			html div mdcLayoutGrid__cell; mdcLayoutGrid__cell_span4; with: [
				self buttons do: [ :each | | iconName |
					iconName := each key.
					iconName = 'save' ifTrue: [ iconName := 'done' ].
					html button mdcButton; mdcButton_raised;
						callback: [ self execute: each key ];
						with: [
							html span mdcMaterialIcons; mdcButton__icon; with: iconName.
							html text: each value ] ]
					separatedBy: [ html space; space ] ].

]

{ #category : #rendering }
MCWFormDecoration >> renderButtonsOn: html [
	| showDisabled |

	showDisabled := self decoratedComponent hasPendingChanges.

	html div mdcCard__actions; with: [
		html span mdcTypography_headline6; with: self decoratedComponent model mdPrimaryString.
		html div mdcCard__actionIcons; with: [
			html button
				mdcIconButton; mdcMaterialIcons; mdcCard__action; mdcCard__action_icon;
				mdcRippleUpgraded_unbounded; mdcRippleUpgraded; mdcAutoInit: 'MDCRipple';
			"	mdcElevation_z1;"
				"onClick: (html jQuery this closest: 'form'; triggerSubmit);
				callback: [self execute: #save];"
				"disabled: showDisabled;"
				onClick: (html jQuery post serializeForm);
				onClick: ((html jQuery ajax)
					callback: [ self execute: #save ];
					onComplete: html javascript refresh);
				with: 'done'.
			html button
				mdcIconButton; mdcMaterialIcons; mdcCard__action; mdcCard__action_icon;
				mdcRippleSurface; mdcRippleUpgraded_unbounded; mdcRippleUpgraded; mdcAutoInit: 'MDCRipple';
				"mdcElevation_z1;"
				"disabled: showDisabled;"
				onClick: ((html jQuery ajax)
					callback: [ self execute: #cancel ];
					onComplete: html javascript refresh);
				with: 'cancel'.
			]
		]
]

{ #category : #rendering }
MCWFormDecoration >> renderContentOn: html [

	html form
		class: 'magritte';
		attributeAt: 'autocomplete' put: 'off';
		multipart: self requiresMultipartForm;
		defaultAction: [ self execute: self default ];
		with: [
			html div mdcCard; "style: 'padding: 8px';" with: [
				self renderButtonsOn: html.
				self renderNextOn: html ] ]
]
