building
mcwPostBuild
	| list |

	list := self model readUsing: self magritteDescription.
	list size <= 5
		ifTrue: [self beExpanded]