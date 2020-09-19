SRCS?=main.hs io.hs strings.hs format.hs helpers.hs variables.hs generation.hs license.hs
E?=@
bin_name?=spartanfsm

build:
	$Eghc ${SRCS} -odir bin -hidir bin
	$Emv main ${bin_name}

clean:
	$Erm -f bin/* ${bin_name}

install: 
	$Emv ${bin_name} /usr/local/bin

uninstall:
	$Erm -f /usr/local/bin/${bin_name}

manpage:
	$Ecp man/spartanfsm /usr/local/man/man1/spartanfsm.1
	$Egzip -f /usr/local/man/man1/spartanfsm.1
