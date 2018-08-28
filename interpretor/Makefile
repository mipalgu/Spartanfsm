SRCS?=main.hs
E?=@

build:
	$Eghc ${SRCS} -odir bin -hidir bin
	$Emv main spartanllfsm

clean:
	$Erm -f bin/* spartanllfsm

install:
	$Emkdir -p ~/spartanllfsm
	$Emv spartanllfsm /usr/local/bin

uninstall:
	$Erm -f /usr/local/bin/spartanllfsm
	$Erm -rf ~/spartanllfsm
