{.used.} # override UnusedImport warning

import std/[os, strutils, times, parseutils, hashes, tables, sets, sequtils,
  parseopt, strformat, sugar, options, strscans, algorithm, math]

export os, strutils, times, parseutils, hashes, tables, sets, sequtils,
  parseopt, strformat, sugar, options, strscans, algorithm, math

type
  Args = seq[(string, string)]

proc getArgs*(params: seq[string]): Args =
  type State = enum
    stKey
    stVal
  var
    i = 0
    state = stVal
  while i <= params.high:
    case state
    of stVal:
      if params[i][0] != '-':
        result.add (params[i], "")
        inc i
      else:
        state = stKey
    of stKey:
      if i == params.high:
        result.add (params[i][1..^1], "")
        inc i
      elif params[i+1][0] == '-':
        result.add (params[i][1..^1], "")
        inc i
      else:
        result.add (params[i][1..^1], params[i+1])
        inc i, 2
        state = stVal

proc `[]`*(a: Args, i: int): (string, string) = a[i]

proc `[]`*(a: Args, key: string): string =
  for (k, v) in a:
    if k == key:
      return v

proc contains*(a: Args, key: string): bool =
  for pair in a:
    if pair[0] == key:
      return true

proc getOrDefault*(a: Args, key, default: string): string =
  result = if key in a: a[key] else: default
