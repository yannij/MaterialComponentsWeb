rendering
renderContentOn: html

	html anchor
		id: self id;
		class: 'mdc-button';
		class: 'mdc-button--raised' if: true;
		style: 'margin: 16px';
		callback: self callback;
		with: [
			html text: self buttonLabel].
