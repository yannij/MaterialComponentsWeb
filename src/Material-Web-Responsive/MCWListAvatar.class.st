Class {
	#name : #MCWListAvatar,
	#superclass : #MCWList,
	#category : #'Material-Web-Responsive'
}

{ #category : #rendering }
MCWListAvatar >> listTagOn: html [

	^ html navigation
		mdcDeprecatedList;
		mdcList_dense_if: self mcwDenseView;
		mdcList_avatarList;
		yourself

]
