//
// State_HighFour.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "LightShow_Includes.h"
#include "LightShow.h"
#include "State_HighFour.h"

#include "State_HighFour_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMLightShow;
using namespace State;

HighFour::HighFour(const char *name): CLState(name, *new HighFour::OnEntry, *new HighFour::OnExit, *new HighFour::Internal)
{
	_transitions[0] = new Transition_0();
}

HighFour::~HighFour()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void HighFour::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightShow_VarRefs.mm"
#	include "State_HighFour_VarRefs.mm"
#	include "LightShow_FuncRefs.mm"
#	include "State_HighFour_FuncRefs.mm"
#	include "State_HighFour_OnEntry.mm"
}

void HighFour::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightShow_VarRefs.mm"
#	include "State_HighFour_VarRefs.mm"
#	include "LightShow_FuncRefs.mm"
#	include "State_HighFour_FuncRefs.mm"
#	include "State_HighFour_OnExit.mm"
}

void HighFour::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightShow_VarRefs.mm"
#	include "State_HighFour_VarRefs.mm"
#	include "LightShow_FuncRefs.mm"
#	include "State_HighFour_FuncRefs.mm"
#	include "State_HighFour_Internal.mm"
}

bool HighFour::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "LightShow_VarRefs.mm"
#	include "State_HighFour_VarRefs.mm"
#	include "LightShow_FuncRefs.mm"
#	include "State_HighFour_FuncRefs.mm"

	return
	(
#		include "State_HighFour_Transition_0.expr"
	);
}
