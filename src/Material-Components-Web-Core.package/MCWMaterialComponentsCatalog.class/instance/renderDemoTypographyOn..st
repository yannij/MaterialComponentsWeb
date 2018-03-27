rendering - typography
renderDemoTypographyOn: html
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
		with: [html heading level2; mdcTypography__display4; with: 'Tt'].

	html section style: sectionStyle; with: [
		html heading level2; mdcTypography__display1; with: 'Styles'.
		html heading level1; mdcTypography__display4; with: 'Display 4'.
		html heading level1; mdcTypography__display3; with: 'Display 3'.
		html heading level1; mdcTypography__display2; with: 'Display 2'.
		html heading level1; mdcTypography__display1; with: 'Display 1'.
		html heading level1; mdcTypography__headline; with: 'Headline'.

		html heading level2; mdcTypography__title; with: [
			html text: 'Title '. 
			html span mdcTypography__caption; with: 'Caption'].

		html heading level3; mdcTypography__subheading2; with: 'Subheading 2'.
		html heading level4; mdcTypography__subheading1; with: 'Subheading 1'.

		html paragraph mdcTypography__body1; with: 'Body 1 paragraph. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'.

		html aside mdcTypography__body2; with: 'Body 2 text, calling something out.'.
	].

	html section style: sectionStyle; with: [
		html heading level2; mdcTypography__display1; mdcTypography__adjustMargin; with: 'Styles'.
		html heading level1; mdcTypography__display4; mdcTypography__adjustMargin; with: 'Display 4'.
		html heading level1; mdcTypography__display3; mdcTypography__adjustMargin; with: 'Display 3'.
		html heading level1; mdcTypography__display2; mdcTypography__adjustMargin; with: 'Display 2'.
		html heading level1; mdcTypography__display1; mdcTypography__adjustMargin; with: 'Display 1'.
		html heading level1; mdcTypography__headline; mdcTypography__adjustMargin; with: 'Headline'.

		html heading level2; mdcTypography__title; mdcTypography__adjustMargin; with: [
			html text: 'Title '. 
			html span mdcTypography__caption; mdcTypography__adjustMargin; with: 'Caption'].

		html heading level3; mdcTypography__subheading2; mdcTypography__adjustMargin; with: 'Subheading 2'.
		html heading level4; mdcTypography__subheading1; mdcTypography__adjustMargin; with: 'Subheading 1'.

		html paragraph mdcTypography__body1; mdcTypography__adjustMargin; with: 'Body 1 paragraph. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'.

		html aside mdcTypography__body2; mdcTypography__adjustMargin; with: 'Body 2 text, calling something out.'.
	].
