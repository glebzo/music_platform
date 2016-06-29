window.MusicPlatform ||= new Marionette.Application();

MusicPlatform.Collections ||= {}
MusicPlatform.Models ||= {}
MusicPlatform.Views ||= {}
MusicPlatform.Routes ||= {}


MusicPlatform.on 'before:start', ->
  LoadDependencies()

MusicPlatform.on 'start', ->
  MusicPlatform.ReloadRegionContainer()
  MusicPlatform.fetchAndRenderChannels()

jQuery ->
  $(document).pjax 'a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])', '[data-pjax-container]'
  MusicPlatform.start()







#  Helpers
LoadDependencies = ->
  MusicPlatform.fetchAndRenderChannels = ->
    channelsCollection = new MusicPlatform.Collections.Channels()
    channelsCollection.fetch()

    channelsCollectionView = new MusicPlatform.Views.Channels(
      collection: channelsCollection
    )

    MusicPlatform.regions.channels_composite.show(channelsCollectionView)


  # Initialize Layout and Regions
  MusicPlatform.ReloadRegionContainer = ->
    RegionContainer = Marionette.LayoutView.extend(
      el: '#app'

      regions:
        channels_composite: '#channels_composite'
    )
    MusicPlatform.regions = new RegionContainer()
