//
// State_LowFour.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "LightShow_Includes.h"
#include "LightShow.h"
#include "State_LowFour.h"

#include "State_LowFour_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMLightShow;
using namespace State;

LowFour::LowFour(const char *name): CLState(name, *new LowFour::OnEntry, *new LowFour::OnExit, *new LowFour::Internal)
{
	_transitions[0] = new Transition_0();
}

LowFour::~LowFour()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void LowFour::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightShow_VarRefs.mm"
#	include "State_LowFour_VarRefs.mm"
#	include "LightShow_FuncRefs.mm"
#	include "State_LowFour_FuncRefs.mm"
#	include "State_LowFour_OnEntry.mm"
}

void LowFour::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightShow_VarRefs.mm"
#	include "State_LowFour_VarRefs.mm"
#	include "LightShow_FuncRefs.mm"
#	include "State_LowFour_FuncRefs.mm"
#	include "State_LowFour_OnExit.mm"
}

void LowFour::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightShow_VarRefs.mm"
#	include "State_LowFour_VarRefs.mm"
#	include "LightShow_FuncRefs.mm"
#	include "State_LowFour_FuncRefs.mm"
#	include "State_LowFour_Internal.mm"
}

bool LowFour::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "LightShow_VarRefs.mm"
#	include "State_LowFour_VarRefs.mm"
#	include "LightShow_FuncRefs.mm"
#	include "State_LowFour_FuncRefs.mm"

	return
	(
#		include "State_LowFour_Transition_0.expr"
	);
}
