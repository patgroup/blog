Blog.Views.Posts ||= {}

class Blog.Views.Posts.FormView extends Backbone.View
  template : JST["backbone/templates/posts/form"]
    
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
    elmObj = $(elm)
    if elmObj.is('input')
      elmObj.val().trim() == ""
    else if elmObj.is('textarea')
      elmObj.val().trim() == ""
      
  showError: (id) =>
    $('#'+id).addClass('error')
    $('#'+id+'-help').show()
    
  hideError: (id) =>
    $('#'+id).removeClass('error')
    $('#'+id+'-help').hide()
    
