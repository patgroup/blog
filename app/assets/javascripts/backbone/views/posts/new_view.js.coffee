Blog.Views.Posts ||= {}

class Blog.Views.Posts.NewView extends Backbone.View
  template: JST["backbone/templates/posts/form"]

  events:
    "submit #form-post": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    valid = @validateBeforeSave()
    if valid
      e.preventDefault()
      e.stopPropagation()
  
      @model.unset("errors")
  
      @collection.create(@model.toJSON(),
        success: (post) =>
          @model = post
          window.location.hash = ""
          #window.location.hash = "/#{@model.id}"
  
        error: (post, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )
    else
      false
      
  render: ->
    $(@el).html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    return this
    
  validateBeforeSave: () =>
    valid = true
    $(@el).find('.required').each( (idx, elm) =>
      console.log(elm)
      id = $(elm).attr('id')
      if @isEmptyContent(elm)
        @showError(id)
        valid = false
      else
        @hideError(id)
    )
    valid
  
  isEmptyContent: (elm) =>
    $(elm).val().trim() == ""
    # elmObj = $(elm)
    # if elmObj.is('input')
      # elmObj.val().trim() == ""
    # else if elmObj.is('textarea')
      # elmObj.val().trim() == ""
      
  showError: (id) =>
    $('#'+id).addClass('error')
    $('#'+id+'-help').show()
    
  hideError: (id) =>
    $('#'+id).removeClass('error')
    $('#'+id+'-help').hide()
