//
// State_UnsignedOutput.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_UnsignedOutput.h"

#include "State_UnsignedOutput_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

UnsignedOutput::UnsignedOutput(const char *name): CLState(name, *new UnsignedOutput::OnEntry, *new UnsignedOutput::OnExit, *new UnsignedOutput::Internal, NULLPTR, new UnsignedOutput::OnSuspend, new UnsignedOutput::OnResume)
{
	_transitions[0] = new Transition_0();
}

UnsignedOutput::~UnsignedOutput()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void UnsignedOutput::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_UnsignedOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_UnsignedOutput_FuncRefs.mm"
#	include "State_UnsignedOutput_OnEntry.mm"
}
 
void UnsignedOutput::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_UnsignedOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_UnsignedOutput_FuncRefs.mm"
#	include "State_UnsignedOutput_OnExit.mm"
}

void UnsignedOutput::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_UnsignedOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_UnsignedOutput_FuncRefs.mm"
#	include "State_UnsignedOutput_Internal.mm"
}

void UnsignedOutput::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_UnsignedOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_UnsignedOutput_FuncRefs.mm"
#	include "State_UnsignedOutput_OnSuspend.mm"
}

void UnsignedOutput::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_UnsignedOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_UnsignedOutput_FuncRefs.mm"
#	include "State_UnsignedOutput_OnResume.mm"
}
bool UnsignedOutput::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_UnsignedOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_UnsignedOutput_FuncRefs.mm"

	return
	(
#		include "State_UnsignedOutput_Transition_0.expr"
	);
}
