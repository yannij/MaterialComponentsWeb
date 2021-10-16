Class {
	#name : #MDSLayoutAutoResponsive,
	#superclass : #MDSLayout,
	#instVars : [
		'layouts',
		'currentLayout'
	],
	#category : #'Material-Web-Responsive'
}

{ #category : #accessing }
MDSLayoutAutoResponsive >> currentLayout [

	^ currentLayout
]

{ #category : #accessing }
MDSLayoutAutoResponsive >> currentLayout: anObject [

	currentLayout := anObject
]

{ #category : #accessing }
MDSLayoutAutoResponsive >> currentLayoutSet: aLayoutSymbol [

	self currentLayout: (self layouts at: aLayoutSymbol ifAbsent: [ nil ]).
	self currentLayout initializeComplete
]

{ #category : #initialization }
MDSLayoutAutoResponsive >> initializeOn: anApplication [

	super initializeOn: anApplication.

	self layouts: (OrderedDictionary new
		at: self class layoutExtraSmall put: ((MDSLayoutExtraSmall on: anApplication) initializeComplete; yourself);
		at: self class layoutSmall put: ((MDSLayoutSmall on: anApplication) initializeComplete; yourself);
		at: self class layoutMedium put: ((MDSLayoutMedium on: anApplication) initializeComplete; yourself);
		at: self class layoutLarge put: ((MDSLayoutLarge on: anApplication) initializeComplete; yourself);
		yourself).

	self currentLayout: (self layouts at: self class layoutMedium)
]

{ #category : #accessing }
MDSLayoutAutoResponsive >> layouts [

	^ layouts
]

{ #category : #accessing }
MDSLayoutAutoResponsive >> layouts: anObject [

	layouts := anObject
]

{ #category : #rendering }
MDSLayoutAutoResponsive >> renderContentOn: html [

	self renderResizeScriptOn: html.
	self renderResizeOnloadScriptOn: html.

	html render: self currentLayout
]

{ #category : #rendering }
MDSLayoutAutoResponsive >> renderResizeOnloadScriptOn: html [
	| sizeTestString layoutStyle |

	layoutStyle := self layouts keyAtValue: self currentLayout ifAbsent: [ nil ].

	sizeTestString := nil.
	layoutStyle = self class layoutExtraSmall ifTrue: [
		sizeTestString := 'window.innerWidth >= 600' ].
	layoutStyle = self class layoutSmall ifTrue: [
		sizeTestString := 'window.innerWidth < 600 || window.innerWidth >= 1240' ].
	layoutStyle = self class layoutMedium ifTrue: [
		sizeTestString := 'window.innerWidth < 1240 || window.innerWidth >= 1440' ].
	layoutStyle = self class layoutLarge ifTrue: [
		sizeTestString := 'window.innerWidth < 1440' ].

	sizeTestString ifNil: [
		^ self ].

	html document addLoadScript: (JSStream on: 'if (', sizeTestString, ') window.dispatchEvent(new Event(''resize''))').
]

{ #category : #rendering }
MDSLayoutAutoResponsive >> renderResizeScriptOn: html [

	html html:
'<script>
window.addEventListener("resize", '
, (JSStream new argument:
	(html jQuery ajax
		callback: [ :value | self resizeString: value ] value: (JSStream on: '"[" + window.innerWidth + "," + window.innerHeight + "]"');
		onComplete: html javascript refresh) asFunction;
		yourself) contents, ')'
, '</script>'.

	"html document addLoadScript: (JSStream on: 'window.addEventListener(""resize"", function(){alert(""hhh"")})').
	html document addLoadScript: (JSStream on: 'document.querySelector(""body"").onresize=function(){alert(""ggg"")}')."

]

{ #category : #rendering }
MDSLayoutAutoResponsive >> resizeString: aString [
	"Change layout based on window width breakpoints:
		Extra-small (phone) 0-599
		Small (tablet) 600-904,905-1239
		Medium (laptop) 1240-1439
		Large (desktop) 1440+
	"
	| newSize newWidth newHeight |

	"Transcript crShow: aString. (Delay forSeconds: 1) wait."
	newSize := WAJsonParser parse: aString.
	newWidth := newSize first.
	newHeight := newSize second.

	newWidth < 600 ifTrue: [
		self currentLayoutSet: self class layoutExtraSmall.
		^ self ].

	newWidth < 1240 ifTrue: [
		self currentLayoutSet: self class layoutSmall.
		^ self ].

	newWidth < 1440 ifTrue: [
		self currentLayoutSet: self class layoutMedium.
		^ self ].

	self currentLayoutSet: self class layoutLarge
]
