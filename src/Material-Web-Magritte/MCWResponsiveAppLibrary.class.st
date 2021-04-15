Class {
	#name : #MCWResponsiveAppLibrary,
	#superclass : #WAFileLibrary,
	#category : #'Material-Web-Magritte'
}

{ #category : #uploaded }
MCWResponsiveAppLibrary >> responsiveAppCss [

	^ '
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

.appBarPadding {
	padding-top: 56px;
}


.mcw-textfield {
  display: block;
  margin: 2px 4px 2px 4px;
}

.mcw-login {
  width: 100%;
}

.mcw-login-header { 
  text-align: center;
}

.mcw-login-username,
.mcw-login-password {
  display: block;
  width: 300px;
  margin: 20px auto;
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
'
]
