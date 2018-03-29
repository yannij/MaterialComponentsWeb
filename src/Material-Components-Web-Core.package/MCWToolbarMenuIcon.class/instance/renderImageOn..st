rendering
renderImageOn: html
	| spanTag |

	spanTag := html span
		mdcToolbar__menuIcon;
		attributeAt: 'aria-label' put: self ariaLabel;
		onClick: self onClickScript if: self hasOnClickScript;
		yourself.

	spanTag with: [html image url: self imagePath].
