//
// State_StartSonars.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SonarPlatform_Includes.h"
#include "SonarPlatform.h"
#include "State_StartSonars.h"

#include "State_StartSonars_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarPlatform;
using namespace State;

StartSonars::StartSonars(const char *name): CLState(name, *new StartSonars::OnEntry, *new StartSonars::OnExit, *new StartSonars::Internal, NULLPTR, new StartSonars::OnSuspend, new StartSonars::OnResume)
{
	_transitions[0] = new Transition_0();
}

StartSonars::~StartSonars()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
}

void StartSonars::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartSonars_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartSonars_FuncRefs.mm"
#	include "State_StartSonars_OnEntry.mm"
}

void StartSonars::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartSonars_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartSonars_FuncRefs.mm"
#	include "State_StartSonars_OnExit.mm"
}

void StartSonars::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartSonars_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartSonars_FuncRefs.mm"
#	include "State_StartSonars_Internal.mm"
}

void StartSonars::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartSonars_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartSonars_FuncRefs.mm"
#	include "State_StartSonars_OnSuspend.mm"
}

void StartSonars::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartSonars_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartSonars_FuncRefs.mm"
#	include "State_StartSonars_OnResume.mm"
}

bool StartSonars::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartSonars_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartSonars_FuncRefs.mm"

	return
	(
#		include "State_StartSonars_Transition_0.expr"
	);
}
