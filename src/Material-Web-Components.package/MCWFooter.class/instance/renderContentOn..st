rendering
renderContentOn: html

	html footer
		id: self id;
		style:
"padding: 8px;"
'position: fixed;
bottom: 0;
width: 100%;
text-align: center;
color: white;
background-color: rgba(0, 0, 0, 0.7)';
		with: [
			"self renderSubComponentsOn: html"
			html render: self toolbar].
