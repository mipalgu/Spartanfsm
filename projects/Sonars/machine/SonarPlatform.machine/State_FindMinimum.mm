//
// State_FindMinimum.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarPlatform_Includes.h"
#include "SonarPlatform.h"
#include "State_FindMinimum.h"

#include "State_FindMinimum_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarPlatform;
using namespace State;

FindMinimum::FindMinimum(const char *name): CLState(name, *new FindMinimum::OnEntry, *new FindMinimum::OnExit, *new FindMinimum::Internal, NULLPTR, new FindMinimum::OnSuspend, new FindMinimum::OnResume)
{
	_transitions[0] = new Transition_0();
}

FindMinimum::~FindMinimum()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void FindMinimum::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_FindMinimum_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_FindMinimum_FuncRefs.mm"
#	include "State_FindMinimum_OnEntry.mm"
}
 
void FindMinimum::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_FindMinimum_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_FindMinimum_FuncRefs.mm"
#	include "State_FindMinimum_OnExit.mm"
}

void FindMinimum::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_FindMinimum_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_FindMinimum_FuncRefs.mm"
#	include "State_FindMinimum_Internal.mm"
}

void FindMinimum::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_FindMinimum_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_FindMinimum_FuncRefs.mm"
#	include "State_FindMinimum_OnSuspend.mm"
}

void FindMinimum::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_FindMinimum_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_FindMinimum_FuncRefs.mm"
#	include "State_FindMinimum_OnResume.mm"
}
bool FindMinimum::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_FindMinimum_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_FindMinimum_FuncRefs.mm"

	return
	(
#		include "State_FindMinimum_Transition_0.expr"
	);
}
