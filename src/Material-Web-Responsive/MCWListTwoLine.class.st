Class {
	#name : #MCWListTwoLine,
	#superclass : #MCWList,
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MCWListTwoLine >> listTagOn: html [

	^ html navigation
		mdcDeprecatedList;
		mdcList_dense_if: self mcwDenseView;
		mdcDeprecatedList_twoLine;
		mdcRole: 'list';
		yourself

]
