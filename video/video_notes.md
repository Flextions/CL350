# Video Notes

#### Notes about the production of youtube video of aircraft memory items

1. revealjs run locally with

        python -m SimpleHTTPServer

2. Changes to index.html

    - delete of hide instruction div

    - autoplay, hidden slide controls, 500 auto advance, 0 opacity, etc.

          Reveal.initialize({
          // Display presentation control arrows
          controls: false,

          // Display a presentation progress bar
          progress: false,

          audio: {
                  prefix: 'snd/', 	// audio files are stored in the "audio" folder
                  suffix: '.mp3',		// audio files have the ".ogg" ending
                  textToSpeechURL: null,  // the URL to the text to speech converter
                  defaultNotes: false, 	// use slide notes as default for the text to speech converter
                  defaultText: false, 	// use slide text as default for the text to speech converter
                  advance: 500, 		// advance to next slide after given time in milliseconds after audio has played, use negative value to not advance
                  autoplay: true,	// automatically start slideshow
                  defaultDuration: 2,	// default duration in seconds if no audio is available
                  playerOpacity: 0.00,	// opacity value of audio player if unfocused
                  playerStyle: 'position: fixed; bottom: 0px; left: 25%; width: 50%; height:75px; z-index: 33;', // style used for container of audio controls
                  startAtFragment: false, // when moving to a slide, start at the current fragment or at the start of the slide
                },
                menu: {
                  // Adds a menu button to the slides to open the menu panel.
                  // Set to 'false' to hide the button.
                  openButton: false,

3. screencast paused with ```.``` button before running ffmpeg

4. ffmpeg

    to create video:

        ffmpeg -y -r 24 -f x11grab -s 1920x1080 -i ${DISPLAY} -c:v libx264 -crf 0 -preset:v ultrafast -pix_fmt yuv420p video.mkv

    to create audio:

        ffmpeg -f pulse -i alsa_output.pci-0000_00_1b.0.analog-stereo.monitor audio.wav

5. use openshot to edit and combine audio and video.

    - fade in and out video etc.
