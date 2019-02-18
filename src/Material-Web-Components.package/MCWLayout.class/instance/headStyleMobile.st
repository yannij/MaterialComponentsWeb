accessing
headStyleMobile
	^ '
/* Ensure layout covers the entire screen. */
html {
  height: 100%;
}

.mcw-body {
  display: flex;
  flex-direction: row;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  min-height: 100%;
  width: 100%;
}
'