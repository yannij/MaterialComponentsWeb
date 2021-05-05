Class {
	#name : #MCWListBasic,
	#superclass : #MCWList,
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MCWListBasic >> listTagOn: html [

	^ html navigation
		mdcList;
		mdcList_dense_if: self mcwDenseView;
		mdcRole: 'list';
		"class: self cssClass if: self cssClass notNil;"
		yourself

]
