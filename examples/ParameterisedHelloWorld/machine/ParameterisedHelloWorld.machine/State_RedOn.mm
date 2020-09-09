//
// State_RedOn.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "ParameterisedHelloWorld_Includes.h"
#include "ParameterisedHelloWorld.h"
#include "State_RedOn.h"

#include "State_RedOn_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMParameterisedHelloWorld;
using namespace State;

RedOn::RedOn(const char *name): CLState(name, *new RedOn::OnEntry, *new RedOn::OnExit, *new RedOn::Internal)
{
	_transitions[0] = new Transition_0();
}

RedOn::~RedOn()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void RedOn::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParameterisedHelloWorld_VarRefs.mm"
#	include "State_RedOn_VarRefs.mm"
#	include "ParameterisedHelloWorld_FuncRefs.mm"
#	include "State_RedOn_FuncRefs.mm"
#	include "State_RedOn_OnEntry.mm"
}

void RedOn::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParameterisedHelloWorld_VarRefs.mm"
#	include "State_RedOn_VarRefs.mm"
#	include "ParameterisedHelloWorld_FuncRefs.mm"
#	include "State_RedOn_FuncRefs.mm"
#	include "State_RedOn_OnExit.mm"
}

void RedOn::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParameterisedHelloWorld_VarRefs.mm"
#	include "State_RedOn_VarRefs.mm"
#	include "ParameterisedHelloWorld_FuncRefs.mm"
#	include "State_RedOn_FuncRefs.mm"
#	include "State_RedOn_Internal.mm"
}

bool RedOn::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ParameterisedHelloWorld_VarRefs.mm"
#	include "State_RedOn_VarRefs.mm"
#	include "ParameterisedHelloWorld_FuncRefs.mm"
#	include "State_RedOn_FuncRefs.mm"

	return
	(
#		include "State_RedOn_Transition_0.expr"
	);
}
