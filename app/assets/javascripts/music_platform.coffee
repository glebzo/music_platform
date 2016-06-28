window.MusicPlatform = new Marionette.Application();

MusicPlatform.Collections = {}
MusicPlatform.Models = {}
MusicPlatform.Views = {}
MusicPlatform.Routes = {}

MusicPlatform.on 'before:start', ->
  # Initialize MusicPlatform Player &  Settings
  
  # // $('#jplayer').bind $.jPlayer.event.play, (event) ->
  # //   console.log 'playing'


  # Initialize Layout and Regions
  RegionContainer = Marionette.LayoutView.extend(
    el: '#app'

    regions:
      channels_composite: '#channels_composite'
  )
  MusicPlatform.regions = new RegionContainer()


MusicPlatform.on 'start', ->
  channelsCollection = new MusicPlatform.Collections.Channels()
  channelsCollection.fetch()

  channelsCollectionView = new MusicPlatform.Views.Channels(
    collection: channelsCollection
  )

  MusicPlatform.regions.channels_composite.show(channelsCollectionView)



jQuery ->
  console.log 'Dependincies are loaded. Starting Application ...'
  MusicPlatform.start()
  console.log 'Marionette Application started!'