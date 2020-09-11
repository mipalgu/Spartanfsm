//
// State_SetSmallestOutput.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_SetSmallestOutput.h"

#include "State_SetSmallestOutput_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

SetSmallestOutput::SetSmallestOutput(const char *name): CLState(name, *new SetSmallestOutput::OnEntry, *new SetSmallestOutput::OnExit, *new SetSmallestOutput::Internal)
{
	_transitions[0] = new Transition_0();
}

SetSmallestOutput::~SetSmallestOutput()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SetSmallestOutput::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetSmallestOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetSmallestOutput_FuncRefs.mm"
#	include "State_SetSmallestOutput_OnEntry.mm"
}

void SetSmallestOutput::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetSmallestOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetSmallestOutput_FuncRefs.mm"
#	include "State_SetSmallestOutput_OnExit.mm"
}

void SetSmallestOutput::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetSmallestOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetSmallestOutput_FuncRefs.mm"
#	include "State_SetSmallestOutput_Internal.mm"
}

bool SetSmallestOutput::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetSmallestOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetSmallestOutput_FuncRefs.mm"

	return
	(
#		include "State_SetSmallestOutput_Transition_0.expr"
	);
}
