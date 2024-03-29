Class {
	#name : #MCWOneToManyComponent,
	#superclass : #MAOneToManyComponent,
	#instVars : [
		'expanded'
	],
	#category : #'Material-Web-Magritte'
}

{ #category : #'as yet unclassified' }
MCWOneToManyComponent >> associateToMany [
]

{ #category : #actions }
MCWOneToManyComponent >> beExpanded [

	self expanded: true
]

{ #category : #private }
MCWOneToManyComponent >> buildReport [

	^ (MCWReport rows: self value description: self reference)
		yourself
]

{ #category : #accessing }
MCWOneToManyComponent >> expanded [
	^ expanded
]

{ #category : #accessing }
MCWOneToManyComponent >> expanded: anObject [
	expanded := anObject
]

{ #category : #initialization }
MCWOneToManyComponent >> initialize [

	super initialize.

	self expanded: false
]

{ #category : #accessing }
MCWOneToManyComponent >> isExpanded [

	^ self expanded
]

{ #category : #building }
MCWOneToManyComponent >> mcwPostBuild [
	| list |

	list := self model readUsing: self magritteDescription.
	list size <= 5
		ifTrue: [ self beExpanded ]
]

{ #category : #rendering }
MCWOneToManyComponent >> renderAddButtonOn: html [

	html anchor
		mdcMaterialIcons; mdcIconButton;
		tabIndex: 0;
		onClick: ((html jQuery ajax)
			callback: [ self add ];
			onComplete: html javascript refresh);
		with: [ html div mdcButton__ripple; with: 'add' ]
]

{ #category : #rendering }
MCWOneToManyComponent >> renderAssociateManyButtonOn: html [

	html anchor
		mdcMaterialIcons; mdcIconButton; mdcButton__ripple;
		style: 'font-family: Material Icons Outlined';
		tabIndex: 0;
		onClick: ((html jQuery ajax)
			callback: [ self associateToMany ];
			onComplete: html javascript refresh);
		with: 'ballot'
]

{ #category : #rendering }
MCWOneToManyComponent >> renderExpandIconOnListId: listId on: html [
	| toggleOnValue toggleOffValue |

	"TODO: if initial value could be set, then don't need following toggle values"
	self expanded
		ifTrue: [
			toggleOnValue := '{"content": "expand_more", "label": "Show more"}'.
			toggleOffValue := '{"content": "expand_less", "label": "Show less"}' ]
		ifFalse: [
			toggleOffValue := '{"content": "expand_more", "label": "Show more"}'.
			toggleOnValue := '{"content": "expand_less", "label": "Show less"}' ].

	html span
		"mdcIconToggle;"
		mdcMaterialIcons;
		mdcIconButton;
		"mdcAutoInit: 'MDCIconToggle';"
		mdcRole: 'button';
		tabIndex: 0;
		attributeAt: 'data-toggle-on' put: toggleOnValue;
		attributeAt: 'data-toggle-off' put: toggleOffValue;
		"ariaLabel: 'Expand'; "
		onClick: ((html jQuery ajax)
			callback: [ self expanded: self expanded not ];
			onComplete: ((html jQuery id: listId) load html: [ :renderer | self renderListAjaxOn: renderer ]));
		with: [
			html div mdcButton__ripple;
				with: (self expanded ifTrue: [ 'expand_less' ] ifFalse: [ 'expand_more' ]) ]

]

{ #category : #rendering }
MCWOneToManyComponent >> renderExpandSwitchOnListId: listId on: html [
	| switchId |

	switchId := html nextId.

	html div mdcSwitch; with: [
		html div mdcSwitch__track.
		html div mdcSwitch__thumbUnderlay; with: [
			html mdcSwitch__thumb; with: [
				html checkbox
					mdcSwitch__nativeControl;
					id: switchId;
					value: self expanded;
					onChange: (html jQuery ajax
						callback: [ :value | self expanded: value = 'true' ] value: (JSStream on: 'event.target.checked');
						onComplete: ((html jQuery id: listId) load html: [ :renderer | self renderListAjaxOn: renderer ]));
			yourself ] ] ].
	html space; space; space.
	html label for: switchId; with: self magritteDescription label.

]

{ #category : #rendering }
MCWOneToManyComponent >> renderLabelOn: html [

	self magritteDescription mcwNavPriority ifNil: [
		^ html text: self magritteDescription label ].

	html div mdcChip; mdcRippleUpgraded; tabIndex: 0;
		"style: 'background: #', nil mdColorCode asHexString;"
		onClick: ((html jQuery ajax)
			callback: [ self mcwApplicationGet navTo: self memento model aspect: self magritteDescription label ];
			onComplete: html javascript refresh);
		with: self magritteDescription label
]

{ #category : #rendering }
MCWOneToManyComponent >> renderListAjaxOn: html [

	self isExpanded
		ifFalse: [ ^ self ].

	html unorderedList
		mdcDeprecatedList;
		mdcDeprecatedList_dense;
		mdcDeprecatedList_twoLine;
		"style: 'border: 1px solid rgba(0, 0, 0, 0.1);';"
		with: [
			self value do: [ :eachItem |
				html listItem
					mdcDeprecatedListItem;
					with: [
						html span
							mdcDeprecatedListItem__text;
							onClick: ((html jQuery ajax)
								callback: [ self mcwApplicationGet navTo: eachItem aspect: nil ];
								onComplete: html javascript refresh);
							with: [
								html text: eachItem mdPrimaryString.
								html span
									mdcListItem__secondaryText;
									with: eachItem mdSecondaryString ].
						"html span mdcListItem__meta; with: [
							html span mdcMaterialIcons; mdcAriaHidden: 'true'; with: 'more_vert']"
						] ] ]
]

{ #category : #'rendering-buttons' }
MCWOneToManyComponent >> renderSelectButtonOn: html [

	"Place the add button elsewhere"
	"html submitButton on: #add of: self"
]

{ #category : #rendering }
MCWOneToManyComponent >> renderViewerOn: html [
	| listId |

	listId := html nextId.

	html div
		mdcListGroup;
		style: 'border-bottom: 1px solid rgba(0, 0, 0, 0.4);';
		style: 'margin: 4px 4px 0 4px';
		style: 'background: ', self mdsTextFieldBackground;
		with: [
			html heading level3; mdcListGroup__subheader; with: [
				self renderLabelOn: html.
				self renderAddButtonOn: html.
				self renderAssociateManyButtonOn: html.
				self renderExpandIconOnListId: listId on: html ].

		html div id: listId; with: [ self renderListAjaxOn: html ] ]
]
