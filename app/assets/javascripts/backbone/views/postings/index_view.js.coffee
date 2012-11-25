Blog.Views.Postings ||= {}

class Blog.Views.Postings.IndexView extends Backbone.View
  template: JST["backbone/templates/postings/index"]

  initialize: () ->
    @options.postings.bind('reset', @addAll)

  addAll: () =>
    @options.postings.each(@addOne)

  addOne: (posting) =>
    view = new Blog.Views.Postings.PostingView({model : posting, collection: @options.postings})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(postings: @options.postings.toJSON() ))
    @addAll()

    return this
