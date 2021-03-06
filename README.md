# dbskkd-cdb readme/installation note in English

*Announcement 10-JAN-2018: no further development will be made on dbskkd-cdb.*

for version dbskkd-cdb-3.00

by Kenji Rikitake <mailto:kenji.rikitake@acm.org>

last updated 13-NOV-2016

## Travis CI build status for the master branch

[![Build Status](https://travis-ci.org/jj1bdx/dbskkd-cdb.svg?branch=master)](https://travis-ci.org/jj1bdx/dbskkd-cdb)

## Summary

dbskkd-cdb is a dictionary server for SKK Japanese Input Method system.
For building the executable file, [TinyCDB](http://www.corpit.ru/mjt/tinycdb.html)
is required.
See `skk-server-protocol.md` for the details of the server-client protocol.

## License

See `LICENSE`. The MIT License.

## Test environment

* FreeBSD/amd64 11.0-STABLE
* Periodically tested on [Travis CI](https://travis-ci.org/jj1bdx/dbskkd-cdb) with both clang and gcc

## Installation procedure

1. makeskkcdb.sh converts a plaintext SKK dictionary to the CDB format.
   The default source file name is `/usr/local/share/skk/SKK-JISYO.L`
   and the converted cdb file will be placed in the current directory
   as `SKK-JISYO.L.cdb`.  This `.cdb` file should be placed with the filename
   specified in `JISYO_FILE` macro in `dbskkd-cdb.c`.

2. Do `make` to compile.  This require `cdb.h` and `libcdb.a` of TinyCDB.
   For the Make prodecure on Linux, consult `.travis.yml`.

3. Do `make install` to copy the compile executable image to the
   executable image directory.  The default directory is `/usr/local/libexec`.

## User privilege on installation

Assign a dedicated non-privileged user for this program and invoke with
the uid.

DO NOT invoke with the root or superuser privilege.

See `examples.md` for the configuration examples.

## Note on collecting user information

dbskkd-cdb does *not* collect any usage statistics or information.

## Bug reports and comments

The source code repository and issue tracker is available in Github at
<http://github.com/jj1bdx/dbskkd-cdb>.  
Inquiries and comments are welcome by the forms of GitHub Pull Requests
and issues in Japanese and English.  If you do not want to use GitHub,
contact Kenji Rikitake by email for your proposals.

## Acknowledgment

Daniel J. Bernstein for his cdb, Michael Tokarev for his TinyCDB.

SKK developers and contributors including:

Makahito Sato, Mikio Nakajima, Yukiyoshi Kameyama, Masaaki Sato,
Takashi Sakamoto, Fumitoshi Ukai, Toshinori Maeno, Yasuhiro Honda,
Hayao Nakahara, Takahiro Kikuchi, Hideo Matsumoto, Hidetaka Koie,
Takao Kawamura, Hideto Kihara, Rikishi Inakazu, Makoto Matsushita,
Atsushi Yamagata, Tatsuya Kinoshita, Ryosuke Nakai, Hajimu Umemoto.
