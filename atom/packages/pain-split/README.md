# Pain Split

Atom's `pane:split-*` commands suck if you want to do anything else but re-open
the current document in your shiny new pane. Pain Split is here to help.

Default key bindings go something like this. Sorry for polluting the `pane:*`
namespace.

    '.platform-darwin':
      # Open an empty pane and bring it to focus to do as you will.
      # If there had to be only one way to split panes, this should have
      # been it.
      'cmd-k left':  'pane:split-left-creating-empty-pane'
      'cmd-k right': 'pane:split-right-creating-empty-pane'
      'cmd-k up':    'pane:split-up-creating-empty-pane'
      'cmd-k down':  'pane:split-down-creating-empty-pane'
      
      # Open a new pane and move the current editor tab to it.
      'cmd-k m left':  'pane:split-left-moving-current-tab'
      'cmd-k m right': 'pane:split-right-moving-current-tab'
      'cmd-k m up':    'pane:split-up-moving-current-tab'
      'cmd-k m down':  'pane:split-down-moving-current-tab'
      
      # Atom's default behavior. "D" for duplicate the current tab.
      # It's still there if you want it, I guess.
      'cmd-k d left':  'pane:split-left'
      'cmd-k d right': 'pane:split-right'
      'cmd-k d up':    'pane:split-up'
      'cmd-k d down':  'pane:split-down'
