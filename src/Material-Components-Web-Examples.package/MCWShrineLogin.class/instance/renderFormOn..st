rendering
renderFormOn: html 

	html form with: [
		html div mdcTextField; mdcTextField__box; mdcAutoInit: 'MDCTextField'; class: 'username'; with: [
			html textInput
				id: 'username-input';
				mdcTextField__input;
				name: 'username';
				required.
			html label mdcFloatingLabel; for: 'username-input'; with: 'Username'.
			html div mdcLineRipple].
		html div mdcTextField; mdcTextField__box; mdcAutoInit: 'MDCTextField'; class: 'password'; with: [
			html passwordInput
				id: 'password-input';
				mdcTextField__input;
				name: 'password';
				attributeAt: 'minlength' put: 8;
				required.
			html label mdcFloatingLabel; for: 'password-input'; with: 'Password'.
			html div mdcLineRipple].

		html div class: 'button-container'; with: [
			html button mdcButton; mdcAutoInit: 'MDCRipple'; class: 'cancel'; with: 'Cancel'.
			html button mdcButton; mdcButton__raised; mdcAutoInit: 'MDCRipple'; class: 'next';
				onClick: ((html jQuery ajax)
					callback: [self session properties at: #authenticatedUser put: #foobar];
					onComplete: html javascript refresh);
				with: 'Next']]