git = require '../git'
StatusView = require '../views/status-view'

gitStashApply = ->
  git.cmd
    args: ['stash', 'apply'],
    stdout: (data) -> new StatusView(type: 'success', message: data)

module.exports = gitStashApply
