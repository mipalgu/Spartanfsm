//
// State_WaitTillFinished.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SonarPlatform_Includes.h"
#include "SonarPlatform.h"
#include "State_WaitTillFinished.h"

#include "State_WaitTillFinished_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSonarPlatform;
using namespace State;

WaitTillFinished::WaitTillFinished(const char *name): CLState(name, *new WaitTillFinished::OnEntry, *new WaitTillFinished::OnExit, *new WaitTillFinished::Internal)
{
	_transitions[0] = new Transition_0();
}

WaitTillFinished::~WaitTillFinished()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void WaitTillFinished::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_WaitTillFinished_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_WaitTillFinished_FuncRefs.mm"
#	include "State_WaitTillFinished_OnEntry.mm"
}

void WaitTillFinished::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_WaitTillFinished_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_WaitTillFinished_FuncRefs.mm"
#	include "State_WaitTillFinished_OnExit.mm"
}

void WaitTillFinished::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_WaitTillFinished_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_WaitTillFinished_FuncRefs.mm"
#	include "State_WaitTillFinished_Internal.mm"
}

bool WaitTillFinished::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SonarPlatform_VarRefs.mm"
#	include "State_WaitTillFinished_VarRefs.mm"
#	include "SonarPlatform_FuncRefs.mm"
#	include "State_WaitTillFinished_FuncRefs.mm"

	return
	(
#		include "State_WaitTillFinished_Transition_0.expr"
	);
}
