Class {
	#name : #MCWListAvatar,
	#superclass : #MCWList,
	#category : #'Material-Web-Components'
}

{ #category : #rendering }
MCWListAvatar >> listTagOn: html [

	^ (super listTagOn: html)
		mdcList_avatarList;
		yourself

]
