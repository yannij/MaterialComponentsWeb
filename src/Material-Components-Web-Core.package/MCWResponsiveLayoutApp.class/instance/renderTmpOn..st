rendering
renderTmpOn: html

	html html:
'
<style>
      .demo-absolute-fab  {
        position: absolute;
        bottom: 1rem;
        right: 1rem;
        z-index: 1;
      }

      .fab-motion-container {
        border: 1px solid #ccc;
        overflow: hidden;
        position: relative;
        height: 10rem;
        width: 20rem;
      }
</style>
<div class="fab-motion-container">
<button class="mdc-fab demo-absolute-fab material-icons" aria-label="Add">
<span class="mdc-fab__icon">add</span>
</button>
</div>
'
