Class {
	#name : #MCWDemoCatalogTopAppBarTtile,
	#superclass : #MCWTopAppBarTtile,
	#category : #'Material-Web-Demo'
}

{ #category : #rendering }
MCWDemoCatalogTopAppBarTtile >> renderContentOn: html [

	html span mdcTopAppBar__title; class: 'catalog-top-app-bar__title'; with: [
		html span class: 'catalog-top-app-bar__title--small-screen'; with: 'MDC Seaside'.
		html span class: 'catalog-top-app-bar__title--large-screen'; with: 'Material Components for Seaside' ]
]
