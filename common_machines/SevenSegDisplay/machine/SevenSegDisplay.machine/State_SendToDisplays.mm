//
// State_SendToDisplays.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDisplay_Includes.h"
#include "SevenSegDisplay.h"
#include "State_SendToDisplays.h"

#include "State_SendToDisplays_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDisplay;
using namespace State;

SendToDisplays::SendToDisplays(const char *name): CLState(name, *new SendToDisplays::OnEntry, *new SendToDisplays::OnExit, *new SendToDisplays::Internal)
{
	_transitions[0] = new Transition_0();
}

SendToDisplays::~SendToDisplays()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SendToDisplays::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_SendToDisplays_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_SendToDisplays_FuncRefs.mm"
#	include "State_SendToDisplays_OnEntry.mm"
}

void SendToDisplays::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_SendToDisplays_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_SendToDisplays_FuncRefs.mm"
#	include "State_SendToDisplays_OnExit.mm"
}

void SendToDisplays::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_SendToDisplays_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_SendToDisplays_FuncRefs.mm"
#	include "State_SendToDisplays_Internal.mm"
}

bool SendToDisplays::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_SendToDisplays_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_SendToDisplays_FuncRefs.mm"

	return
	(
#		include "State_SendToDisplays_Transition_0.expr"
	);
}
