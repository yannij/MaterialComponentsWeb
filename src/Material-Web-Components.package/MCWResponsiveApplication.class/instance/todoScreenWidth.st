testing
todoScreenWidth
"
Media Queries work in js too:

if (window.matchMedia('screen and (max-width: 768px)').matches) {}
Another way would be:

var width = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
"