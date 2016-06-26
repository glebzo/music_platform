describe 'Channel', ->
  it 'Should toggle player state', ->
    channelModel = new MusicPlatform.Models.Channel

    channelModel.TogglePlay()
    expect(channelModel.is_playing).toBe(true)

    channelModel.TogglePlay()
    expect(channelModel.is_playing).toBe(false)