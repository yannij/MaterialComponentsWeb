Class {
	#name : #MDSDemoTopAppBarPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MDSDemoTopAppBarPage >> pageInfo [

	^ #(
	'Top App Bar'
	'Top App Bars are a container for items such as application title, navigation icon, and action items.'
	'https://material.io/go/design-app-bar-top'
	'https://material.io/components/web/catalog/top-app-bar/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-top-app-bar'
	)
]

{ #category : #rendering }
MDSDemoTopAppBarPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoTopAppBarPage >> renderHeroOn: html [

	html html: '<header class="hero-top-app-bar mdc-top-app-bar"><div class="mdc-top-app-bar__row"><section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start"><button class="mdc-icon-button material-icons mdc-top-app-bar__navigation-icon mdc-ripple-upgraded--unbounded mdc-ripple-upgraded" style="--mdc-ripple-fg-size:28px; --mdc-ripple-fg-scale:1.71429; --mdc-ripple-left:10px; --mdc-ripple-top:10px;">menu</button><span class="mdc-top-app-bar__title">San Francisco, CA</span></section><section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end"><button class="mdc-icon-button material-icons mdc-top-app-bar__action-item mdc-ripple-upgraded--unbounded mdc-ripple-upgraded" aria-label="Download" style="--mdc-ripple-fg-size:28px; --mdc-ripple-fg-scale:1.71429; --mdc-ripple-left:10px; --mdc-ripple-top:10px;">file_download</button><button class="mdc-icon-button material-icons mdc-top-app-bar__action-item mdc-ripple-upgraded--unbounded mdc-ripple-upgraded" aria-label="Print this page" style="--mdc-ripple-fg-size:28px; --mdc-ripple-fg-scale:1.71429; --mdc-ripple-left:10px; --mdc-ripple-top:10px;">print</button><button class="mdc-icon-button material-icons mdc-top-app-bar__action-item mdc-ripple-upgraded--unbounded mdc-ripple-upgraded" aria-label="Bookmark this page" style="--mdc-ripple-fg-size:28px; --mdc-ripple-fg-scale:1.71429; --mdc-ripple-left:10px; --mdc-ripple-top:10px;">bookmark</button></section></div></header>'
]
