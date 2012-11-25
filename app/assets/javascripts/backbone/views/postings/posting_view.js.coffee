Blog.Views.Postings ||= {}

class Blog.Views.Postings.PostingView extends Backbone.View
  template: JST["backbone/templates/postings/posting"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
