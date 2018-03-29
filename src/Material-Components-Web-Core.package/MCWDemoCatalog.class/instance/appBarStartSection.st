initialization
appBarStartSection
	| imagePath |

	imagePath := 'https://material-components-web.appspot.com/images/ic_component_24px_white.svg'.

	self isLayoutStructureDesktop not
		ifTrue: [
				^{
				(MCWToolbarMenuIcon imagePath: imagePath) ariaLabel: 'Menu'; onClickScript: self openSideNavScript; yourself
				}
			].

	^{}
