//
// State_FindSmallest.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_FindSmallest.h"

#include "State_FindSmallest_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

FindSmallest::FindSmallest(const char *name): CLState(name, *new FindSmallest::OnEntry, *new FindSmallest::OnExit, *new FindSmallest::Internal)
{
	_transitions[0] = new Transition_0();
}

FindSmallest::~FindSmallest()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void FindSmallest::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_FindSmallest_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_FindSmallest_FuncRefs.mm"
#	include "State_FindSmallest_OnEntry.mm"
}

void FindSmallest::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_FindSmallest_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_FindSmallest_FuncRefs.mm"
#	include "State_FindSmallest_OnExit.mm"
}

void FindSmallest::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_FindSmallest_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_FindSmallest_FuncRefs.mm"
#	include "State_FindSmallest_Internal.mm"
}

bool FindSmallest::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_FindSmallest_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_FindSmallest_FuncRefs.mm"

	return
	(
#		include "State_FindSmallest_Transition_0.expr"
	);
}
