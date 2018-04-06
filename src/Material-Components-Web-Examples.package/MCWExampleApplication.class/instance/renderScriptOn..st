rendering
renderScriptOn: html

	self renderMaterialComponentsWebJsOn: html.
	html html: '
<script>
demoReady(function() {
	var MDCPersistentDrawer = mdc.drawer.MDCPersistentDrawer;
	drawerEl = document.querySelector(''.mdc-drawer'');
	drawer = new MDCPersistentDrawer(drawerEl);
});
</script>'