//
// State_FindSmallestUnsigned.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_FindSmallestUnsigned.h"

#include "State_FindSmallestUnsigned_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

FindSmallestUnsigned::FindSmallestUnsigned(const char *name): CLState(name, *new FindSmallestUnsigned::OnEntry, *new FindSmallestUnsigned::OnExit, *new FindSmallestUnsigned::Internal)
{
	_transitions[0] = new Transition_0();
}

FindSmallestUnsigned::~FindSmallestUnsigned()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void FindSmallestUnsigned::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_FindSmallestUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_FindSmallestUnsigned_FuncRefs.mm"
#	include "State_FindSmallestUnsigned_OnEntry.mm"
}

void FindSmallestUnsigned::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_FindSmallestUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_FindSmallestUnsigned_FuncRefs.mm"
#	include "State_FindSmallestUnsigned_OnExit.mm"
}

void FindSmallestUnsigned::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_FindSmallestUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_FindSmallestUnsigned_FuncRefs.mm"
#	include "State_FindSmallestUnsigned_Internal.mm"
}

bool FindSmallestUnsigned::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_FindSmallestUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_FindSmallestUnsigned_FuncRefs.mm"

	return
	(
#		include "State_FindSmallestUnsigned_Transition_0.expr"
	);
}
