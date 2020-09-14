//
// State_LightOff.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "OnSuspendAndOnResumeHelloWorld_Includes.h"
#include "OnSuspendAndOnResumeHelloWorld.h"
#include "State_LightOff.h"

#include "State_LightOff_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMOnSuspendAndOnResumeHelloWorld;
using namespace State;

LightOff::LightOff(const char *name): CLState(name, *new LightOff::OnEntry, *new LightOff::OnExit, *new LightOff::Internal, NULLPTR, new LightOff::OnSuspend, new LightOff::OnResume)
{
	_transitions[0] = new Transition_0();
}

LightOff::~LightOff()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void LightOff::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "OnSuspendAndOnResumeHelloWorld_VarRefs.mm"
#	include "State_LightOff_VarRefs.mm"
#	include "OnSuspendAndOnResumeHelloWorld_FuncRefs.mm"
#	include "State_LightOff_FuncRefs.mm"
#	include "State_LightOff_OnEntry.mm"
}
 
void LightOff::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "OnSuspendAndOnResumeHelloWorld_VarRefs.mm"
#	include "State_LightOff_VarRefs.mm"
#	include "OnSuspendAndOnResumeHelloWorld_FuncRefs.mm"
#	include "State_LightOff_FuncRefs.mm"
#	include "State_LightOff_OnExit.mm"
}

void LightOff::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "OnSuspendAndOnResumeHelloWorld_VarRefs.mm"
#	include "State_LightOff_VarRefs.mm"
#	include "OnSuspendAndOnResumeHelloWorld_FuncRefs.mm"
#	include "State_LightOff_FuncRefs.mm"
#	include "State_LightOff_Internal.mm"
}

void LightOff::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "OnSuspendAndOnResumeHelloWorld_VarRefs.mm"
#	include "State_LightOff_VarRefs.mm"
#	include "OnSuspendAndOnResumeHelloWorld_FuncRefs.mm"
#	include "State_LightOff_FuncRefs.mm"
#	include "State_LightOff_OnSuspend.mm"
}

void LightOff::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "OnSuspendAndOnResumeHelloWorld_VarRefs.mm"
#	include "State_LightOff_VarRefs.mm"
#	include "OnSuspendAndOnResumeHelloWorld_FuncRefs.mm"
#	include "State_LightOff_FuncRefs.mm"
#	include "State_LightOff_OnResume.mm"
}
bool LightOff::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "OnSuspendAndOnResumeHelloWorld_VarRefs.mm"
#	include "State_LightOff_VarRefs.mm"
#	include "OnSuspendAndOnResumeHelloWorld_FuncRefs.mm"
#	include "State_LightOff_FuncRefs.mm"

	return
	(
#		include "State_LightOff_Transition_0.expr"
	);
}
