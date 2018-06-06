rendering
renderAnchorOn: html
	| anchorTag |

	anchorTag := html anchor
		"mdcToolbar__menuIcon;"
		mdcTopAppBar__actionItem;
		attributeAt: 'aria-label' put: self ariaLabel;
		callback: self callback if: self hasCallback;
		onClick: self onClickScript if: self hasOnClickScript;
		yourself.

	anchorTag
		mdcMaterialIcons;
		with: self iconName.
