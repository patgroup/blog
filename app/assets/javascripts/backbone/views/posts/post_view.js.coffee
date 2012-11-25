Blog.Views.Posts ||= {}

class Blog.Views.Posts.PostView extends Backbone.View
  template: JST["backbone/templates/posts/post"]

  events:
    "click .destroy": "destroy"

  tagName: "tr"

  destroy: () ->
    getViewAndCollection = ((view) -> return -> {collection: view.collection, view: view})(this)
    
    @model.destroy
      success: (model, response) =>
        vAndC = getViewAndCollection()
        vAndC.collection.remove model
        vAndC.view.remove()
      error: (model, response) =>
        alert("Error detected: " + response)
    #this.remove()

    return false

  render: () ->
    console.log(@model)
    $(@el).html(@template(@model.toJSON()))
    return this
    
