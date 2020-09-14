//
// State_SetLED.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "ParentMachine_Includes.h"
#include "ParentMachine.h"
#include "State_SetLED.h"

#include "State_SetLED_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMParentMachine;
using namespace State;

SetLED::SetLED(const char *name): CLState(name, *new SetLED::OnEntry, *new SetLED::OnExit, *new SetLED::Internal, NULLPTR, new SetLED::OnSuspend, new SetLED::OnResume)
{
	_transitions[0] = new Transition_0();
}

SetLED::~SetLED()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void SetLED::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_SetLED_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_SetLED_FuncRefs.mm"
#	include "State_SetLED_OnEntry.mm"
}
 
void SetLED::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_SetLED_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_SetLED_FuncRefs.mm"
#	include "State_SetLED_OnExit.mm"
}

void SetLED::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_SetLED_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_SetLED_FuncRefs.mm"
#	include "State_SetLED_Internal.mm"
}

void SetLED::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_SetLED_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_SetLED_FuncRefs.mm"
#	include "State_SetLED_OnSuspend.mm"
}

void SetLED::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_SetLED_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_SetLED_FuncRefs.mm"
#	include "State_SetLED_OnResume.mm"
}
bool SetLED::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_SetLED_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_SetLED_FuncRefs.mm"

	return
	(
#		include "State_SetLED_Transition_0.expr"
	);
}
