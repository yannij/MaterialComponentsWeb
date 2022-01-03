Class {
	#name : #MDSTopAppBarActionItem,
	#superclass : #MDSTopAppBarAction,
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MDSTopAppBarActionItem >> renderContentOn: html [

	self isHidden ifTrue: [ ^ self ].

	"html div mdcTouchTargetWrapper; with: [
		html button mdcButton__icon; mdcButton_touch; with: [
			html div mdcButton__ripple.
			html div mdcButton__touch.
			html span mdcMaterialIcons; mdcTopAppBar__actionItem; with: self iconName ] ]."

	html anchor
		mdcMaterialIcons;
		mdcTopAppBar__actionItem;
		style: 'text-decoration: none';
		style: 'margin: 0 4px';
		callback: self callback if: self hasCallback;
		onClickScript: self onClickScript if: self hasOnClickScript;
		with: self iconName
]
