Class {
	#name : #MCWTopAppBarTtile,
	#superclass : #MCWWebComponent,
	#instVars : [
		'appBarTitle'
	],
	#category : #'Material-Web-Components'
}

{ #category : #'instance creation' }
MCWTopAppBarTtile class >> titled: aString [

	^ self new appBarTitle: aString
]

{ #category : #accessing }
MCWTopAppBarTtile >> appBarTitle [
	^ appBarTitle
]

{ #category : #accessing }
MCWTopAppBarTtile >> appBarTitle: anObject [
	appBarTitle := anObject
]

{ #category : #rendering }
MCWTopAppBarTtile >> renderContentOn: html [

	html span mdcTopAppBar__title; with: self appBarTitle
]
