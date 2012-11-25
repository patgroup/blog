Blog.Views.Postings ||= {}

class Blog.Views.Postings.ShowView extends Backbone.View
  template: JST["backbone/templates/postings/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
