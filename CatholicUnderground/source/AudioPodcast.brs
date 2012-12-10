'**********************************************************
'**  Catholic Underground Roku App
'**  June 2012
'**  Copyright (c) 2012 The Catholic Underground, Inc.
'**  Author Travis Boudreaux <tjboudreaux@gmail.com>
'**********************************************************

Sub DoWeeklyAudioPodcast(from as string)

    show = {
            shortDescriptionLine1:  "The Catholic Underground Audio Podcast"
            shortDescriptionLine2:  "Faith Gone Digital"
            sdPosterURL:            "pkg:/images/MainMenu.png"
            hdPosterURL:            "pkg:/images/MainMenu.png"
            url:                    "http://catholicunderground.com/category/shows/the-cu-weekly/feed/"
            categories:             []
    }

    ShowEpisodeScreen(show, show.shortDescriptionLine1, show.shortDescriptionLine2, true)

End Sub

Sub DoFridaysWithBenedictAudioPodcast(from as string)

    show = {
            shortDescriptionLine1:  "Fridays With Benedict"
            shortDescriptionLine2:  "Fr. Ryan catches you up on the latest from the Holy Father."
            sdPosterURL:            "pkg:/images/MainMenu.png"
            hdPosterURL:            "pkg:/images/MainMenu.png"
            url:                    "http://catholicunderground.com/category/shows/fwb/feed/"
            categories:             []
    }

    ShowEpisodeScreen(show, show.shortDescriptionLine1, show.shortDescriptionLine2, true)

End Sub

Sub DoFindingYourKeysAudioPodcast(from as string)

    show = {
            shortDescriptionLine1:  "Finding Your Keys"
            shortDescriptionLine2:  "Listen to archived episodes of Josh's radio show."
            sdPosterURL:            "pkg:/images/MainMenu.png"
            hdPosterURL:            "pkg:/images/MainMenu.png"
            url:                    "http://catholicunderground.com/category/shows/fyk/feed/"
            categories:             []
    }

    ShowEpisodeScreen(show, show.shortDescriptionLine1, show.shortDescriptionLine2, true)

End Sub

Sub DoLifeIsStillWorthLivingAudioPodcast(from as string)

    show = {
            shortDescriptionLine1:  "Life is Still Worth Living"
            shortDescriptionLine2:  "An homage to the great Bishop Fulton J Sheen who took even the most complicated mysteries of the Catholic faith and brought them right down to the everyman."
            sdPosterURL:            "pkg:/images/MainMenu.png"
            hdPosterURL:            "pkg:/images/MainMenu.png"
            url:                    "http://catholicunderground.com/category/shows/liswl/feed/"
            categories:             []
    }

    ShowEpisodeScreen(show, show.shortDescriptionLine1, show.shortDescriptionLine2, true)

End Sub

Sub DoCUSpecialsAudioPodcast(from as string)

    show = {
            shortDescriptionLine1:  "CU Specials"
            shortDescriptionLine2:  "From Christmas and Easter prayers to commentary on the new Roman Missal... Special programming from the CU."
            sdPosterURL:            "pkg:/images/MainMenu.png"
            hdPosterURL:            "pkg:/images/MainMenu.png"
            url:                    "http://catholicunderground.com/category/shows/cu-specials/feed/"
            categories:             []
    }

    ShowEpisodeScreen(show, show.shortDescriptionLine1, show.shortDescriptionLine2, true)

End Sub