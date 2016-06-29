
class MusicPlatform.Views.Channels extends Marionette.CompositeView
  template: '#channels-composite-view'

  childView: MusicPlatform.Views.Channel
  childViewContainer: '#channels-container'