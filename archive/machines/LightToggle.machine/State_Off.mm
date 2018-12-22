//
// State_Off.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "LightToggle_Includes.h"
#include "LightToggle.h"
#include "State_Off.h"

#include "State_Off_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMLightToggle;
using namespace State;

Off::Off(const char *name): CLState(name, *new Off::OnEntry, *new Off::OnExit, *new Off::Internal)
{
	_transitions[0] = new Transition_0();
}

Off::~Off()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Off::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightToggle_VarRefs.mm"
#	include "State_Off_VarRefs.mm"
#	include "LightToggle_FuncRefs.mm"
#	include "State_Off_FuncRefs.mm"
#	include "State_Off_OnEntry.mm"
}

void Off::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightToggle_VarRefs.mm"
#	include "State_Off_VarRefs.mm"
#	include "LightToggle_FuncRefs.mm"
#	include "State_Off_FuncRefs.mm"
#	include "State_Off_OnExit.mm"
}

void Off::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightToggle_VarRefs.mm"
#	include "State_Off_VarRefs.mm"
#	include "LightToggle_FuncRefs.mm"
#	include "State_Off_FuncRefs.mm"
#	include "State_Off_Internal.mm"
}

bool Off::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "LightToggle_VarRefs.mm"
#	include "State_Off_VarRefs.mm"
#	include "LightToggle_FuncRefs.mm"
#	include "State_Off_FuncRefs.mm"

	return
	(
#		include "State_Off_Transition_0.expr"
	);
}
