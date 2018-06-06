rendering
renderContentOn: html

	html render: self toolbar
	"html header
		id: self id;
		style:
'position: fixed;
width: 100%;
';
		with: [
			html render: self toolbar]."
