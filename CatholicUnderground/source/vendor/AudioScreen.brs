'**********************************************************
'**  Catholic Underground Roku App
'**  June 2012
'**  Copyright (c) 2012 The Catholic Underground, Inc.
'**  Author Travis Boudreaux <tjboudreaux@gmail.com>
'**********************************************************



REM ******************************************************
REM
REM Show audio screen
REM
REM Upon entering screen, should start playing first audio stream
REM
REM ******************************************************
Sub ShowAudioScreen(episode as Object)
    Audio = AudioInit()
    picture = episode.HDPosterUrl
    o = CreateObject("roAssociativeArray")
    o.HDPosterUrl = picture
    o.Title = episode.title
    o.Description = episode.description
    o.contenttype = "episode"
    o.length = episode.length
    'print "length = " + episode.length
    scr = create_springboard(Audio.port, o.Title)
    scr.ReloadButtons(2) 'set buttons for state "playing"
    scr.screen.SetTitle("Screen Title")

    SaveCoverArtForScreenSaver(o.SDPosterUrl,o.HDPosterUrl)
    scr.screen.SetContent(o)

    scr.Show()

    ' start playing
    Audio.setupEpisode(episode.streams, "mp3")
    Audio.audioplayer.setNext(0)
    Audio.setPlayState(2)   ' start playing

    while true
        msg = Audio.getMsgEvents(20000, "roSpringboardScreenEvent")

        if type(msg) = "roAudioPlayerEvent"  then ' event from audio player
            if msg.isStatusMessage() then
                message = msg.getMessage()
                print "AudioPlayer Status Event - " message
                if message = "end of playlist"
                    print "end of playlist (obsolete status msg event)"
                        ' ignore
                else if message = "end of stream"
                    print "done playing this episode (obsolete status msg event)"
                    'audio.setPlayState(0)  ' stop the player, wait for user input
                    'scr.ReloadButtons(0)    ' set button to allow play start
                endif
            else if msg.isListItemSelected() then
                print "starting episode:"; msg.GetIndex()
                else if msg.isRequestSucceeded()
                print "ending episode:"; msg.GetIndex()
                audio.setPlayState(0) ' stop the player, wait for user input
                scr.ReloadButtons(0)    ' set button to allow play start
            else if msg.isRequestFailed()
                print "failed to play episode:"; msg.GetData()
            else if msg.isFullResult()
                print "FullResult: End of Playlist"
            else if msg.isPaused()
                print "Paused"
            else if msg.isResumed()
                print "Resumed"
            else
                print "ignored event type:"; msg.getType()
            endif
        else if type(msg) = "roSpringboardScreenEvent" then ' event from user
            if msg.isScreenClosed()
                print "Show_Audio_Screen: screen close - return"
                Audio.setPlayState(0)
                return
            endif
            if msg.isRemoteKeyPressed() then
                button = msg.GetIndex()
                print "Remote Key button = "; button
            else if msg.isButtonPressed() then
                button = msg.GetIndex()
                print "button index="; button
                if button = 1 'pause or resume
                    if Audio.isPlayState < 2  ' stopped or paused?
                        if (Audio.isPlayState = 0)
                              Audio.audioplayer.setNext(0)
                        endif
                        newstate = 2  ' now playing
        else 'started
                         newstate = 1 ' now paused
                    endif
                else if button = 2 ' stop
                    newstate = 0 ' now stopped
                endif
                audio.setPlayState(newstate)
                scr.ReloadButtons(newstate)
                scr.Show()
            endif
        endif
    end while
End Sub
