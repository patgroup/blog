#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Blog =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  
  init: (options) ->
    Blog.options = options
    new Blog.Routers.PostsRouter(options)
    if !Backbone.history.started
      Backbone.history.start()
      Backbone.history.started = true
