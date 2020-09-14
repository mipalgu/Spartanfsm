//
// State_StartSensors.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarPlatform_Includes.h"
#include "SonarPlatform.h"
#include "State_StartSensors.h"

#include "State_StartSensors_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarPlatform;
using namespace State;

StartSensors::StartSensors(const char *name): CLState(name, *new StartSensors::OnEntry, *new StartSensors::OnExit, *new StartSensors::Internal, NULLPTR, new StartSensors::OnSuspend, new StartSensors::OnResume)
{
	_transitions[0] = new Transition_0();
}

StartSensors::~StartSensors()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void StartSensors::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartSensors_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartSensors_FuncRefs.mm"
#	include "State_StartSensors_OnEntry.mm"
}
 
void StartSensors::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartSensors_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartSensors_FuncRefs.mm"
#	include "State_StartSensors_OnExit.mm"
}

void StartSensors::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartSensors_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartSensors_FuncRefs.mm"
#	include "State_StartSensors_Internal.mm"
}

void StartSensors::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartSensors_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartSensors_FuncRefs.mm"
#	include "State_StartSensors_OnSuspend.mm"
}

void StartSensors::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartSensors_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartSensors_FuncRefs.mm"
#	include "State_StartSensors_OnResume.mm"
}
bool StartSensors::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartSensors_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartSensors_FuncRefs.mm"

	return
	(
#		include "State_StartSensors_Transition_0.expr"
	);
}
