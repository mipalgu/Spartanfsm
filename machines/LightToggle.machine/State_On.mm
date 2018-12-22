//
// State_On.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "LightToggle_Includes.h"
#include "LightToggle.h"
#include "State_On.h"

#include "State_On_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMLightToggle;
using namespace State;

On::On(const char *name): CLState(name, *new On::OnEntry, *new On::OnExit, *new On::Internal)
{
	_transitions[0] = new Transition_0();
}

On::~On()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void On::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightToggle_VarRefs.mm"
#	include "State_On_VarRefs.mm"
#	include "LightToggle_FuncRefs.mm"
#	include "State_On_FuncRefs.mm"
#	include "State_On_OnEntry.mm"
}

void On::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightToggle_VarRefs.mm"
#	include "State_On_VarRefs.mm"
#	include "LightToggle_FuncRefs.mm"
#	include "State_On_FuncRefs.mm"
#	include "State_On_OnExit.mm"
}

void On::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "LightToggle_VarRefs.mm"
#	include "State_On_VarRefs.mm"
#	include "LightToggle_FuncRefs.mm"
#	include "State_On_FuncRefs.mm"
#	include "State_On_Internal.mm"
}

bool On::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "LightToggle_VarRefs.mm"
#	include "State_On_VarRefs.mm"
#	include "LightToggle_FuncRefs.mm"
#	include "State_On_FuncRefs.mm"

	return
	(
#		include "State_On_Transition_0.expr"
	);
}
