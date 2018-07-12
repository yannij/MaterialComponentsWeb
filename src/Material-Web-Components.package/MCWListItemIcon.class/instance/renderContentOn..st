rendering
renderContentOn: html
	| tag |

	tag := html anchor.
	self selected ifTrue: [tag mdcListItem_selected].

	tag onClick: self onClickScript if: self hasOnClickScript.
	(self list notNil and: [self list id notNil])
		ifTrue: [tag onClick: self list closeScript if: true].

	tag
		callback: self callback if: self hasCallback;
		mdcListItem; with: [
			(self iconName notNil and: [self iconName notEmpty]) ifTrue: [
				html span
					mdcMaterialIcons; mdcListItem__graphic;
					attributeAt: 'aria-hidden' put: 'true';
					with: [html text: self iconName]].
			html text: self itemText]
