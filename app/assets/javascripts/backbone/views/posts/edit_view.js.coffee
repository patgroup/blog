Blog.Views.Posts ||= {}

class Blog.Views.Posts.EditView extends Backbone.View 
  template : JST["backbone/templates/posts/form"]
  
  events :
    "submit #form-post" : "update"
  initialize: () ->
    @origData = @model.clone()
    
  update: (e) ->
    valid = @validateBeforeUpdate()
    if valid
      e.preventDefault()
      e.stopPropagation()
      alert('Updating')
      @model.save(null,
        success : (post) =>
          @model = post
          console.log(window.location)
          #window.location.hash = "/#{@model.id}"
          window.location.hash = ""
      )
    else
      @model.set(@origData.attributes, {silent: true})
      false
  
  render: ->
    $(@el).html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    return this
    
  validateBeforeUpdate: () =>
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
    
