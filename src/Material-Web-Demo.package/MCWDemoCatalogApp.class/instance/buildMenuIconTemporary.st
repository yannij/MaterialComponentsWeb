initialization
buildMenuIconTemporary
	| imagePath |

	imagePath := 'https://material-components-web.appspot.com/images/ic_component_24px_white.svg'.

	^(MCWAppBarMenuIcon imagePath: imagePath)
		ariaLabel: 'Menu';
		onClickScript: self openSideNavScript;
		yourself

