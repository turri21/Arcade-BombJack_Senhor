-=(BombJack_Senhor notes)=-

Tested: Working Video 720p, 1080p & Sound

sys/sys_top.sv reg lowlat = 1; //Senhor: Set to 1 (previous value 0) to fix the pixel edge color artifacts when MISTER_FB=1 is enabled in the .qsf

---------------------------------------------------------------------------------
-- 
-- Arcade: Bomb Jack port to MiSTer by Sorgelig
-- 03 November 2017
-- 
---------------------------------------------------------------------------------
-- Bomb Jack implementation in FPGA. Author: Alex 
-- http://papilio.cc/index.php?n=Playground.BombJack
---------------------------------------------------------------------------------
-- 
-- Support screen and controls rotation on HDMI output.
-- Only controls are rotated on VGA output.
-- 
-- 
-- Keyboard inputs :
--
--   F2          : Insert the coin + Start 2 players
--   F1          : Insert the coin + Start 1 player
--   UP,DOWN,LEFT,RIGHT arrows : Movements
--   SPACE       : Jump
--
-- MAME/IPAC/JPAC Style Keyboard inputs:
--   5           : Coin 1
--   6           : Coin 2
--   1           : Start 1 Player
--   2           : Start 2 Players
--   R,F,D,G     : Player 2 Movements
--   A           : Player 2 Jump
--
-- Joystick support.
-- 
-- 
----------------------------------------------

Hiscore save/load:

Save and load of hiscores is supported for this core.

To save your hiscores manually, press the 'Save Settings' option in the OSD.  Hiscores will be automatically loaded when the core is started.

To enable automatic saving of hiscores, turn on the 'Autosave Hiscores' option, press the 'Save Settings' option in the OSD, and reload the core.  Hiscores will then be automatically saved (if they have changed) any time the OSD is opened.

Hiscore data is stored in /media/fat/config/nvram/ as ```<mra filename>.nvm```

----------------------------------------------
                                *** Attention ***

ROMs are not included. In order to use this arcade, you need to provide the
correct ROMs.

To simplify the process .mra files are provided in the releases folder, that
specifies the required ROMs with checksums. The ROMs .zip filename refers to the
corresponding file of the M.A.M.E. project.

Please refer to https://github.com/MiSTer-devel/Main_MiSTer/wiki/Arcade-Roms for
information on how to setup and use the environment.

Quickreference for folders and file placement:

/_Arcade/<game name>.mra
/_Arcade/cores/<game rbf>.rbf
/_Arcade/mame/<mame rom>.zip
/_Arcade/hbmame/<hbmame rom>.zip
