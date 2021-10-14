Class {
	#name : #MCWList,
	#superclass : #MDSAbstractList,
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MCWList >> listTagOn: html [

	^ html navigation
		mdcDeprecatedList;
		mdcList_dense_if: self mcwDenseView;
		mdcRole: 'list';
		"class: self cssClass if: self cssClass notNil;"
		yourself

]
