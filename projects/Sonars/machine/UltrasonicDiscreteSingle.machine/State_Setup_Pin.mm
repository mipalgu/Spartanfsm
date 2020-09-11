//
// State_Setup_Pin.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "UltrasonicDiscreteSingle_Includes.h"
#include "UltrasonicDiscreteSingle.h"
#include "State_Setup_Pin.h"

#include "State_Setup_Pin_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMUltrasonicDiscreteSingle;
using namespace State;

Setup_Pin::Setup_Pin(const char *name): CLState(name, *new Setup_Pin::OnEntry, *new Setup_Pin::OnExit, *new Setup_Pin::Internal)
{
	_transitions[0] = new Transition_0();
}

Setup_Pin::~Setup_Pin()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Setup_Pin::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Setup_Pin_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Setup_Pin_FuncRefs.mm"
#	include "State_Setup_Pin_OnEntry.mm"
}

void Setup_Pin::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Setup_Pin_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Setup_Pin_FuncRefs.mm"
#	include "State_Setup_Pin_OnExit.mm"
}

void Setup_Pin::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Setup_Pin_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Setup_Pin_FuncRefs.mm"
#	include "State_Setup_Pin_Internal.mm"
}

bool Setup_Pin::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "UltrasonicDiscreteSingle_VarRefs.mm"
#	include "State_Setup_Pin_VarRefs.mm"
#	include "UltrasonicDiscreteSingle_FuncRefs.mm"
#	include "State_Setup_Pin_FuncRefs.mm"

	return
	(
#		include "State_Setup_Pin_Transition_0.expr"
	);
}
