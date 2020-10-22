//
// State_SignedOutput.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SensorFusion_Includes.h"
#include "SensorFusion.h"
#include "State_SignedOutput.h"

#include "State_SignedOutput_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMSensorFusion;
using namespace State;

SignedOutput::SignedOutput(const char *name): CLState(name, *new SignedOutput::OnEntry, *new SignedOutput::OnExit, *new SignedOutput::Internal, NULLPTR, new SignedOutput::OnSuspend, new SignedOutput::OnResume)
{
	_transitions[0] = new Transition_0();
}

SignedOutput::~SignedOutput()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
}

void SignedOutput::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SignedOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SignedOutput_FuncRefs.mm"
#	include "State_SignedOutput_OnEntry.mm"
}

void SignedOutput::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SignedOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SignedOutput_FuncRefs.mm"
#	include "State_SignedOutput_OnExit.mm"
}

void SignedOutput::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SignedOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SignedOutput_FuncRefs.mm"
#	include "State_SignedOutput_Internal.mm"
}

void SignedOutput::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SignedOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SignedOutput_FuncRefs.mm"
#	include "State_SignedOutput_OnSuspend.mm"
}

void SignedOutput::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SignedOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SignedOutput_FuncRefs.mm"
#	include "State_SignedOutput_OnResume.mm"
}

bool SignedOutput::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SensorFusion_VarRefs.mm"
#	include "State_SignedOutput_VarRefs.mm"
#	include "SensorFusion_FuncRefs.mm"
#	include "State_SignedOutput_FuncRefs.mm"

	return
	(
#		include "State_SignedOutput_Transition_0.expr"
	);
}
