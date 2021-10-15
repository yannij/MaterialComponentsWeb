Class {
	#name : #MDSTopAppBarActionItem,
	#superclass : #MDSTopAppBarAction,
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MDSTopAppBarActionItem >> renderContentOn: html [

	self isHidden ifTrue: [ ^ self ].

	html anchor
		mdcMaterialIcons;
		mdcTopAppBar__actionItem;
		style: 'text-decoration: none';
		callback: self callback if: self hasCallback;
		onClickScript: self onClickScript if: self hasOnClickScript;
		with: self iconName
]
