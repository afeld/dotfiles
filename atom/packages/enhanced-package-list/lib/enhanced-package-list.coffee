{$, $$} = require 'atom'
_ = require 'underscore-plus'
fuzzaldrin = require 'fuzzaldrin'
semver = require 'semver'
MessagePanel = require './message-panel'

module.exports =
	settingsView: null
	itemChangedSubscription: null
	itemRemovedSubscription: null
	disabledPackagesSubscription: null
	confSubscription: null

	highlightAuthor: null
	packagesChanged: true
	sourceFilter: 'all'
	filter: null
	originalFilter: null

	config:
		highlightAuthor:
			default: ''
			type: 'string'

		sourceFilter:
			default: 'all'
			type: 'string'
			enum: ['all', 'core', 'user', 'author']

	activate: (state) ->
		if semver.gte(atom.getVersion(), '0.167.0')
			message = new MessagePanel()
			message.initialize 'The enhanced-package-list package is not compatible with Atom >= 0.167.0 and has been disabled.'
			message.attach()
			atom.packages.onDidActivateAll ->
				atom.packages.disablePackage('enhanced-package-list')
			return

		@itemChangedSubscription = atom.workspaceView.on 'pane:active-item-changed', (e, item) =>
			if item.is? '.settings-view'
				@settingsViewActive(item)

		@itemRemovedSubscription = atom.workspaceView.on 'pane:item-removed', (e, item) =>
			@packagesChanged = true

			if item.is? '.settings-view'
				@settingsViewRemoved()

		@disabledPackagesSubscription = atom.config.observe 'core.disabledPackages', =>
			@packagesChanged = true

			if @settingsView and @settingsView.is ':visible'
				@updatePackageClasses()

		@confSubscription = atom.config.observe 'enhanced-package-list.highlightAuthor', (author) =>
			@packagesChanged = true

			@highlightAuthor = author
			if @settingsView and @settingsView.is ':visible'
				@updatePackageClasses()

		@filterConfSubscription = atom.config.observe 'enhanced-package-list.sourceFilter', (filter) =>
			@sourceFilter = filter

	deactivate: ->
		@itemAddedSubscription?.off()
		@itemRemovedSubscription?.off()
		@disabledPackagesSubscription?.off()
		@confSubscription?.off()
		@filterConfSubscription?.off()
		if @filter
			@filter.remove()
		if @settingsView
			if @originalFilter
				@settingsView.filterPackages = @originalFilter
			@settingsView.removeClass 'enhanced-package-list'
			@settingsView.filterPackages()


	settingsViewActive: (@settingsView) ->
		unless @settingsView.hasClass('enhanced-package-list')
			enhancedPackage = this

			filter = @filter = $$ ->
				@div class: 'package-source-filter', =>
					@div class: 'btn-group', =>
						@button 'data-source': 'all', class: 'btn', 'All'
						@button 'data-source': 'core', class: 'btn', 'Core'
						@button 'data-source': 'user', class: 'btn', 'User'
						@button 'data-source': 'author', class: 'btn', 'Author'

			filter.find('[data-source=' + @sourceFilter + ']').addClass 'selected'

			filter.on 'click', '.btn', (e) =>
				btn = $(e.target)
				atom.config.set 'enhanced-package-list.sourceFilter', btn.attr 'data-source'
				filter.find('.selected').removeClass 'selected'
				btn.addClass 'selected'
				@settingsView.filterPackages()

			@settingsView.find('.settings-filter').before filter
			@originalFilter = @settingsView.filterPackages
			@settingsView.filterPackages = ->
				filterText = @filterEditor.getEditor().getText()
				all = _.map @panelPackages.children(), (item) ->
					element: $(item)
					text: $(item).text()
				active = fuzzaldrin.filter(all, filterText, key: 'text')

				unless enhancedPackage.sourceFilter is 'all'
					active = _.filter active, (item) ->
						bundled = item.element.hasClass 'bundled-package'
						author = item.element.hasClass 'author-highlight'

						return if enhancedPackage.sourceFilter is 'author'
							author
						else if enhancedPackage.sourceFilter is 'core'
							bundled
						else
							not bundled

				_.each all, ({element}) -> element.hide()
				_.each active, ({element}) -> element.show()

			@settingsView.addClass('enhanced-package-list')

		@updatePackageClasses @settingsView

	settingsViewRemoved: ->
		@settingsView = null

	updatePackageClasses: ()->
		return unless @settingsView

		return unless @packagesChanged

		names = atom.packages.getAvailablePackageNames()

		anyAuthorHighlighted = false

		for name in names
			list_item = @settingsView.find(".panels-packages [name=#{name}]")
			metadata = atom.packages.getLoadedPackage(name)
			highlight = @highlightAuthor isnt '' and list_item.find('.package-author').text() is @highlightAuthor
			anyAuthorHighlighted ||= highlight

			list_item.toggleClass 'bundled-package', atom.packages.isBundledPackage(name)
			list_item.toggleClass 'disabled-package', atom.packages.isPackageDisabled(name)
			list_item.toggleClass 'incompatible-package', metadata? and (metadata.isCompatible and not metadata.isCompatible())
			list_item.toggleClass 'author-highlight', highlight

		@settingsView.filterPackages()
		@packagesChanged = false

		@filter.toggleClass('with-author', anyAuthorHighlighted)

		return
