#!/bin/sh
# $Id: deletecdb.sh,v 1.1 2000/03/25 14:28:31 kenji Exp $

RM=/bin/rm

${RM} ./byte.h
${RM} ./byte_copy.c
${RM} ./byte_diff.c
${RM} ./cdb.c
${RM} ./cdb.h
${RM} ./cdb_hash.c
${RM} ./error.c
${RM} ./error.h
${RM} ./readwrite.h
${RM} ./seek.h
${RM} ./seek_set.c
${RM} ./uint32.h
${RM} ./uint32_unpack.c

