rendering
renderViewerOn: html
	| checkboxId |

	checkboxId := html nextId.

	html div mdcFormField; with: [
		html div mdcCheckbox; with: [
		html checkbox
			id: checkboxId;
			mdcCheckbox__nativeControl;
			on: #value of: self;
			with: [
				html div mdcCheckbox__background with: [
					html svg mdcCheckbox__checkmark; attributeAt: 'viewBox' put: '0 0 24 24'; with: [
					html path
						mdcCheckbox__checkmarkPath;
						attributeAt: 'fill' put: 'none';
						attributeAt: 'stroke' put: 'white';
						attributeAt: 'd' put: 'M1.73,12.91 8.1,19.28 22.79,4.59';
						yourself.
					html div mdcCheckbox__mixedmark]]]].
		html label for: checkboxId; with: self magritteDescription checkboxLabel].
