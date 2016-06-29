class MusicPlatform.Collections.Channels extends Backbone.Collection
  url: '/api/v1/channels'
  model: MusicPlatform.Models.Channel
  comparator: 'name'

  playing_channel: false