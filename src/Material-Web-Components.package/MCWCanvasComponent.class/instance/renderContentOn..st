rendering
renderContentOn: html 

	self view isNil
		ifTrue: [^html div id: 'setup'; class: 'setup'; with: 'hello world'].

	html render: self view