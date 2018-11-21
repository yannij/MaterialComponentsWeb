rendering
renderExpandSwitchOnListId: listId on: html
	| switchId |

	switchId := html nextId.

	html div mdcSwitch; with: [
		html div mdcSwitch__track.
		html div mdcSwitch__thumbUnderlay; with: [
			html mdcSwitch__thumb; with: [
				html checkbox
					mdcSwitch__nativeControl;
					id: switchId;
					value: self expanded;
					onChange: (html jQuery ajax
						callback: [ :value | self expanded: value = 'true' ] value: (JSStream on: 'event.target.checked');
						onComplete: ((html jQuery id: listId) load html: [:renderer | self renderListAjaxOn: renderer]));
			yourself]]].
	html space; space; space.
	html label for: switchId; with: self magritteDescription label.
