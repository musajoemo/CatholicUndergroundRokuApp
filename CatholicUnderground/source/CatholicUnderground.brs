'**********************************************************
'**  Catholic Underground Roku App
'**  June 2012
'**  Copyright (c) 2012 The Catholic Underground, Inc.
'**  Author Travis Boudreaux <tjboudreaux@gmail.com>
'**********************************************************

REM ******************************************************
REM
REM CreateCategories
REM
REM Create the categories for the PosterScreen
REM
REM ******************************************************
Function CreateCategories()
    aa = CreateObject("roAssociativeArray")
    aa.PosterItems = CreateObject("roArray", 5, true)

    'LiveStream will be part of 2.0 release
    'Category = CreatePosterItem("LiveStream","CU Live Stream","Watch the CU Live Stream")
    'Category.process=doLiveStream
    'aa.PosterItems.push(Category)

    'Video Podcast will be a part of 2.0 release
    'Category = CreatePosterItem("VideoPodcast","CU Video Podcast","Watch the CU Crew")
    'Category.Process = doVideoPodcast
    'aa.PosterItems.push(Category)

    Category = CreatePosterItem("AudioPodcast","CU Weekly","Whether it's current events, social networking, breaking news from the Catholic world, or the newest gadget on the market, the cu crew is in the know.", "weekly")
    Category.Process = doWeeklyAudioPodcast
    aa.PosterItems.push(Category)

    Category = CreatePosterItem("AudioPodcast","Life Is Still Worth Living","Life is Still Worth Living is an homage to the great Bishop Fulton J Sheen who took even the most complicated mysteries of the Catholic faith and brought them right down to the everyman.", "liswl")
    Category.Process = DoLifeIsStillWorthLivingAudioPodcast
    aa.PosterItems.push(Category)

    Category = CreatePosterItem("AudioPodcast","CU Specials","From Christmas and Easter prayers to commentary on the new Roman Missal... Special programming from the CU.", "specials")
    Category.Process = DoCUSpecialsAudioPodcast
    aa.PosterItems.push(Category)


    Category = CreatePosterItem("AudioPodcast","Fridays With Benedict","", "fwb")
    Category.Process = DoFridaysWithBenedictAudioPodcast
    aa.PosterItems.push(Category)

    Category = CreatePosterItem("AudioPodcast","Finding Your Keys","", "fyk")
    Category.Process = DoFindingYourKeysAudioPodcast
    aa.PosterItems.push(Category)



    return aa
End Function

REM ******************************************************
REM
REM Main - all Roku scripts startup here.
REM
REM
REM ******************************************************
Sub Main()
    print "Entering Main"
    SetMainAppIsRunning()

    ' Set up the basic color scheme
    SetTheme()

    ' Create a list of audio programs to put in the selection screen
    Categories = CreateCategories()

    ' Display the selection screen
    Pscreen = StartPosterScreen(Categories,"","Shows")

    while true
        Category = Pscreen.GetSelection(0)    ' returns a selection
        if Category = -1 then
            return
        endif
        Categories.PosterItems[Category].Process("Shows")
    end while

    print "Exiting Main"
End Sub

REM ******************************************************
REM
REM Setup theme for the application
REM
REM ******************************************************
Sub SetTheme()
    app = CreateObject("roAppManager")
    theme = CreateObject("roAssociativeArray")

    theme.OverhangOffsetSD_X = "72"
    theme.OverhangOffsetSD_Y = "25"
    theme.OverhangSliceSD = "pkg:/images/Overhang_Background_SD.png"
    theme.OverhangLogoSD  = "pkg:/images/Overhang_Logo_SD.png"

    theme.OverhangOffsetHD_X = "123"
    theme.OverhangOffsetHD_Y = "48"
    theme.OverhangSliceHD = "pkg:/images/Overhang_Background_HD.png"
    theme.OverhangLogoHD  = "pkg:/images/Overhang_Logo_HD.png"

    app.SetTheme(theme)
End Sub