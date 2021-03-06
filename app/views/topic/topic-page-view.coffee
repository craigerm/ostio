Collection = require 'models/base/collection'
NewPostFormView = require 'views/post/new-post-form-view'
PageView = require 'views/base/page-view'
Post = require 'models/post'
PostsView = require 'views/post/posts-view'
template = require 'views/templates/topic-page'

module.exports = class TopicPageView extends PageView
  template: template

  getNavigationData: ->
    gravatar_id: @model.get('repo').get('user').get('gravatarId'),
    user_login: @model.get('repo').get('user').get('username'),
    repo_name: @model.get('repo').get('title'),
    topic_number: @model.get('number')

  renderSubviews: ->
    @posts = new Collection null, model: Post
    @posts.url = @model.url('/posts/')
    @subview 'posts', new PostsView
      collection: @posts,
      container: @$('.topic-posts-container')
    @posts.fetch()

    @subscribeEvent 'post:new', (post) =>
      @posts.push post

    createNewPost = =>
      newPost = new Post topic: @model
      newPostView = new NewPostFormView
        model: newPost,
        container: @$('.new-post-form-container')
      newPostView.on 'dispose', =>
        setTimeout createNewPost, 0
      @subview 'newPostForm', newPostView
    createNewPost()

  dispose: ->
    return if @disposed
    @posts.dispose()
    delete @posts
    super
