//
// ParentMachine_VarRefs.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

ParentMachine *_m = static_cast<ParentMachine *>(_machine);

#extern	&LED: out std_logic = _m->LED: out std_logic;	///<
#machine	&signal childCommand: std_logic_vector(1 downto 0) = _m->signal childCommand: std_logic_vector(1 downto 0);	///<
#machine	&signal childsLED: std_logic = _m->signal childsLED: std_logic;	///<
#machine	&signal childSuspended: std_logic = _m->signal childSuspended: std_logic;	///<

#pragma clang diagnostic pop
