Class {
	#name : #MDSResponsiveAppLibrary,
	#superclass : #WAFileLibrary,
	#category : #'Material-Web-Responsive'
}

{ #category : #uploaded }
MDSResponsiveAppLibrary >> responsiveAppCss [
"

.mdc-menu .mdc-list {
	color: var(--mdc-theme-on-surface);
}

.mdc-drawer .mdc-list-item {
	color: var(--mdc-theme-on-surface);
}
"

	^ '
body {
	background: var(--mdc-theme-background);
}

/* Ensure layout covers the entire screen. */
html {
  height: 100%;
}

.mdc-drawer .mdc-deprecated-list-item, .mdc-drawer .mdc-deprecated-list-item__graphic {
	color: var(--mdc-theme-on-background)
}

.mdc-menu .mdc-deprecated-list-item, .mdc-menu .mdc-deprecated-list-item__graphic {
	color: var(--mdc-theme-on-background)
}

.mdc-list--dense .mdc-list {
  padding: 0;
}

.mdc-list-item {
  padding: 0 16px;
  height: 48px;
  /*position: relative;*/
  align-items: center;
}

.mdc-list--dense .mdc-list-item {
  padding: 0 8px;
  margin: 2px 8px;
  height: 40px;
}

.mdc-list-item__graphic {
  margin-left: 0;
  margin-right: 32px;
  width: 24px;
  height: 24px;
}

.mdc-list--dense .mdc-list-item__graphic {
  margin-left: 0;
  margin-right: 16px;
  width: 20px;
  height: 20px;
}

.mcw-body {
  display: flex;
  flex-flow: row nowrap;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  min-height: 100%;
  width: 100%;
}

.mcw-layout-mobile .mdc-fab {
}

.mcw-layout-tablet .mdc-fab {
	top: 96px;
	left: 1rem;
}

.mcw-layout-desktop .mdc-fab {
	top: 96px;
	left: 0rem;
}

.mcw-textfield {
  display: block;
  margin: 12px;
}

@media (max-height: 840px) {
  .mcw-login-header-spacer {
    display: none;
  }
}

.mcw-login-header-spacer {
  padding-top: 80px;
}

.mcw-login {
  width: 100%;
}

.mcw-login-header { 
  text-align: center;
}

.mcw-login-spacer {
  margin-top: 16px;
}


.mcw-login-username,
.mcw-login-password {
  display: block;
  width: 300px;
  margin: 8px auto;
}

.mcw-login-button {
  display: flex;
  justify-content: flex-end;
  width: 300px;
  margin: auto;
}

.mcw-login-button button {
  margin: 3px;
}

.mcw-login-action {
  margin: 0px auto 0px auto;
  width: 300px;
  text-align: right;
}

.mcw-login-action button {
  padding-right: 0px;
}
'
]
