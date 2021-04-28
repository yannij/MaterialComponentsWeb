Class {
	#name : #MCWListAvatar,
	#superclass : #MCWList,
	#category : #'Material-Web-Components'
}

{ #category : #rendering }
MCWListAvatar >> listTagOn: html [

	^ html navigation
		mdcList;
		mdcList_dense_if: self mcwDenseView;
		mdcList_avatarList;
		yourself

]
