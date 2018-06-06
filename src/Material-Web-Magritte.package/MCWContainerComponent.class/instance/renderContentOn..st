rendering
renderContentOn: html

	"| width |

	width := self magritteDescription propertyAt: #cardWidth ifAbsent: [300]."

	"html div
		mdcCard;
		style: 'padding: 16px';
		with: [
			self renderSaveCancelOn: html.
			super renderContentOn: html]"

	super renderContentOn: html
