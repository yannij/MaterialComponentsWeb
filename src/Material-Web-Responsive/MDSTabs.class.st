Class {
	#name : #MDSTabs,
	#superclass : #MDSComponent,
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
MDSTabs >> showIconInline [

	self tabs do: [ :eachTab | eachTab showStacked: false ]
]

{ #category : #accessing }
MDSTabs >> showIconOff [

	self tabs do: [ :eachTab | eachTab showIcon: false ]
]

{ #category : #accessing }
MDSTabs >> showIconOn [

	self tabs do: [ :eachTab | eachTab showIcon: true ]
]

{ #category : #accessing }
MDSTabs >> showIconStacked [

	self tabs do: [ :eachTab | eachTab showStacked: true ]
]

{ #category : #accessing }
MDSTabs >> showLabelOff [

	self tabs do: [ :eachTab | eachTab showLabel: false ]
]

{ #category : #accessing }
MDSTabs >> showLabelOn [

	self tabs do: [ :eachTab | eachTab showLabel: true ]
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
