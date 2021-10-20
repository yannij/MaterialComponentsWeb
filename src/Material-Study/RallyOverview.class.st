Class {
	#name : #RallyOverview,
	#superclass : #RallyView,
	#category : #'Material-Study-Rally'
}

{ #category : #rendering }
RallyOverview >> instanceList [
	"Do nothing"
]

{ #category : #rendering }
RallyOverview >> instanceList: aList limit: aNumber [

	^ aList
		ifNotNil: [ :value | value copyFrom: 1 to: (aNumber min: value size) ]
		ifNil: [ #() ]
]

{ #category : #rendering }
RallyOverview >> renderContentOn: html [

	self renderOverviewOn: html
]

{ #category : #rendering }
RallyOverview >> renderOverviewOn: html [

	html div mdcLayoutGrid with: [
		html div mdcLayoutGrid__inner; with: [
			html div mdcLayoutGrid__cell_span12; with: [
				html heading level2 mdcTypography_headline6; with: 'Alerts'.
				self renderAsCards: (self instanceList: RallyAlert instanceList limit: 4) on: html ].
			html div mdcLayoutGrid__cell_span6; with: [
				html heading level2 mdcTypography_headline6; with: 'Accounts'.
				html heading level2 mdcTypography_headline3; with: self totalAccountBalance.
				self renderAsList: (self instanceList: RallyAccount instanceList limit: 4) on: html ].
			html div mdcLayoutGrid__cell_span6; with: [
				html heading level2 mdcTypography_headline6; with: 'Bills'.
				html heading level2 mdcTypography_headline3; with: self totalBillAmount.
				self renderAsList: (self instanceList: RallyBill instanceList limit: 4) on: html ].
			html div mdcLayoutGrid__cell_span12; with: [
				html heading level2 mdcTypography_headline6; with: 'Budget Items'.
				html heading level2 mdcTypography_headline3;
					with: self totalBudgetItemAmountSpent, ' / ', self totalBudgetItemAmount.
				self renderAsList: (self instanceList: RallyBudgetItem instanceList limit: 4) on: html ]
			 ] ]
]

{ #category : #rendering }
RallyOverview >> totalAccountBalance [

	^ (RallyAccount instanceList sum: #balance) displayString
]

{ #category : #rendering }
RallyOverview >> totalBillAmount [

	^ (RallyBill instanceList sum: #amount) displayString
]

{ #category : #rendering }
RallyOverview >> totalBudgetItemAmount [

	^ (RallyBudgetItem instanceList sum: #amount) displayString
]

{ #category : #rendering }
RallyOverview >> totalBudgetItemAmountSpent [

	^ (RallyBudgetItem instanceList sum: #amountSpent) displayString
]
