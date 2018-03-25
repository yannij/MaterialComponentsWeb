rendering
renderGridDifferentSizesOn: html
	| s |

	s := 'box-sizing: border-box;
        background-color: #666666;
        height: 200px;
        padding: 8px;
        color: white;
        font-size: 1.5em'.

	html div
		class: 'mdc-layout-grid';
		with: [
			html div
				class: 'mdc-layout-grid__inner';
				with: [
					html div style: s;
						class: 'mdc-layout-grid__cell mdc-layout-grid__cell--span-6 mdc-layout-grid__cell--span-8-tablet';
						with: '6 (8 tablet)'.
					html div style: s;
						class: 'mdc-layout-grid__cell mdc-layout-grid__cell--span-4 mdc-layout-grid__cell--span-6-tablet';
						with: '4 (6 tablet)'.
					html div style: s;
						class: 'mdc-layout-grid__cell mdc-layout-grid__cell--span-2 mdc-layout-grid__cell--span-4-phone';
						with: '2 (4 phone)'.
					]].
