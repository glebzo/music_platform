class MusicPlatform.Collections.Channels extends Backbone.Collection

  url: '/api/channels'
  model: MusicPlatform.Models.Channel
  comparator: 'name'

  playing_channel: false