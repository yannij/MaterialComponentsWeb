page - button
renderResources: resources on: html

	html heading level6; class: 'demo-title'; mdcTypography_headline6; with: 'Resources'.
	html anchor
		url: resources first;
		mdcRole: 'listitem'; mdcListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Material Design Guidelines icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_material_design_24px.svg'].
			html text: 'Material Design Guidelines'].
	html anchor
		url: resources second;
		mdcRole: 'listitem'; mdcListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Documentation icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_drive_document_24px.svg'].
			html text: 'Documentation'].
	html anchor
		url: resources third;
		mdcRole: 'listitem'; mdcListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Source Code icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_code_24px.svg'].
			html text: 'Source Code']