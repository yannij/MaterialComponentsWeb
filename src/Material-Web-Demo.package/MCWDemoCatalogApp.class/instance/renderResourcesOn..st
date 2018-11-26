page - button
renderResourcesOn: html

	html heading level6; class: 'demo-title'; mdcTypography_headline6; with: 'Resources'.
	html anchor
		url: 'https://material.io/go/design-buttons';
		mdcRole: 'listitem'; mdcListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Material Design Guidelines icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_material_design_24px.svg'].
			html text: 'Material Design Guidelines'].
	html anchor
		url: 'https://material.io/components/web/catalog/buttons/';
		mdcRole: 'listitem'; mdcListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Documentation icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_drive_document_24px.svg'].
			html text: 'Documentation'].
	html anchor
		url: 'https://github.com/material-components/material-components-web/tree/master/packages/mdc-button';
		mdcRole: 'listitem'; mdcListItem; mdcRippleUpgraded; "target=""_blank"""
		with: [
			html span mdcListItem__graphic; with: [
				html image
					class: 'resources-icon';
					altText: 'Source Code icon';
					url: 'https://material-components.github.io/material-components-web-catalog/static/media/ic_code_24px.svg'].
			html text: 'Source Code']