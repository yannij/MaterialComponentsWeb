rendering
renderContentOn: html

	html header
		id: self id;
		style:
'position: fixed;
width: 100%;
';
		with: [
			html render: self toolbar].
