class MessagePanel extends HTMLElement
	initialize: (message) ->
		@textContent = message
		btn = document.createElement 'button'
		btn.textContent = 'Close'
		btn.classList.add 'btn', 'btn-sm', 'pull-right'
		btn.addEventListener 'click', => @destroy()
		@appendChild btn

	attach: ->
		@panel = atom.workspace.addBottomPanel item: this
		@style.display = 'block'
		@style.padding = window.getComputedStyle(this).padding

	destroy: ->
		@panel.destroy()

module.exports = document.registerElement 'epl-message-panel', prototype: MessagePanel.prototype
