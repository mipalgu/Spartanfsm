SRCS?=main.hs io.hs stringManipulation.hs LLFSMFormat.hs helpers.hs VHDLGeneration.hs license.hs
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
