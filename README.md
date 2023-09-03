# Perfect Paul

Tools to get DECtalk working for incorporation into a Twitch bot.

# TODO

- [x] Figure out how to build `say.c` on a modern machine
- [x] Write instructions on how to build
- [ ] Add a compiled `say.exe` to the Releases section
- [ ] Make the sound output configurable

# Further Reading

- http://theflameofhope.co/DECTALK.html
- https://github.com/dectalk/dectalk
- https://github.com/dectalk/list
- https://github.com/calzoneman/aeiou

# Instructions

There are two things this repo is here for:

- Building `say.exe` using the DECTalk libraries
- Providing releases of `say.exe`

## Building `say.exe`

Prerequisites:
- [Visual Studio](https://visualstudio.microsoft.com/downloads/) (Community edition should be fine)
  - Likely will need to install the "Desktop development with C++" workload from the Visual Studio Installer

1. Download DECTalk 4.61 via [DECtalkMain.zip](http://theflameofhope.co/dectalkreader1/)
2. Unzip DECtalkMain.zip
3. Install DECtalkMain
   - Run `DECtalkMain\Setup.exe`
4. Copy `'C:\Program Files (x86)\DECtalk\'` to some location in your user directory
   - The next step copies files from this folder, but the Program Files directory requires Administrator privileges
5. Run `.\setup.bat <copied-DECtalk-path>` to copy relevant build files to this directory, e.g.
```
.\setup.bat "../DECtalk"
```
6. Open this folder in Visual Studio
7. In Visual Studio, goto either: 
   - Tools > Command Line > Developer Command Line
   - Tools > Command Line > Developer Powershell
8. Use `nmake` to build `say.exe`:
```
nmake.exe /f "say.mak" CFG="say - Win32 Release"
```

By the end of all of this, your folder should look like the following:

```
> cmd /c tree /f
Folder PATH listing
Volume serial number is BEC3-0420
C:.
│   .gitignore
│   cleanup.bat
│   LICENSE
│   README.md
│   say.c
│   say.mak
│   setup.bat
│
├───.vs
│   │   ProjectSettings.json
│   │   slnx.sqlite
│   │   VSWorkspaceState.json
│   │
│   └───perfect-paul
│       ├───FileContentIndex
│       │       04b7fb90-8d78-4411-97f5-cc5745f40b04.vsidx
│       │       474592b4-cc43-47b0-970a-8795d46614e6.vsidx
│       │       4fd6c04e-eb8f-4307-819f-b710a30b207d.vsidx
│       │       9bab4b15-8509-4c91-9c4c-f0457d672a26.vsidx
│       │
│       └───v17
│               Browse.VC.db
│               Browse.VC.db-shm
│               Browse.VC.db-wal
│
├───build
│   └───us
│       └───release
│           │   say.exe
│           │
│           └───link
│                   say.obj
│                   vc140.idb
│
└───dapi
    ├───build
    │   └───dectalk
    │       ├───fr
    │       │   └───release
    │       │           dectalk.lib
    │       │
    │       ├───gr
    │       │   └───release
    │       │           dectalk.lib
    │       │
    │       ├───la
    │       │   └───release
    │       │           dectalk.lib
    │       │
    │       ├───sp
    │       │   └───release
    │       │           dectalk.lib
    │       │
    │       ├───uk
    │       │   └───release
    │       │           dectalk.lib
    │       │
    │       └───us
    │           └───release
    │                   dectalk.lib
    │
    └───src
        └───api
                ttsapi.h
```

9. Cleanup:
```
.\cleanup.bat
```

# Help Output

```
SAY  [options] [text]

Help Options:

    -h or -?          = Help.  Outputs this file to the console.  This
                        option cancels any others on the command line.

    -v                = Version.  Outputs version to the console. This
                        option cancels any others on the command line.


Audio Options:

    -a                = List devices and their device number. This
                        option cancels any others on the command line.

    -a <device-num>   = Use the specified device number for wave output 
                        Note: It performs no error checking on arg input 
                        or device number. Choose wisely.

Output Options:

    -w outFile        = Convert text into specified wave file instead of
                        speaking to the sound device.

    -l[t] outFile     = Turn on text logging, which logs all input text
                        to a file.  This text includes any pre and post
                        commands as well as commands sent to DECtalk by
                        the SAY program itself.

                        Since this is the default logging mode, the 't'
                        immediately following the '-l' is optional.

    -ls outFile       = Turn on syllable logging, which logs each
                        syllable to a  file.

    -lp outFile       = Turn on phoneme logging, which converts the
                        input text to phonemes.  This is useful if you
                        want to get DECtalk to sing.  You convert the
                        text to phonemes and then insert the tone
                        commands into the phoneme file.

    If no output options are specified, SAY sends its output to the
    installed sound device, ususally a sound card.  Only one output
    option can be specified; if you specify more than one, the last one
    on the command line is used.


Input Options:

    -pre preText      = Text to be passed to DECtalk before the normal input.
                        This is useful for passing initializing commands to
                        DECtalk that would normally not be part of the input.
                        If the prefix text has spaces, it must be enclosed in
                        quotes.  An example would be "[:phoneme on]" or
                        "[:nb :ra200]".

                        The prefix text is "forced" out before the input text
                        is read.

    -post postText    = Text to be passed to DECtalk after the normal input.
                        This is useful for passing terminating commands to
                        DECtalk that would normally not be part of the input.
                        If the postfix text has spaces, it must be enclosed
                        in quotes.  An example would be "[:phoneme off]" or
                        "The End".

                        The "normal" input is "forced" out before the postfix
                        text is read.

    text              = Text appearing on command line is spoken.  The text
                        to be spoken can either come from the standard
                        input or from the command line.

                        Anything on the command line that is not an option
                        will be interpreted as text, as will anything following
                        it on the command line.  In other words, text to
                        be spoken must appear on the command line after
                        all options.

                        If the *first* word in the text has a dash (-) or
                        slash (/) as its first character, you must precede
                        it with another dash or slash.  For example, to tell
                        DECtalk to say the number -123, you would type the
                        command
 
                          SAY --123

                        This is necessary to avoid having SAY interpret the
                        number as a command line option.

                        If you embed DECtalk commands into your text, you must
                        enclose them in quotes if they contain spaces.
                        This is because SAY treats each space-delimited
                        command-line argument as a separate "word",
                        while DECtalk commands must be processed as
                        single "words" by the SAY program.

    If no text is specified, SAY will take its input from the standard input.
    For example, you could have SAY speak a directory listing in Betty's
    voice by typing

        DIR | SAY -pre "[:nb]"

    or you could just type the command

        SAY

    and then enter text at the console.  In this case, SAY speaks each
    line after you press RETURN, and exits after you press CTRL-Z.  If
    you want SAY to take its input from a file, use file redirection as
    in the following example, which reads the file FOO.TXT in Harry's
    voice.

        SAY -pre "[:nh]" < FOO.TXT


Dictionary Options:

    -d userDict       = Loads the specified user dictionary before
                        speaking.  This dictionary is loaded in place of
                        any default user dictionary determined by DECtalk.
```
