# Loads player settings from LocalStorage
# JPlayer & jPlayerPlaylist

@MusicPlatformPlayer = do ->
  $('#jplayer').bind $.jPlayer.event.play, (event) ->
  # console.log event
  # console.log event.jPlayer.status.currentTime

  storage = $.localStorage
  jPlayer =  $('#jplayer')

  jPlayerPlaylistSettings =
    storage: $.localStorage
    settings: storage.get('setting') or {}
    bundle: false

    cssSelector:
      jPlayer: '#jplayer'
      cssSelectorAncestor: '#jp_container'
    options:
      enableRemoveControls: true
      loop: false
      swfPath: ''
      supplied: 'webmv, webma, ogv, oga, m4v, m4a, mp3'
      smoothPlayBar: true
      keyEnabled: true
      audioFullScreen: false
    playlist: [{mp3:"http://www.jplayer.org/audio/mp3/TSP-01-Cro_magnon_man.mp3"}]

    # Jplayer Jquery Object

  Playlist = new jPlayerPlaylist(
    jPlayerPlaylistSettings.cssSelector
    jPlayerPlaylistSettings.playlist
    jPlayerPlaylistSettings.options
  )

  # Currently Playing Channel
  lastChannelModel = null

  # Validate if
  PlayerController =
    setChannel: (channelModel) ->
      # Turn off last channel
      if lastChannelModel
        lastChannelModel.set('is_playing', false)

      # Override current channel
      lastChannelModel = channelModel
      # Turn on current channel
      lastChannelModel.set('is_playing', true)
      Playlist.playlist = [{mp3: '123'}]
      Playlist.play()
    pause: ->
      Playlist.pause()
      lastChannelModel.set('is_playing', false)

  {
    ## API ##

    play: (channelModel) ->
      PlayerController.setChannel(channelModel)
    pause: ->
      PlayerController.pause()
  }