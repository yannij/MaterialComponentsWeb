Class {
	#name : #MDSTopAppBarNavigationIcon,
	#superclass : #MDSTopAppBarAction,
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MDSTopAppBarNavigationIcon >> renderContentOn: html [

	self isHidden ifTrue: [ ^ self ].

	html anchor
		mdcMaterialIcons;
		mdcTopAppBar__navigationIcon;
		style: 'text-decoration: none';
		"style: 'margin: 0 2px';"
		callback: self callback if: self hasCallback;
		onClickScript: self onClickScript if: self hasOnClickScript;
		with: self iconName
]
