class Blog.Routers.PostingsRouter extends Backbone.Router
  initialize: (options) ->
    @postings = new Blog.Collections.PostingsCollection()
    @postings.reset options.postings

  routes:
    "new"      : "newPosting"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newPosting: ->
    @view = new Blog.Views.Postings.NewView(collection: @postings)
    $("#postings").html(@view.render().el)

  index: ->
    @view = new Blog.Views.Postings.IndexView(postings: @postings)
    $("#postings").html(@view.render().el)

  show: (id) ->
    posting = @postings.get(id)

    @view = new Blog.Views.Postings.ShowView(model: posting)
    $("#postings").html(@view.render().el)

  edit: (id) ->
    posting = @postings.get(id)

    @view = new Blog.Views.Postings.EditView(model: posting)
    $("#postings").html(@view.render().el)
