rendering
renderDrawerHeaderOn: html

	(self drawerTitle notEmpty or: [self drawerSubtitle notEmpty]) ifTrue: [
		html div mdcDrawer__header; with: [
			self drawerTitle notEmpty ifTrue: [
				html div mdcDrawer__title; with: self drawerTitle].
			self drawerSubtitle notEmpty ifTrue: [
				html div mdcDrawer__subtitle; with: self drawerSubtitle]]
		]
