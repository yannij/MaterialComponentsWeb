accessing
colorThemeCustom

	#(
('primary' '#FEDBD0')
('on-primary' '#442C2E')
('secondary' '#FEEAE6')
('on-secondary' '442C2E')
('surface:' '#FFFBFA')
('on-surface:' '#442C2E')
('background' '#FFFFFF')
('on-background' '#442C2E')
	) do: [:each |
		self colorTheme at: each first put: each second]