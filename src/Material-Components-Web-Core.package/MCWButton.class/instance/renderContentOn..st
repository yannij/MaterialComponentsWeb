rendering
renderContentOn: html

	html button
		id: self id;
		mdcButton;
		mdcButton__raised;
		style: 'margin: 16px';
		onClick: self onClickScript if: self hasOnClickScript;
		with: [
			html text: self buttonLabel].
