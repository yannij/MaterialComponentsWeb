Class {
	#name : #MDSDeprecatedList,
	#superclass : #MDSAbstractList,
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MDSDeprecatedList >> listTagOn: html [

	^ html navigation
		mdcDeprecatedList;
		mdcList_dense_if: self mcwDenseView;
		mdcRole: 'list';
		"class: self cssClass if: self cssClass notNil;"
		yourself

]
