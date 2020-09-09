//
// State_LightOn.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "ParentMachine_Includes.h"
#include "ParentMachine.h"
#include "State_LightOn.h"

#include "State_LightOn_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMParentMachine;
using namespace State;

LightOn::LightOn(const char *name): CLState(name, *new LightOn::OnEntry, *new LightOn::OnExit, *new LightOn::Internal)
{
	_transitions[0] = new Transition_0();
}

LightOn::~LightOn()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void LightOn::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_LightOn_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_LightOn_FuncRefs.mm"
#	include "State_LightOn_OnEntry.mm"
}

void LightOn::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_LightOn_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_LightOn_FuncRefs.mm"
#	include "State_LightOn_OnExit.mm"
}

void LightOn::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_LightOn_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_LightOn_FuncRefs.mm"
#	include "State_LightOn_Internal.mm"
}

bool LightOn::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_LightOn_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_LightOn_FuncRefs.mm"

	return
	(
#		include "State_LightOn_Transition_0.expr"
	);
}
