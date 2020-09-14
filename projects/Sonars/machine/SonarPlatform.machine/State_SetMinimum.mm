//
// State_SetMinimum.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarPlatform_Includes.h"
#include "SonarPlatform.h"
#include "State_SetMinimum.h"

#include "State_SetMinimum_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarPlatform;
using namespace State;

SetMinimum::SetMinimum(const char *name): CLState(name, *new SetMinimum::OnEntry, *new SetMinimum::OnExit, *new SetMinimum::Internal, NULLPTR, new SetMinimum::OnSuspend, new SetMinimum::OnResume)
{
	_transitions[0] = new Transition_0();
}

SetMinimum::~SetMinimum()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void SetMinimum::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_SetMinimum_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_SetMinimum_FuncRefs.mm"
#	include "State_SetMinimum_OnEntry.mm"
}
 
void SetMinimum::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_SetMinimum_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_SetMinimum_FuncRefs.mm"
#	include "State_SetMinimum_OnExit.mm"
}

void SetMinimum::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_SetMinimum_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_SetMinimum_FuncRefs.mm"
#	include "State_SetMinimum_Internal.mm"
}

void SetMinimum::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_SetMinimum_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_SetMinimum_FuncRefs.mm"
#	include "State_SetMinimum_OnSuspend.mm"
}

void SetMinimum::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_SetMinimum_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_SetMinimum_FuncRefs.mm"
#	include "State_SetMinimum_OnResume.mm"
}
bool SetMinimum::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_SetMinimum_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_SetMinimum_FuncRefs.mm"

	return
	(
#		include "State_SetMinimum_Transition_0.expr"
	);
}
