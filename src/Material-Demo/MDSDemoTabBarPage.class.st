Class {
	#name : #MDSDemoTabBarPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Demo-Catalog'
}

{ #category : #rendering }
MDSDemoTabBarPage >> pageInfo [

	^ #(
	'Tab Bar'
	'Tabs make it easy to explore and switch between different views.'
	'https://material.io/go/design-tabs'
	'https://material.io/components/web/catalog/tabs/'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-tab-bar'
	)
]

{ #category : #rendering }
MDSDemoTabBarPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoTabBarPage >> renderHeroOn: html [

	html html: '<div class="mdc-tab-bar" role="tablist"><div class="mdc-tab-scroller"><div class="mdc-tab-scroller__scroll-area mdc-tab-scroller__scroll-area--scroll" style="margin-bottom: 0px;"><div class="mdc-tab-scroller__scroll-content"><button class="mdc-tab mdc-tab--active" role="tab" aria-selected="true" tabindex="0" id="mdc-tab-67"><span class="mdc-tab__content"><span class="mdc-tab__text-label">Home</span></span><span class="mdc-tab-indicator mdc-tab-indicator--active"><span class="mdc-tab-indicator__content mdc-tab-indicator__content--underline"></span></span><span class="mdc-tab__ripple mdc-ripple-upgraded"></span></button><button class="mdc-tab" role="tab" aria-selected="false" tabindex="-1" id="mdc-tab-68"><span class="mdc-tab__content"><span class="mdc-tab__text-label">Merchandise</span></span><span class="mdc-tab-indicator"><span class="mdc-tab-indicator__content mdc-tab-indicator__content--underline"></span></span><span class="mdc-tab__ripple mdc-ripple-upgraded"></span></button><button class="mdc-tab" role="tab" aria-selected="false" tabindex="-1" id="mdc-tab-69"><span class="mdc-tab__content"><span class="mdc-tab__text-label">About Us</span></span><span class="mdc-tab-indicator"><span class="mdc-tab-indicator__content mdc-tab-indicator__content--underline"></span></span><span class="mdc-tab__ripple mdc-ripple-upgraded"></span></button></div></div></div></div>'
]
