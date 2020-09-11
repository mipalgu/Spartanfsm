//
// State_SetInitialSigned.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_SetInitialSigned.h"

#include "State_SetInitialSigned_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

SetInitialSigned::SetInitialSigned(const char *name): CLState(name, *new SetInitialSigned::OnEntry, *new SetInitialSigned::OnExit, *new SetInitialSigned::Internal)
{
	_transitions[0] = new Transition_0();
}

SetInitialSigned::~SetInitialSigned()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SetInitialSigned::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetInitialSigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetInitialSigned_FuncRefs.mm"
#	include "State_SetInitialSigned_OnEntry.mm"
}

void SetInitialSigned::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetInitialSigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetInitialSigned_FuncRefs.mm"
#	include "State_SetInitialSigned_OnExit.mm"
}

void SetInitialSigned::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetInitialSigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetInitialSigned_FuncRefs.mm"
#	include "State_SetInitialSigned_Internal.mm"
}

bool SetInitialSigned::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetInitialSigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetInitialSigned_FuncRefs.mm"

	return
	(
#		include "State_SetInitialSigned_Transition_0.expr"
	);
}
