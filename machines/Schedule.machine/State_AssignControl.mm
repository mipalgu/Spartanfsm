//
// State_AssignControl.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "Schedule_Includes.h"
#include "Schedule.h"
#include "State_AssignControl.h"

#include "State_AssignControl_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSchedule;
using namespace State;

AssignControl::AssignControl(const char *name): CLState(name, *new AssignControl::OnEntry, *new AssignControl::OnExit, *new AssignControl::Internal)
{
	_transitions[0] = new Transition_0();
}

AssignControl::~AssignControl()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void AssignControl::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_VarRefs.mm"
#	include "State_AssignControl_VarRefs.mm"
#	include "Schedule_FuncRefs.mm"
#	include "State_AssignControl_FuncRefs.mm"
#	include "State_AssignControl_OnEntry.mm"
}

void AssignControl::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_VarRefs.mm"
#	include "State_AssignControl_VarRefs.mm"
#	include "Schedule_FuncRefs.mm"
#	include "State_AssignControl_FuncRefs.mm"
#	include "State_AssignControl_OnExit.mm"
}

void AssignControl::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_VarRefs.mm"
#	include "State_AssignControl_VarRefs.mm"
#	include "Schedule_FuncRefs.mm"
#	include "State_AssignControl_FuncRefs.mm"
#	include "State_AssignControl_Internal.mm"
}

bool AssignControl::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_VarRefs.mm"
#	include "State_AssignControl_VarRefs.mm"
#	include "Schedule_FuncRefs.mm"
#	include "State_AssignControl_FuncRefs.mm"

	return
	(
#		include "State_AssignControl_Transition_0.expr"
	);
}
