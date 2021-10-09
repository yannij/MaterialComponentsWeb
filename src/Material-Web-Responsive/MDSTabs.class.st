Class {
	#name : #MDSTabs,
	#superclass : #MCWComponent,
	#instVars : [
		'tabs'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSTabs >> do: aBlock [

	self tabs do: aBlock
]

{ #category : #initialization }
MDSTabs >> initialize [

	super initialize.

	self tabs: OrderedCollection new
]

{ #category : #rendering }
MDSTabs >> renderContentOn: html [

	self renderTabsOn: html
]

{ #category : #rendering }
MDSTabs >> renderTabsOn: html [

	html div mdcTabBar; mdcAutoInit: 'MDCTabBar'; with: [
		html div mdcTabScroller; "mdcAutoInit: 'MDCTabScroller';" with: [
			html div mdcTabScroller__scrollArea; mdcTabScroller__scrollArea_scroll; with: [
				html div mdcTabScroller__scrollContent; with: [
					self tabs do: [ :eachTab | html render: eachTab ] ] ] ] ]
]

{ #category : #accessing }
MDSTabs >> tabs [

	^ tabs
]

{ #category : #accessing }
MDSTabs >> tabs: anObject [

	tabs := anObject
]

{ #category : #accessing }
MDSTabs >> tabsAdd: aTab [

	self tabs add: aTab
]
