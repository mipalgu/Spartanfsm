//
// State_SetInitialUnsigned.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_SetInitialUnsigned.h"

#include "State_SetInitialUnsigned_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

SetInitialUnsigned::SetInitialUnsigned(const char *name): CLState(name, *new SetInitialUnsigned::OnEntry, *new SetInitialUnsigned::OnExit, *new SetInitialUnsigned::Internal)
{
	_transitions[0] = new Transition_0();
}

SetInitialUnsigned::~SetInitialUnsigned()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SetInitialUnsigned::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetInitialUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetInitialUnsigned_FuncRefs.mm"
#	include "State_SetInitialUnsigned_OnEntry.mm"
}

void SetInitialUnsigned::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetInitialUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetInitialUnsigned_FuncRefs.mm"
#	include "State_SetInitialUnsigned_OnExit.mm"
}

void SetInitialUnsigned::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetInitialUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetInitialUnsigned_FuncRefs.mm"
#	include "State_SetInitialUnsigned_Internal.mm"
}

bool SetInitialUnsigned::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetInitialUnsigned_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetInitialUnsigned_FuncRefs.mm"

	return
	(
#		include "State_SetInitialUnsigned_Transition_0.expr"
	);
}
