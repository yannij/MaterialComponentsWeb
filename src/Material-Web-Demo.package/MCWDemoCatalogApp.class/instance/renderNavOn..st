rendering - catalog page
renderNavOn: html

	html navigation mdcList; with: [

   		html anchor
				mdcRole: 'listitem';
				mdcListItem; mdcRippleUpgraded;
				tabIndex: -1;
				callback: [self pageName: #home];
				with: 'Home'.

		self catalogList do: [:eachItem |
			html anchor
				mdcRole: 'listitem';
				mdcListItem; mdcRippleUpgraded;
				tabIndex: -1;
				callback: [self pageName: eachItem first asSymbol];
				with: eachItem second].
	]