//
// State_ChangeDigit.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDisplay_Includes.h"
#include "SevenSegDisplay.h"
#include "State_ChangeDigit.h"

#include "State_ChangeDigit_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDisplay;
using namespace State;

ChangeDigit::ChangeDigit(const char *name): CLState(name, *new ChangeDigit::OnEntry, *new ChangeDigit::OnExit, *new ChangeDigit::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

ChangeDigit::~ChangeDigit()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void ChangeDigit::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_ChangeDigit_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_ChangeDigit_FuncRefs.mm"
#	include "State_ChangeDigit_OnEntry.mm"
}

void ChangeDigit::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_ChangeDigit_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_ChangeDigit_FuncRefs.mm"
#	include "State_ChangeDigit_OnExit.mm"
}

void ChangeDigit::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_ChangeDigit_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_ChangeDigit_FuncRefs.mm"
#	include "State_ChangeDigit_Internal.mm"
}

bool ChangeDigit::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_ChangeDigit_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_ChangeDigit_FuncRefs.mm"

	return
	(
#		include "State_ChangeDigit_Transition_0.expr"
	);
}
bool ChangeDigit::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_ChangeDigit_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_ChangeDigit_FuncRefs.mm"

	return
	(
#		include "State_ChangeDigit_Transition_1.expr"
	);
}
