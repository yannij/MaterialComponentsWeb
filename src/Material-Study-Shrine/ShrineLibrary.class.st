Class {
	#name : #ShrineLibrary,
	#superclass : #WAFileLibrary,
	#category : #'Material-Study-Shrine'
}

{ #category : #uploaded }
ShrineLibrary >> bundleCss [

	^ '
:root {
--mdc-layout-grid-margin-desktop: 0px;
--mdc-layout-grid-gutter-desktop: 0px;
}

@media (max-width: 840px) {
  .grid-padding-off-tablet {
    display: none;
  }
}

@media (max-width: 480px) {
  .grid-padding-off-mobile {
    display: none;
  }
}

/* Login page styles */

@media (max-height: 840px) {
  .shrine-logo-spacer {
    display: none;
  }
}

.shrine-logo-spacer {
  padding-top: 80px;
}

.shrine-logo {
  width: 150px;
  height: 150px;
  padding-top: 0px;
  fill: currentColor;
}

/* Home page styles */

.home {
  display: flex; /* Flexbox is used to easily arrange the persistent drawer and content side-by-side */
}

.shrine-logo-drawer {
  width: 48px;
  padding: 40px 0 0;
  fill: currentColor;
}

.shrine-title {
  align-self: center;
  margin: 5px auto;
}

.mdc-image-list.product-list {
  -webkit-column-count: 4;
  column-count: 4;
  -webkit-column-gap: 16px;
  column-gap: 16px;
  max-width: 1000px;
  overflow: auto;
  padding: 80px 100px 0 100px;
}

.shrine-drawer .mdc-list {
/*
  @include mdc-drawer-fill-color-accessible(primary);
  @include mdc-drawer-ink-color(on-primary);
  color: #442C2E;
  background-color: #FEDBD0;
*/
  color: var(--mdc-theme-on-primary);
  background-color: var(--mdc-theme-primary);

  text-transform: uppercase;
}

.shrine-drawer .mdc-list-item {
  color: var(--mdc-theme-on-primary);

  border-radius: 6px;
  justify-content: center;
}

.mdc-image-list__supporting {
  justify-content: center;
}

.mdc-image-list__item {
  padding: 10px;
}

.mdc-image-list__label {
/* @include mdc-typography(subtitle2); */
}

.shrine-body {
/* @include mdc-elevation(4); */

  display: block;
  overflow: auto;

/*
  font-family: Rubik, sans-serif;
*/
}
 
/*
.mdc-drawer--permanent .mdc-list-item,
.mdc-typography--headline6,
.mdc-typography--subtitle2 {
    font-family: Rubik, sans-serif;
}
*/
'
]
