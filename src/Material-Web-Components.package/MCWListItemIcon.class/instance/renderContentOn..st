rendering
renderContentOn: html
	| tag |

	tag := html anchor.
	self selected ifTrue: [tag mdcListItem__selected].
	tag
		callback: self callback;
		mdcListItem; with: [
			(self iconName notNil and: [self iconName notEmpty]) ifTrue: [
				html span
					mdcMaterialIcons; mdcListItem__graphic;
					attributeAt: 'aria-hidden' put: 'true';
					with: [html text: self iconName]].
			html text: self itemText]