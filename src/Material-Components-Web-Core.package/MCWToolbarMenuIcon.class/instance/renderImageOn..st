rendering
renderImageOn: html
	| imageScript spanTag |

	self hasOnClickScript
		ifTrue: [imageScript := self onClickScript]
		ifFalse: [self hasCallback
			ifTrue: [imageScript := html javascript callback: [self callback value]; yourself]].

	spanTag := html span
		mdcToolbar__menuIcon;
		attributeAt: 'aria-label' put: self ariaLabel;
		onClick: imageScript;
		yourself.

	spanTag with: [html image url: self imagePath].
