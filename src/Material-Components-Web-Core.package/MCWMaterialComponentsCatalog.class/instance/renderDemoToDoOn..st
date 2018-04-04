rendering
renderDemoToDoOn: html
	| sectionStyle |

	sectionStyle := 'margin: 24px; padding: 24px; border: 1px solid #ddd'.

	self renderHero: 'To Do' on: html.

	html section style: sectionStyle; with: [
		html heading level2; mdcTypography__display1; with: self buttonName].
