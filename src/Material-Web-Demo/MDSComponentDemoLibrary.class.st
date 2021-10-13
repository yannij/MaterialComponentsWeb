Class {
	#name : #MDSComponentDemoLibrary,
	#superclass : #WAFileLibrary,
	#category : #'Material-Web-Demo'
}

{ #category : #uploaded }
MDSComponentDemoLibrary >> appCss [

	^ '
body {
    margin: 0
}

.catalog-top-app-bar {
    background-color: #212121;
    position: absolute
}

.catalog-top-app-bar__title {
    text-transform: uppercase;
    font-family: Roboto Mono,serif;
    font-weight: 400
}

.catalog-top-app-bar__title--small-screen {
    display: none
}

@media (max-width: 599px) {
    .catalog-top-app-bar__title--small-screen {
        display:inline-block
    }

    .catalog-top-app-bar__title--large-screen {
        display: none
    }
}

.catalog-page-container {
    position: relative
}

#catalog-image-list {
    max-width: 900px;
    padding-top: 128px;
    padding-bottom: 100px
}

#catalog-image-list .mdc-image-list__image-aspect-container {
    padding-bottom: 100%
}

#catalog-image-list .mdc-image-list__item {
    width: calc(100% / 4 - 8.25px);
    margin: 4px
}

@media (max-width: 599px) {
    #catalog-image-list .mdc-image-list__item {
        width:calc(100% / 3 - 8.33333px);
        margin: 4px
    }
}

@media (max-width: 320px) {
    #catalog-image-list .mdc-image-list__item {
        width:calc(100% / 2 - 8.5px);
        margin: 4px
    }
}

.catalog-image-list-item-container {
    background-color: #f5f5f5
}

.catalog-image-list-label {
    font-weight: 500;
    color: #212121
}

a.catalog-image-link {
    text-decoration: none
}

.hero {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-flow: row nowrap;
    flex-flow: row nowrap;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: center;
    justify-content: center;
    min-height: 360px;
    padding: 24px;
    background-color: #f2f2f2
}

.sidebar-active {
    font-weight: 600
}

.demo-title {
    border-bottom: 1px solid rgba(0,0,0,.87)
}

.resources-icon {
    width: 32px
}

.demo-panel {
    display: -ms-flexbox;
    display: flex;
    position: relative;
    height: 100vh;
    overflow: hidden
}

.mdc-drawer--dismissible.demo-drawer {
    z-index: 1
}

.demo-drawer {
    height: 100%
}

.demo-drawer .mdc-list-item {
    cursor: pointer
}

.demo-drawer-header {
    position: absolute;
    top: 18px;
    opacity: .74
}

.demo-content {
    height: 100%;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    max-width: 100%;
    padding: 40px 16px 100px;
    -webkit-transition: -webkit-transform .2s cubic-bezier(.4,0,.2,1) 50ms;
    transition: -webkit-transform .2s cubic-bezier(.4,0,.2,1) 50ms;
    -o-transition: .2s transform cubic-bezier(.4,0,.2,1) 50ms;
    transition: transform .2s cubic-bezier(.4,0,.2,1) 50ms;
    transition: transform .2s cubic-bezier(.4,0,.2,1) 50ms,-webkit-transform .2s cubic-bezier(.4,0,.2,1) 50ms;
    width: 100%;
    overflow: auto;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: start;
    justify-content: flex-start
}

@supports (-webkit-overflow-scrolling:touch) {
    .demo-content {
        overflow: scroll;
        -webkit-overflow-scrolling: touch
    }
}

.demo-content-transition {
    width: 100%;
    max-width: 900px
}

.loadComponent-enter {
    opacity: 0;
    -webkit-transform: translateY(15px);
    -ms-transform: translateY(15px);
    transform: translateY(15px)
}

.loadComponent-enter.loadComponent-enter-active {
    opacity: 1;
    -webkit-transform: translateY(0);
    -ms-transform: translateY(0);
    transform: translateY(0);
    -webkit-transition: all 235ms linear .1s;
    -o-transition: all 235ms linear .1s;
    transition: all 235ms linear .1s
}

.loadComponent-enter.loadComponent-enter-active .mdc-snackbar,.loadComponent-exit {
    display: none
}

'
]

{ #category : #uploaded }
MDSComponentDemoLibrary >> buttonCatalogCss [

	^ '
.demo-button {
  margin: 8px 16px; }

.hero-button {
  margin: 16px 32px; }

.demo-button-shaped {
    border-radius: 18px
}

.demo-button-shaped.mdc-button--dense {
    border-radius: 16px
}
'
]
