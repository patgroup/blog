Blog.Views.Postings ||= {}

class Blog.Views.Postings.NewView extends Backbone.View
  template: JST["backbone/templates/postings/new"]

  events:
    "submit #new-posting": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (posting) =>
        @model = posting
        window.location.hash = "/#{@model.id}"

      error: (posting, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
