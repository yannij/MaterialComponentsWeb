Class {
	#name : #MCWButton,
	#superclass : #MCWActionComponent,
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MCWButton >> renderContentOn: html [

	html button
		id: self id;
		mdcButton;
		mdcButton_raised;
		style: 'margin: 16px';
		onClickScript: self onClickScript if: self hasOnClickScript;
		with: [
			self hasActionLabel
				ifTrue: [ html text: self actionLabel ] ].

]
