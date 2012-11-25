Blog.Views.Postings ||= {}

class Blog.Views.Postings.EditView extends Backbone.View
  template : JST["backbone/templates/postings/edit"]

  events :
    "submit #edit-posting" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (posting) =>
        @model = posting
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
