# dbskkd-cdb Makefile

# Make with "make USE_TCPD=1" to support TCP wrapper (libwrap).

CC = cc -Wall -O2 -g -I/usr/local/include
COMPAT =
CDBLIB = /usr/local/lib/libcdb.a
TCPDLIB = -lwrap
INSTALLDIR = /usr/local/libexec
SYSTEMDDIR = /etc/systemd/system

CPPFLAGS = $(if $(USE_TCPD),-DUSE_TCPD)

.c.o:
	$(CC) $(CPPFLAGS) $(COMPAT) $(PRIVATE) -c $*.c

all: 	dbskkd-cdb 

clean:
	/bin/rm -f dbskkd-cdb *.o

dbskkd-cdb: dbskkd-cdb.o 
	$(CC) $(COMPAT) $(PRIVATE) -o dbskkd-cdb \
		dbskkd-cdb.o ${CDBLIB} $(if $(USE_TCPD),$(TCPDLIB))

dbskkd-cdb.o: dbskkd-cdb.c 

error.o: error.c error.h

install: dbskkd-cdb 
	cp dbskkd-cdb $(INSTALLDIR); chmod 755 $(INSTALLDIR)/dbskkd-cdb

install-systemd: install-systemd-socket install-systemd-service
install-systemd-socket:
	install -c -m644 systemd/dbskkd-cdb.socket $(SYSTEMDDIR)/dbskkd-cdb.socket
install-systemd-service:
	if sed 's|^\(ExecStart *= *\).*|\1$(INSTALLDIR)/dbskkd-cdb|' systemd/dbskkd-cdb@.service > $(SYSTEMDDIR)/dbskkd-cdb@.service.$$$$; then \
		chmod 644 $(SYSTEMDDIR)/dbskkd-cdb@.service.$$$$; \
		mv -f $(SYSTEMDDIR)/dbskkd-cdb@.service.$$$$ $(SYSTEMDDIR)/dbskkd-cdb@.service; \
	else \
		rm -f $(SYSTEMDDIR)/dbskkd-cdb@.service.$$$$; \
		false; \
	fi

# end of makefile
