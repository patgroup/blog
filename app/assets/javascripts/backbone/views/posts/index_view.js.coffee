Blog.Views.Posts ||= {}

class Blog.Views.Posts.IndexView extends Backbone.View
  template: JST["backbone/templates/posts/index"]
  
  #events:
    #"click .btn": "processAction"

  initialize: () ->
    console.log(@options)
    @options.posts.bind('reset', @addAll)

  addAll: () =>
    @options.posts.each(@addOne)

  addOne: (post) =>
    view = new Blog.Views.Posts.PostView({model : post, collection: @options.posts})
    console.log(post)
    $(@el).find("tbody").append(view.render().el)
    this
    # @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(posts: @options.posts.toJSON()))
    @addAll()
    return this
    
  processAction: (e) =>
    console.log(e)
    target = e.currentTarget
    href = window.location.href
    href = href.slice(0, -1) if href.match(/\#$/)
    window.location = href + $(target).data().value
    
