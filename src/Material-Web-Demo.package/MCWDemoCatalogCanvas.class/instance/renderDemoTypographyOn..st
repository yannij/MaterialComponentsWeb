rendering - typography
renderDemoTypographyOn: html
	| sectionStyle |

	html section class: 'hero'; with: [
			html heading level2; mdcTypography_headline1; with: 'Tt'].

	sectionStyle := 'margin: 24px; padding: 24px; border: 1px solid #ddd'.

	html section style: sectionStyle; with: [
		html heading level2; mdcTypography_headline6; with: 'Styles'.
		html heading level1; mdcTypography_headline1; with: 'Headline 1'.
		html heading level2; mdcTypography_headline2; with: 'Headline 2'.
		html heading level3; mdcTypography_headline3; with: 'Headline 3'.
		html heading level4; mdcTypography_headline4; with: 'Headline 4'.
		html heading level5; mdcTypography_headline5; with: 'Headline 5'.
		html heading level6; mdcTypography_headline6; with: 'Headline 6'.
		html heading level6; mdcTypography_subtitle1; with: 'Subtitle 1'.
		html heading level6; mdcTypography_subtitle2; with: 'Subtitle 2'.

		html heading level2; mdcTypography_title; with: [
			html text: 'Title '. 
			html span mdcTypography_caption; with: 'Caption'].

		html paragraph mdcTypography_body1; with: 'Body 1 paragraph. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'.

		html aside mdcTypography_body2; with: 'Body 2 text, calling something out.'.
	].
