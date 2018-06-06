private
buildChildren

	self magritteDescription
		componentClass: MCWContainerComponent;
		do: [:eachChild | eachChild componentClass: eachChild mcwComponentClass].

	^ self magritteDescription
		inject: Dictionary new
		into: [ :result :each |
			each isVisible ifTrue: [
				result at: each put: (each componentClass
					memento: self memento description: each parent: self) ].
			result ]