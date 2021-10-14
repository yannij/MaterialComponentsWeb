Class {
	#name : #MDSDemoCardPage,
	#superclass : #MDSComponentDemoPage,
	#category : #'Material-Demo-Catalog'
}

{ #category : #rendering }
MDSDemoCardPage >> pageInfo [

	^ #(
	'Card'
	'Cards contain content and actions about a single subject.'
	'https://material.io/go/design-cards'
	'https://material.io/components/cards'
	'https://github.com/material-components/material-components-web/tree/master/packages/mdc-card'
	)
]

{ #category : #rendering }
MDSDemoCardPage >> renderDemosOn: html [

	html text: 'TODO'
]

{ #category : #rendering }
MDSDemoCardPage >> renderHeroOn: html [

	html html: '
<div class="mdc-card demo-card"><div class="mdc-card__primary-action demo-card__primary-action mdc-ripple-upgraded" tabindex="0" style="--mdc-ripple-fg-size:210px; --mdc-ripple-fg-scale:2.34115; --mdc-ripple-fg-translate-start:102.364px, -0.87146px; --mdc-ripple-fg-translate-end:70px, 60.4375px;"><div class="mdc-card__media mdc-card__media--16-9 demo-card__media" style="background-image: url(&quot;https://material-components.github.io/material-components-web-catalog/static/media/photos/3x2/2.jpg&quot;);"></div><div class="demo-card__primary"><h2 class="demo-card__title mdc-typography mdc-typography--headline6">Our Changing Planet</h2><h3 class="demo-card__subtitle mdc-typography mdc-typography--subtitle2">by Kurt Wagner</h3></div><div class="demo-card__secondary mdc-typography mdc-typography--body2">Visit ten places on our planet that are undergoing the biggest changes today.</div></div><div class="mdc-card__actions"><div class="mdc-card__action-buttons"><button class="mdc-button mdc-card__action mdc-card__action--button mdc-ripple-upgraded"><span class="mdc-button__ripple"></span>Read</button><button class="mdc-button mdc-card__action mdc-card__action--button mdc-ripple-upgraded"><span class="mdc-button__ripple"></span>Bookmark</button></div><div class="mdc-card__action-icons"><button class="mdc-icon-button mdc-card__action mdc-card__action--icon mdc-ripple-upgraded mdc-ripple-upgraded--unbounded" aria-pressed="false" aria-label="Add to favorites" title="Add to favorites" style="--mdc-ripple-fg-size:28px; --mdc-ripple-fg-scale:1.71429; --mdc-ripple-left:10px; --mdc-ripple-top:10px;"><i class="material-icons mdc-icon-button__icon mdc-icon-button__icon--on">favorite</i><i class="material-icons mdc-icon-button__icon">favorite_border</i></button><button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon mdc-ripple-upgraded--unbounded mdc-ripple-upgraded" title="Share" data-mdc-ripple-is-unbounded="true" style="--mdc-ripple-fg-size:28px; --mdc-ripple-fg-scale:1.71429; --mdc-ripple-left:10px; --mdc-ripple-top:10px;">share</button><button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon mdc-ripple-upgraded--unbounded mdc-ripple-upgraded" title="More options" data-mdc-ripple-is-unbounded="true" style="--mdc-ripple-fg-size:28px; --mdc-ripple-fg-scale:1.71429; --mdc-ripple-left:10px; --mdc-ripple-top:10px;">more_vert</button></div></div></div>'
]
