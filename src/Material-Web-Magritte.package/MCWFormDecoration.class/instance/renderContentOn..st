rendering
renderContentOn: html

	html form
		class: 'magritte';
		multipart: self requiresMultipartForm;
		defaultAction: [self execute: self default];
		with: [
			html div mdcCard; style: 'padding: 8px'; with: [
				self renderButtonsOn: html.
				self renderNextOn: html]]