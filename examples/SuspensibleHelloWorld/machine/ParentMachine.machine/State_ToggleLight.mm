//
// State_ToggleLight.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "ParentMachine_Includes.h"
#include "ParentMachine.h"
#include "State_ToggleLight.h"

#include "State_ToggleLight_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMParentMachine;
using namespace State;

ToggleLight::ToggleLight(const char *name): CLState(name, *new ToggleLight::OnEntry, *new ToggleLight::OnExit, *new ToggleLight::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

ToggleLight::~ToggleLight()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void ToggleLight::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_ToggleLight_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_ToggleLight_FuncRefs.mm"
#	include "State_ToggleLight_OnEntry.mm"
}

void ToggleLight::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_ToggleLight_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_ToggleLight_FuncRefs.mm"
#	include "State_ToggleLight_OnExit.mm"
}

void ToggleLight::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_ToggleLight_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_ToggleLight_FuncRefs.mm"
#	include "State_ToggleLight_Internal.mm"
}

bool ToggleLight::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_ToggleLight_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_ToggleLight_FuncRefs.mm"

	return
	(
#		include "State_ToggleLight_Transition_0.expr"
	);
}
bool ToggleLight::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_ToggleLight_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_ToggleLight_FuncRefs.mm"

	return
	(
#		include "State_ToggleLight_Transition_1.expr"
	);
}
