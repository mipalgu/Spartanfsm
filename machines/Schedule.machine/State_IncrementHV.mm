//
// State_IncrementHV.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "Schedule_Includes.h"
#include "Schedule.h"
#include "State_IncrementHV.h"

#include "State_IncrementHV_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSchedule;
using namespace State;

IncrementHV::IncrementHV(const char *name): CLState(name, *new IncrementHV::OnEntry, *new IncrementHV::OnExit, *new IncrementHV::Internal)
{
	_transitions[0] = new Transition_0();
}

IncrementHV::~IncrementHV()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void IncrementHV::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_VarRefs.mm"
#	include "State_IncrementHV_VarRefs.mm"
#	include "Schedule_FuncRefs.mm"
#	include "State_IncrementHV_FuncRefs.mm"
#	include "State_IncrementHV_OnEntry.mm"
}

void IncrementHV::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_VarRefs.mm"
#	include "State_IncrementHV_VarRefs.mm"
#	include "Schedule_FuncRefs.mm"
#	include "State_IncrementHV_FuncRefs.mm"
#	include "State_IncrementHV_OnExit.mm"
}

void IncrementHV::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_VarRefs.mm"
#	include "State_IncrementHV_VarRefs.mm"
#	include "Schedule_FuncRefs.mm"
#	include "State_IncrementHV_FuncRefs.mm"
#	include "State_IncrementHV_Internal.mm"
}

bool IncrementHV::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_VarRefs.mm"
#	include "State_IncrementHV_VarRefs.mm"
#	include "Schedule_FuncRefs.mm"
#	include "State_IncrementHV_FuncRefs.mm"

	return
	(
#		include "State_IncrementHV_Transition_0.expr"
	);
}
