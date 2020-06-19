SRCS?=main.hs io.hs stringManipulation.hs LLFSMFormat.hs helpers.hs VHDLGeneration.hs
E?=@

build:
	$Eghc ${SRCS} -odir bin -hidir bin
	$Emv main spartanllfsm

clean:
	$Erm -f bin/* spartanllfsm

install:
	$Emv spartanllfsm /usr/local/bin

uninstall:
	$Erm -f /usr/local/bin/spartanllfsm
