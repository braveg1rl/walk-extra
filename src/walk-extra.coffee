walk = require "walk"

module.exports = 
  walk: walk.walk
  walkSync: walk.walkSync
  
  countDirectories: (path, next) ->
    paths = 0
    walker = walk.walk path
    walker.on "directory", (root, stat, next) -> 
      paths++
      next()
    walker.on "end", -> next null, paths

  countFiles: (path, next) ->
    paths = 0
    walker = walk.walk path
    walker.on "file", (root, stat, next) -> 
      paths++
      next()
    walker.on "end", -> next null, paths

  getDirectories: (path, next) ->
    paths = []
    walker = walk.walk path
    walker.on "directory", (root, stat, next) -> 
      paths.push root + "/" + stat.name
      next()
    walker.on "end", -> next null, paths

  getFiles: (path, next) ->
    paths = []
    walker = walk.walk path
    walker.on "file", (root, stat, next) -> 
      paths.push root + "/" + stat.name
      next()
    walker.on "end", -> next null, paths