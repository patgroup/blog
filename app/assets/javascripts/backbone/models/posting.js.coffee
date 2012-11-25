class Blog.Models.Posting extends Backbone.Model
  paramRoot: 'posting'

  defaults:
    name: null
    title: null
    content: null

class Blog.Collections.PostingsCollection extends Backbone.Collection
  model: Blog.Models.Posting
  url: '/postings'
