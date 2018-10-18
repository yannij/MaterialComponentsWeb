private
buildChildren
	| map newChildren |

	map := self magritteDescription componentClassMap.

	self magritteDescription
		componentClass: MCWContainerComponent;
		do: [ :eachChild | | theClass |
			theClass := map at: eachChild label ifAbsent: [ eachChild mcwComponentClass ].
			eachChild componentClass: theClass ].

	newChildren := self magritteDescription
		inject: Dictionary new
		into: [ :result :each |
			each isVisible ifTrue: [
				| newComponent |
				newComponent := each componentClass memento: self memento description: each parent: self.
				newComponent mcwPostBuild.
				result at: each put: newComponent ].
			result ].

	^newChildren