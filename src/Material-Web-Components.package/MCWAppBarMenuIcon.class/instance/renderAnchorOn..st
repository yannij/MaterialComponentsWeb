rendering
renderAnchorOn: html

	html anchor
		mdcMaterialIcons;
		mdcTopAppBar__navigationIcon;
		mdcTopAppBar__actionItem;
		attributeAt: 'aria-label' put: self ariaLabel;
		callback: self callback if: self hasCallback;
		onClick: self onClickScript if: self hasOnClickScript;
		with: self iconName
