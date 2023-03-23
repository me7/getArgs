# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import getArgs
test "ffmpeg sample":
  let params = "ffmpeg -i input.wav -vn -ar 44100 -ac 2 -b:a 192k output.mp3".split(" ")
  let args = getArgs params
  check:
    args == @[("ffmpeg", ""), ("-i", "input.wav"), ("-vn", ""), ("-ar",
        "44100"), ("-ac", "2"), ("-b:a", "192k"), ("output.mp3", "")]
    args[1] == ("-i", "input.wav")
    args["-ar"] == "44100"
    args.getOrDefault("-aa", "b") == "b"
    args[1].key == "-i"

