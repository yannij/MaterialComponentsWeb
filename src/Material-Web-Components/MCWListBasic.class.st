Class {
	#name : #MCWListBasic,
	#superclass : #MCWList,
	#category : #'Material-Web-Components'
}

{ #category : #rendering }
MCWListBasic >> listTagOn: html [

	^ html navigation
		mdcList;
		mdcRole: 'list';
		"class: self cssClass if: self cssClass notNil;"
		style: self mcwStyle;
		yourself

]
