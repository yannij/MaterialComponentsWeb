Class {
	#name : #MCWListTwoLine,
	#superclass : #MCWList,
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MCWListTwoLine >> listTagOn: html [

	^ html navigation
		mdcList;
		mdcList_dense_if: self mcwDenseView;
		mdcDeprecatedList_twoLine;
		mdcRole: 'list';
		yourself

]
