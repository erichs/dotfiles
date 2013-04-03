#!/usr/bin/env python

# ii, Interest Integrator
# Ron Hale-Evans, rwhe@ludism.org
# 2010-05-20

# Converted to Python by Charles Cave
# http://charuzu.wordpress.com
# 2011-09-20

def munge(instr):
    instr = instr.replace('"', '%22')
    instr = instr.replace('+', '%2B')
    instr = instr.replace(' ', '+')
    instr = instr.replace('|', '%7C')
    return instr

def random_obsession():
    return obsessions[random.randrange(0, maxobs)].rstrip()

################################################

import sys, random, webbrowser
nargs = len(sys.argv)

random.seed()

obf = open("/Users/esmith/bin/obsessions.txt", "r")
obsessions = obf.readlines()
maxobs = len(obsessions)

if (nargs > 3):
    print "python ii.py AAA BBB Googles both terms"
    print "python ii.py AAA Googles one term"
    print "python ii.py Googles two random terms"
    sys.exit(1)

if (nargs == 3):
    arg1 = sys.argv[1]
    arg2 = sys.argv[2]

if (nargs == 2):
    arg1 = sys.argv[1]
    arg2 = random_obsession()

if (nargs == 1):
    arg1 = random_obsession()
    arg2 = random_obsession()

google = "http://www.google.com/search?num=100&q="
search_url = google + munge(arg1) + "+" + munge(arg2)
print search_url

webbrowser.open(search_url)

