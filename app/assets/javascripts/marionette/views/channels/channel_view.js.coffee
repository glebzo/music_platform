class MusicPlatform.Views.Channel extends Marionette.ItemView.extend(
  initialize: ->
    this.listenTo(this.model, 'change:is_playing', this.TogglePlayIcon)


  template: '#channel-item-view'

  events:
    'click .play-me': 'TogglePlay'

  TogglePlay: ->
    this.model.TogglePlay()

  TogglePlayIcon: ->
    this.$('#is_playing').toggleClass('icon-control-pause')
)