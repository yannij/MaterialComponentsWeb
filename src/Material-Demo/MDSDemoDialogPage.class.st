Class {
	#name : #MDSDemoDialogPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Demo-Catalog'
}

{ #category : #rendering }
MDSDemoDialogPage >> dialogOpenScript: anHtmlId [

	^ 'document.getElementById(''', anHtmlId, ''').MDCDialog.open()'
]

{ #category : #rendering }
MDSDemoDialogPage >> pageInfo [

	^ #(
	'Dialog'
	'Dialogs inform users about a specific task and may contain critical information, require decisions, or involve multiple tasks.'
	'https://material.io/go/design-dialogs'
	'https://material.io/components/web/catalog/dialogs/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-dialog'
	)
]

{ #category : #rendering }
MDSDemoDialogPage >> renderDemosOn: html [
	| alertId simpleId confirmationId scrollableId |

	alertId := self renderDialogAlertOn: html.
	simpleId := self renderDialogSimpleOn: html.
	confirmationId := self renderDialogConfirmationOn: html.
	scrollableId := self renderDialogScrollableOn: html.

	html button mdcButton; onClick: (self dialogOpenScript: alertId); with: 'Alert'.
	html button mdcButton; onClick: (self dialogOpenScript: simpleId); with: 'Simple'.
	html button mdcButton; onClick: (self dialogOpenScript: confirmationId); with: 'Confirmation'.
	html button mdcButton; onClick: (self dialogOpenScript: scrollableId); with: 'Scrollable'.
	html break; break; break; break
]

{ #category : #rendering }
MDSDemoDialogPage >> renderDialogAlertOn: html [
	| dialogId |

	dialogId := html nextId.
	html div mdcDialog; "mdcDialog_open;" id: dialogId; mdcRole: 'alertdialog'; mdcAutoInit: 'MDCDialog'; with: [
		html div mdcDialog__scrim.
		html div mdcDialog__container; with: [
			html div mdcDialog__surface; with: [
				html section mdcDialog__content; with: [
					html paragraph: 'Discard draft?' ].
				html footer mdcDialog__actions; with: [
					html button mdcButton; mdcDialog__button; mdcRippleUpgraded;
						attributeAt: 'data-mdc-dialog-action' put: 'cancel';
						with: 'Cancel'.
					html button mdcButton; mdcDialog__button; mdcRippleUpgraded;
						attributeAt: 'data-mdc-dialog-action' put: 'discard';
						with: 'Dicard' ] ] ] ].

	^ dialogId
]

{ #category : #rendering }
MDSDemoDialogPage >> renderDialogConfirmationOn: html [
	| dialogId data |

	data := #(
(0 'test-dialog-baseline-confirmation-radio-1' 'Never Gonna Give You Up')
(-1 'test-dialog-baseline-confirmation-radio-2' 'Hot Cross Buns')
(-1 'test-dialog-baseline-confirmation-radio-3' 'None')
).

	dialogId := html nextId.
	html div mdcDialog; id: dialogId; mdcRole: 'alertdialog'; mdcAutoInit: 'MDCDialog'; with: [
		html div mdcDialog__scrim.
		html div mdcDialog__container; with: [
			html div mdcDialog__surface; with: [
				html heading level2; mdcDialog__title; with: 'Phone ringtone'.
				html section mdcDialog__content; with: [
					html unorderedList mdcDeprecatedList; mdcDeprecatedList_avatarList; style: 'list-style-typ: none'; with: [
						data do: [ :eachItem |
						html listItem mdcDeprecatedListItem; tabIndex: 0; with: [
							html span mdcDeprecatedListItem__graphic; with: [
								html div mdcRadio with: [
									html radioButton mdcRadio__nativeControl
										id: eachItem second;
										name: 'test-dialog-baseline-confirmation-radio-group';
										with: [
											html div mdcRadio__background; with: [
												html div mdcRadio__outerCircle.
												html div mdcRadio__innerCircle ] ] ] ].
							html label for: eachItem second; with: eachItem third ] ] ] ].
				html footer mdcDialog__actions; with: [
					html button mdcButton; mdcDialog__button; mdcRippleUpgraded;
						attributeAt: 'data-mdc-dialog-action' put: 'close';
						with: 'Cancel'.
					html button mdcButton; mdcDialog__button; mdcRippleUpgraded; style: 'mdc-dialog__button--default';
						attributeAt: 'data-mdc-dialog-action' put: 'accept';
						with: 'OK' ] ] ] ].

	^ dialogId
]

{ #category : #rendering }
MDSDemoDialogPage >> renderDialogScrollableOn: html [
	| dialogId |

	dialogId := html nextId.
	html div mdcDialog; mdcDialog_scrollable; id: dialogId; mdcRole: 'alertdialog'; mdcAutoInit: 'MDCDialog'; with: [
		html div mdcDialog__scrim.
		html div mdcDialog__container; with: [
			html div mdcDialog__surface; with: [
				html heading level2; mdcDialog__title; with: 'The Wonderful Wizard of Oz'.
				self renderDialogScrollableSectionOn: html.
				html footer mdcDialog__actions; with: [
					html button mdcButton; mdcDialog__button; mdcRippleUpgraded;
						attributeAt: 'data-mdc-dialog-action' put: 'close';
						with: 'Cancel'.
					html button mdcButton; mdcDialog__button; mdcRippleUpgraded; style: 'mdc-dialog__button--default';
						attributeAt: 'data-mdc-dialog-action' put: 'accept';
						with: 'OK' ] ] ] ].

	^ dialogId
]

{ #category : #rendering }
MDSDemoDialogPage >> renderDialogScrollableSectionOn: html [
	| paragraphs |

	paragraphs := #(
'Dorothy lived in the midst of the great Kansas prairies, with Uncle Henry, who was a farmer, and Aunt Em, who was the farmer''s wife. Their house was small, for the lumber to build it had to be carried by wagon many miles. There were four walls, a floor and a roof, which made one room; and this room contained a rusty looking cookstove, a cupboard for the dishes, a table, three or four chairs, and the beds. Uncle Henry and Aunt Em had a big bed in one corner, and Dorothy a little bed in another corner. There was no garret at all, and no cellar--except a small hole dug in the ground, called a cyclone cellar, where the family could go in case one of those great whirlwinds arose, mighty enough to crush any building in its path. It was reached by a trap door in the middle of the floor, from which a ladder led down into the small, dark hole.'
'When Dorothy stood in the doorway and looked around, she could see nothing but the great gray prairie on every side. Not a tree nor a house broke the broad sweep of flat country that reached to the edge of the sky in all directions. The sun had baked the plowed land into a gray mass, with little cracks running through it. Even the grass was not green, for the sun had burned the tops of the long blades until they were the same gray color to be seen everywhere. Once the house had been painted, but the sun blistered the paint and the rains washed it away, and now the house was as dull and gray as everything else.'
'When Aunt Em came there to live she was a young, pretty wife. The sun and wind had changed her, too. They had taken the sparkle from her eyes and left them a sober gray; they had taken the red from her cheeks and lips, and they were gray also. She was thin and gaunt, and never smiled now. When Dorothy, who was an orphan, first came to her, Aunt Em had been so startled by the child''s laughter that she would scream and press her hand upon her heart whenever Dorothy''s merry voice reached her ears; and she still looked at the little girl with wonder that she could find anything to laugh at.'
'Uncle Henry never laughed. He worked hard from morning till night and did not know what joy was. He was gray also, from his long beard to his rough boots, and he looked stern and solemn, and rarely spoke.'
'It was Toto that made Dorothy laugh, and saved her from growing as gray as her other surroundings. Toto was not gray; he was a little black dog, with long silky hair and small black eyes that twinkled merrily on either side of his funny, wee nose. Toto played all day long, and Dorothy played with him, and loved him dearly.'
'Today, however, they were not playing. Uncle Henry sat upon the doorstep and looked anxiously at the sky, which was even grayer than usual. Dorothy stood in the door with Toto in her arms, and looked at the sky too. Aunt Em was washing the dishes.'
'From the far north they heard a low wail of the wind, and Uncle Henry and Dorothy could see where the long grass bowed in waves before the coming storm. There now came a sharp whistling in the air from the south, and as they turned their eyes that way they saw ripples in the grass coming from that direction also.'
).

	html section mdcDialog__content; with: [
		html paragraph: [
			html anchor url: 'https://www.gutenberg.org/ebooks/55'; target: '_blank'; with: 'Read the full book' ].
		paragraphs do: [ :eachParagraph | html paragraph: eachParagraph ] ]
]

{ #category : #rendering }
MDSDemoDialogPage >> renderDialogSimpleOn: html [
	| dialogId |

	dialogId := html nextId.
	html div mdcDialog; id: dialogId; mdcRole: 'alertdialog'; mdcAutoInit: 'MDCDialog'; with: [
		html div mdcDialog__scrim.
		html div mdcDialog__container; with: [
			html div mdcDialog__surface; with: [
				html heading level2; mdcDialog__title; with: 'Select an account'.
				html section mdcDialog__content; with: [
					html unorderedList mdcDeprecatedList; mdcDeprecatedList_avatarList; style: 'list-style-typ: none'; with: [
						html listItem mdcDeprecatedListItem; tabIndex: 0; attributeAt: 'data-mdc-dialog-action' put: 'user1@example.com'; with: [
							html span mdcMaterialIcons; mdcDeprecatedListItem__graphic; with: 'person'.
							html span: 'user1@example.com' ].
						html listItem mdcDeprecatedListItem; attributeAt: 'data-mdc-dialog-action' put: 'user2@example.com'; with: [
							html span mdcMaterialIcons; mdcDeprecatedListItem__graphic; with: 'person'.
							html span: 'user2@example.com' ].
						html listItem mdcDeprecatedListItem; tabIndex: -1; attributeAt: 'data-mdc-dialog-action' put: 'add'; with: [
							html span mdcMaterialIcons; mdcDeprecatedListItem__graphic; with: 'add'.
							html span: 'Add account' ] ] ] ] ] ].

	^ dialogId
]

{ #category : #rendering }
MDSDemoDialogPage >> renderHeroOn: html [
	| confirmationId |

	confirmationId := self renderDialogConfirmationOn: html.
	html button mdcButton; onClick: (self dialogOpenScript: confirmationId); with: 'Confirmation'
]
