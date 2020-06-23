//
// State_SetIntensity.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_SetIntensity.h"

#include "State_SetIntensity_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

SetIntensity::SetIntensity(const char *name): CLState(name, *new SetIntensity::OnEntry, *new SetIntensity::OnExit, *new SetIntensity::Internal, NULLPTR, new SetIntensity::OnSuspend, new SetIntensity::OnResume)
{
	_transitions[0] = new Transition_0();
}

SetIntensity::~SetIntensity()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void SetIntensity::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SetIntensity_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SetIntensity_FuncRefs.mm"
#	include "State_SetIntensity_OnEntry.mm"
}
 
void SetIntensity::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SetIntensity_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SetIntensity_FuncRefs.mm"
#	include "State_SetIntensity_OnExit.mm"
}

void SetIntensity::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SetIntensity_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SetIntensity_FuncRefs.mm"
#	include "State_SetIntensity_Internal.mm"
}

void SetIntensity::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SetIntensity_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SetIntensity_FuncRefs.mm"
#	include "State_SetIntensity_OnSuspend.mm"
}

void SetIntensity::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SetIntensity_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SetIntensity_FuncRefs.mm"
#	include "State_SetIntensity_OnResume.mm"
}
bool SetIntensity::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SetIntensity_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SetIntensity_FuncRefs.mm"

	return
	(
#		include "State_SetIntensity_Transition_0.expr"
	);
}
