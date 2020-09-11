//
// State_FindSmallestSigned.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_FindSmallestSigned.h"

#include "State_FindSmallestSigned_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

FindSmallestSigned::FindSmallestSigned(const char *name): CLState(name, *new FindSmallestSigned::OnEntry, *new FindSmallestSigned::OnExit, *new FindSmallestSigned::Internal)
{
	_transitions[0] = new Transition_0();
}

FindSmallestSigned::~FindSmallestSigned()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void FindSmallestSigned::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_FindSmallestSigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_FindSmallestSigned_FuncRefs.mm"
#	include "State_FindSmallestSigned_OnEntry.mm"
}

void FindSmallestSigned::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_FindSmallestSigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_FindSmallestSigned_FuncRefs.mm"
#	include "State_FindSmallestSigned_OnExit.mm"
}

void FindSmallestSigned::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_FindSmallestSigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_FindSmallestSigned_FuncRefs.mm"
#	include "State_FindSmallestSigned_Internal.mm"
}

bool FindSmallestSigned::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_FindSmallestSigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_FindSmallestSigned_FuncRefs.mm"

	return
	(
#		include "State_FindSmallestSigned_Transition_0.expr"
	);
}
