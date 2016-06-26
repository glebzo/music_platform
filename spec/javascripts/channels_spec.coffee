describe 'Channels Collection', ->
  it 'Loads Available Channels', ->
    #fixture.load('layout')
    #, append = false
    
    expect(MusicPlatform.Collections.Channels).toBeDefined()

    channelsCollection = new MusicPlatform.Collections.Channels

    expect(channelsCollection).toBeDefined()

