rendering
renderContentOn: html

	html button
		id: self id;
		class: 'mdc-button';
		class: 'mdc-button--raised' if: true;
		style: 'margin: 16px';
		onClick: self onClickScript if: self hasOnClickScript;
		with: [
			html text: self buttonLabel].
