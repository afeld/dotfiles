_ = require "underscore-plus"
AutocompleteView = require "./autocomplete-view"
Provider = require "./provider"
Suggestion = require "./suggestion"

module.exports =
  configDefaults:
    includeCompletionsFromAllBuffers: false
    fileBlacklist: ".*, *.md"
    enableAutoActivation: true
    autoActivationDelay: 100

  autocompleteViews: []
  editorSubscription: null

  # Public: Creates AutocompleteView instances for all active and future editors
  activate: ->
    # If both autosave and autocomplete+'s auto-activation feature are enabled,
    # disable the auto-activation
    if atom.packages.isPackageLoaded("autosave") and
      atom.config.get("autosave.enabled") and
      atom.config.get("autocomplete-plus.enableAutoActivation")
        atom.config.set "autocomplete-plus.enableAutoActivation", false

        alert """Warning from autocomplete+:

        autocomplete+ is not compatible with the autosave package when the auto-activation feature is enabled. Therefore, auto-activation has been disabled.

        autocomplete+ can now only be triggered using the keyboard shortcut `ctrl+space`."""

    @editorSubscription = atom.workspaceView.eachEditorView (editor) =>
      if editor.attached and not editor.mini
        autocompleteView = new AutocompleteView(editor)
        editor.on "editor:will-be-removed", =>
          autocompleteView.remove() unless autocompleteView.hasParent()
          autocompleteView.dispose()
          _.remove(@autocompleteViews, autocompleteView)
        @autocompleteViews.push(autocompleteView)

  # Public: Cleans everything up, removes all AutocompleteView instances
  deactivate: ->
    @editorSubscription?.off()
    @editorSubscription = null
    @autocompleteViews.forEach (autocompleteView) -> autocompleteView.remove()
    @autocompleteViews = []

  # Public: Finds the autocomplete view for the given EditorView
  # and registers the given provider
  #
  # provider - The new {Provider}
  # editorView - The {EditorView} we should register the provider with
  registerProviderForEditorView: (provider, editorView) ->
    autocompleteView = _.findWhere @autocompleteViews, editorView: editorView
    unless autocompleteView?
      throw new Error("Could not register provider", provider.constructor.name)

    autocompleteView.registerProvider provider

  # Public: Finds the autocomplete view for the given EditorView
  # and unregisters the given provider
  #
  # provider - The {Provider} to unregister
  unregisterProvider: (provider) ->
    view.unregisterProvider for view in @autocompleteViews

  Provider: Provider
  Suggestion: Suggestion
