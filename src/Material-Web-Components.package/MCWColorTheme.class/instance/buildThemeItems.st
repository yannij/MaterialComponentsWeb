initialization
buildThemeItems

	#(
('primary' '6200ee')
"('on-primary' '#757de8')"
('secondary' '018786')
"('on-secondary' '#018786')"
"('background' '#fff')"
"('surface' '#fff')"
"('on-surface' '#ff6090')"
	) do: [:each |
		self themeItems at: each first put: (Color fromHexString: each second)].
