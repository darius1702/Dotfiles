#!/usr/bin/env python3

import subprocess
import time

from pathlib import Path

# TODO: add `-r reset_string` cmd arg

# TODO: add option parsing for .screenlayout path
screenlayout_dir = "~/.screenlayout/"
screenlayout_path = Path(screenlayout_dir).expanduser()

layouts = ["go", "home", "home_rotated"]

# TODO: extend this with cmd options for dmenu args and prompt
dmenu_prompt = "Screenlayout: "

dmenu_cmd = ["dmenu", "-p", dmenu_prompt, "-l", "5"]

# yoink https://github.com/allonhadaya/dmenu-pytho
try:
    proc = subprocess.Popen(
        dmenu_cmd,
        universal_newlines=True,
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
except OSError as err:
    print("ERROR: ", err)

with proc.stdin:
    for layout in layouts:
        proc.stdin.write(layout)
        proc.stdin.write("\n")

if proc.wait() == 0:
    choice = proc.stdout.read().rstrip("\n")
    subprocess.run(screenlayout_path / Path(choice + ".sh"))
    time.sleep(1.5)
    subprocess.run(["i3-msg", "restart"])
else:
    stderr = proc.stderr.read()

    if stderr != "":
        print("Dmenu error: ", stderr)
