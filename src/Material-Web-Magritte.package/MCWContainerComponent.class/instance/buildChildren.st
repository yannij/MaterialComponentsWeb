private
buildChildren
	| map |

	map := self magritteDescription componentClassMap.

	self magritteDescription
		componentClass: MCWContainerComponent;
		do: [ :eachChild | | theClass |
			theClass := map at: eachChild label ifAbsent: [ eachChild mcwComponentClass ].
			eachChild componentClass: theClass ].

	^ self magritteDescription
		inject: Dictionary new
		into: [ :result :each |
			each isVisible ifTrue: [
				result at: each put: (each componentClass
					memento: self memento description: each parent: self) ].
			result ]