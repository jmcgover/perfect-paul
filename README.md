# Perfect Paul

Tools to get DECTalk working for incorporation into a Twitch bot.

# TODO

- [x] Figure out how to build `say.c` on a modern machine
- [x] Write instructions on how to build
- [ ] Add a compiled `say.exe` to the Releases section
- [ ] Make the sound output configurable

# Further Reading

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
