//
// State_SetSmallestOutput.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_SetSmallestOutput.h"

#include "State_SetSmallestOutput_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

SetSmallestOutput::SetSmallestOutput(const char *name): CLState(name, *new SetSmallestOutput::OnEntry, *new SetSmallestOutput::OnExit, *new SetSmallestOutput::Internal, NULLPTR, new SetSmallestOutput::OnSuspend, new SetSmallestOutput::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

SetSmallestOutput::~SetSmallestOutput()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
	delete _transitions[1];
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

void SetSmallestOutput::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetSmallestOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetSmallestOutput_FuncRefs.mm"
#	include "State_SetSmallestOutput_OnSuspend.mm"
}

void SetSmallestOutput::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetSmallestOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetSmallestOutput_FuncRefs.mm"
#	include "State_SetSmallestOutput_OnResume.mm"
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

bool SetSmallestOutput::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SetSmallestOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SetSmallestOutput_FuncRefs.mm"

	return
	(
#		include "State_SetSmallestOutput_Transition_1.expr"
	);
}
