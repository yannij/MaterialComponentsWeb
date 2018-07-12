rendering
renderContentOn: html

	html anchor
		id: self id;
		mdcButton;
		mdcButton_raised;
		style: 'margin: 16px';
		callback: self callback if: self hasCallback;
		with: [
			html text: self actionLabel].
