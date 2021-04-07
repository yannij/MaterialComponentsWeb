Class {
	#name : #MCWShrineLibrary,
	#superclass : #WAFileLibrary,
	#category : 'Material-Study-Shrine'
}

{ #category : #uploaded }
MCWShrineLibrary >> bundleCss [

	^'/* Custom Theme */
:root {
--mdc-theme-primary: #FEDBD0;
--mdc-theme-on-primary: #442C2E;
--mdc-theme-secondary: #FEEAE6;
--mdc-theme-on-secondary: 442C2E;
--mdc-theme-surface:: #FFFBFA;
--mdc-theme-on-surface:: #442C2E;
--mdc-theme-background: #FFFFFF;
--mdc-theme-on-background: #442C2E;
}

/* Custom Dark Theme */
/*
:root {
--mdc-theme-primary: #FFCF44;
--mdc-theme-on-primary: #33333D;
--mdc-theme-secondary: #FFCF44;
--mdc-theme-on-secondary: FFFFFF;
--mdc-theme-surface:: #33333D;
--mdc-theme-on-surface:: #FFFFFF;
--mdc-theme-background: #33333D;
--mdc-theme-on-background: #FFFFFF;
}
*/

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

.header {
  text-align: center;
}

.shrine-login {
  width: 100%;
}

.shrine-logo {
  width: 150px;
  height: 150px;
  padding-top: 80px;
  fill: currentColor;
}

.username,
.password {
  display: block;
  width: 300px;
  margin: 20px auto;
}

.button-container {
  display: flex;
  justify-content: flex-end;
  width: 300px;
  margin: auto;
}

.button-container button {
  margin: 3px;
}

/* Home page styles */

.home {
  display: flex; /* Flexbox is used to easily arrange the persistent drawer and content side-by-side */

  /* Dark Theme
  background-color: #33333D;
  color: #FFFFFF;
*/
}

.shrine-logo-drawer {
  width: 48px;
  padding: 40px 0 0;
  margin: 0 auto;
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

.shrine-drawer .mdc-drawer__drawer {
@include mdc-drawer-fill-color-accessible(surface);
@include mdc-drawer-ink-color(on-surface);
border-right-width: 0;

  /* Dark Theme
  color: #FFFFFF;
  background-color: #33333D;
*/

  color: #442C2E;
  background-color: #FEDBD0;
}

.shrine-drawer .mdc-list {
/*
  @include mdc-drawer-fill-color-accessible(primary);
  @include mdc-drawer-ink-color(on-primary);
*/
  color: #442C2E;
  background-color: #FEDBD0;

  /* Dark Theme
  color: #FFFFFF;
  background-color: #33333D;
*/

  text-transform: uppercase;

  margin: 70px 5px auto 5px;
}

.shrine-drawer .mdc-list-item {
  /* @include mdc-list-item-primary-text-ink-color(on-primary); */
  color: #442C2E;

  /* Dark Theme
  color: #FFFFFF;
*/

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
  /* Dark Theme
  color: #FFFFFF;
*/
}

.shrine-body {
/* @include mdc-elevation(4); */

  display: block;
  overflow: auto;

  /* Dark Theme
  color: #FFFFFF;
  background-color: #33333D;
*/

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
