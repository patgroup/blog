class Blog.Routers.PostsRouter extends Backbone.Router
  
  initialize: (options) ->
    @posts = new Blog.Collections.PostsCollection()
    @posts.reset options.posts

  routes:
    "new"         : "newPost"
    "index"       : "index"
    ":id/edit"    : "edit"
    ":id"         : "show"
    #":id/destroy" : "destroy"
    ".*"          : "index"

  newPost: ->
    @view = new Blog.Views.Posts.NewView(collection: @posts)
    $("#posts").html(@view.render().el)

  index: ->
    @view = new Blog.Views.Posts.IndexView(posts: @posts)
    $("#posts").html(@view.render().el)

  show: (id) ->
    post = @posts.get(id)

    @view = new Blog.Views.Posts.ShowView(model: post)
    $("#posts").html(@view.render().el)

  edit: (id) ->
    post = @posts.get(id)

    @view = new Blog.Views.Posts.EditView(model: post)
    $("#posts").html(@view.render().el)
    
