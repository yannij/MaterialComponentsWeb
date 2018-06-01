accessing
colorThemeCustomDark

	#(
('primary' '#FFCF44')
('on-primary' '#33333D')
('secondary' '#FFCF44')
('on-secondary' 'FFFFFF')
('surface:' '#33333D')
('on-surface:' '#FFFFFF')
('background' '#33333D')
('on-background' '#FFFFFF')
	) do: [:each |
		self colorTheme at: each first put: each second]