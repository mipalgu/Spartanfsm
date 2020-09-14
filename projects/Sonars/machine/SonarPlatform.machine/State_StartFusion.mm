//
// State_StartFusion.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SonarPlatform_Includes.h"
#include "SonarPlatform.h"
#include "State_StartFusion.h"

#include "State_StartFusion_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarPlatform;
using namespace State;

StartFusion::StartFusion(const char *name): CLState(name, *new StartFusion::OnEntry, *new StartFusion::OnExit, *new StartFusion::Internal, NULLPTR, new StartFusion::OnSuspend, new StartFusion::OnResume)
{
	_transitions[0] = new Transition_0();
}

StartFusion::~StartFusion()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void StartFusion::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartFusion_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartFusion_FuncRefs.mm"
#	include "State_StartFusion_OnEntry.mm"
}
 
void StartFusion::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartFusion_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartFusion_FuncRefs.mm"
#	include "State_StartFusion_OnExit.mm"
}

void StartFusion::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartFusion_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartFusion_FuncRefs.mm"
#	include "State_StartFusion_Internal.mm"
}

void StartFusion::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartFusion_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartFusion_FuncRefs.mm"
#	include "State_StartFusion_OnSuspend.mm"
}

void StartFusion::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartFusion_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartFusion_FuncRefs.mm"
#	include "State_StartFusion_OnResume.mm"
}
bool StartFusion::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_StartFusion_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_StartFusion_FuncRefs.mm"

	return
	(
#		include "State_StartFusion_Transition_0.expr"
	);
}
