{"FF":"Default","A":[{"KEY_PATH":"C:\\Users\\dearv\\Documents\\TouchPortalScripts\\stream_info\\TwitchInfo.ps1","KEY_COMMANDLINE":"","KEY_TYPE":"RUN_POWERSHELL_SCRIPT_ACTION"}],"BD":1,"C":[],"BE":-13684944,"kSCM":25,"BG":-13684944,"E":[{"KEY_FP":"C:\\Users\\dearv\\Documents\\TouchPortalScripts\\stream_info\\data\\info.txt","KEY_TYPE":"ON_FILE_CHANGE"},{"TT":0,"KEY_TIMER_VALUE":"100","kTS":1,"KEY_TYPE":"TIMER_ACTION"},{"kS":"{\"STATE_ID\":\"StreamTitle\",\"STATE_PRETTY_NAME\":\"StreamTitle\",\"kiP\":0,\"STATE_COLOR\":\"#a046d4\",\"kT\":-1,\"STATE_DEFAULT_VALUE\":\"-\"}","kC":"1","kF":"C:\\Users\\dearv\\Documents\\TouchPortalScripts\\stream_info\\data\\info.txt","KEY_TYPE":"FILEIO_FILE_GET_LINE"},{"kS":"{\"STATE_ID\":\"StreamCategory\",\"STATE_PRETTY_NAME\":\"StreamCategory\",\"kiP\":0,\"STATE_COLOR\":\"#a046d4\",\"kT\":-1,\"STATE_DEFAULT_VALUE\":\"-\"}","kC":"2","kF":"C:\\Users\\dearv\\Documents\\TouchPortalScripts\\stream_info\\data\\info.txt","KEY_TYPE":"FILEIO_FILE_GET_LINE"},{"TT":0,"KEY_TIMER_VALUE":"50","kTS":1,"KEY_TYPE":"TIMER_ACTION"},{"kCStatus":"${value:StreamTitle}","KEY_TYPE":"KEY_TWITCH_SET_STATUS"},{"KEY_TYPE":"KEY_TWITCH_SET_GAME_NAME","kCgn":"${value:StreamCategory}"}],"kIAPBKC":-14803426,"I":"","ITS":false,"BiR":true,"kSCTY":0,"BiT":true,"kSCHS":false,"inS":"","IiS":true,"T":"Stream\nInformation","kSCAC":-14145496,"kSCC":-4611631,"kSCHRC":false,"THO":14,"id":"u507kki746hwu","GUdata":"","kSCIUFATS":false,"kCT":1,"kSIP":0,"TELS":5,"kSCI":"","kIAs":[],"GUid":-1,"kSCIIVA":true,"COLS":1,"TA":5,"TC":-1,"kSVP":0,"kSTP":0,"kSVAC":-10575407,"TO":28,"TP":2,"inB":false,"EXP":[],"kSD":0,"kSCTM":0,"TS":8,"inC":0,"ROWS":1}