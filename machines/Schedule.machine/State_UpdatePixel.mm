//
// State_UpdatePixel.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "Schedule_Includes.h"
#include "Schedule.h"
#include "State_UpdatePixel.h"

#include "State_UpdatePixel_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSchedule;
using namespace State;

UpdatePixel::UpdatePixel(const char *name): CLState(name, *new UpdatePixel::OnEntry, *new UpdatePixel::OnExit, *new UpdatePixel::Internal)
{
	_transitions[0] = new Transition_0();
}

UpdatePixel::~UpdatePixel()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void UpdatePixel::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_VarRefs.mm"
#	include "State_UpdatePixel_VarRefs.mm"
#	include "Schedule_FuncRefs.mm"
#	include "State_UpdatePixel_FuncRefs.mm"
#	include "State_UpdatePixel_OnEntry.mm"
}

void UpdatePixel::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_VarRefs.mm"
#	include "State_UpdatePixel_VarRefs.mm"
#	include "Schedule_FuncRefs.mm"
#	include "State_UpdatePixel_FuncRefs.mm"
#	include "State_UpdatePixel_OnExit.mm"
}

void UpdatePixel::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_VarRefs.mm"
#	include "State_UpdatePixel_VarRefs.mm"
#	include "Schedule_FuncRefs.mm"
#	include "State_UpdatePixel_FuncRefs.mm"
#	include "State_UpdatePixel_Internal.mm"
}

bool UpdatePixel::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Schedule_VarRefs.mm"
#	include "State_UpdatePixel_VarRefs.mm"
#	include "Schedule_FuncRefs.mm"
#	include "State_UpdatePixel_FuncRefs.mm"

	return
	(
#		include "State_UpdatePixel_Transition_0.expr"
	);
}
