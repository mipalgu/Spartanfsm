//
// State_ChangeOutput.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_ChangeOutput.h"

#include "State_ChangeOutput_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

ChangeOutput::ChangeOutput(const char *name): CLState(name, *new ChangeOutput::OnEntry, *new ChangeOutput::OnExit, *new ChangeOutput::Internal, NULLPTR, new ChangeOutput::OnSuspend, new ChangeOutput::OnResume)
{
	_transitions[0] = new Transition_0();
}

ChangeOutput::~ChangeOutput()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void ChangeOutput::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ChangeOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ChangeOutput_FuncRefs.mm"
#	include "State_ChangeOutput_OnEntry.mm"
}
 
void ChangeOutput::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ChangeOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ChangeOutput_FuncRefs.mm"
#	include "State_ChangeOutput_OnExit.mm"
}

void ChangeOutput::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ChangeOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ChangeOutput_FuncRefs.mm"
#	include "State_ChangeOutput_Internal.mm"
}

void ChangeOutput::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ChangeOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ChangeOutput_FuncRefs.mm"
#	include "State_ChangeOutput_OnSuspend.mm"
}

void ChangeOutput::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ChangeOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ChangeOutput_FuncRefs.mm"
#	include "State_ChangeOutput_OnResume.mm"
}
bool ChangeOutput::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_ChangeOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_ChangeOutput_FuncRefs.mm"

	return
	(
#		include "State_ChangeOutput_Transition_0.expr"
	);
}
