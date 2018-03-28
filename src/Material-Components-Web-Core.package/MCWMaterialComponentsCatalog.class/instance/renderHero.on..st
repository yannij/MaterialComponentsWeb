rendering
renderHero: aText on: html
	| sectionStyle |

	sectionStyle := 'margin: 24px; padding: 24px; border: 1px solid #ddd'.

	html section
		style:
'display: flex;
flex-flow: row nowrap;
align-items: center;
justify-content: center;
height: 360px;
min-height: 360px;
background-color: rgba(0, 0, 0, .05);
';
		with: [html heading level2; mdcTypography__display4; with: aText].
