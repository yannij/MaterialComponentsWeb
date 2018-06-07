rendering
renderImageOn: html
	| imageScript |

	self hasOnClickScript
		ifTrue: [imageScript := self onClickScript]
		ifFalse: [self hasCallback
			ifTrue: [imageScript := html javascript callback: [self callback value]; yourself]].

	html span
		mdcTopAppBar__actionItem;
		mdcTopAppBar__navigationIcon;
		attributeAt: 'aria-label' put: self ariaLabel;
		onClick: imageScript;
		with: [
			html image url: self imagePath].
