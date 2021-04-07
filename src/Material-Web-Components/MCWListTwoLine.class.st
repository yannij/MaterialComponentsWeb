Class {
	#name : #MCWListTwoLine,
	#superclass : #MCWList,
	#category : 'Material-Web-Components'
}

{ #category : #rendering }
MCWListTwoLine >> listTagOn: html [

	^html navigation
		mdcList;
		mdcList_twoLine;
		mdcRole: 'list';
		yourself

]
