*Material-Web-Magritte
printHtml5
 	"Return as string 'hh:mm'  "
 
 	^ String new: 8 streamContents: [ :aStream | 
		self print24: true showSeconds: false on: aStream ]
 