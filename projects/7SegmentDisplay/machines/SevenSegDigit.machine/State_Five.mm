//
// State_Five.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Five.h"

#include "State_Five_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

Five::Five(const char *name): CLState(name, *new Five::OnEntry, *new Five::OnExit, *new Five::Internal)
{
	_transitions[0] = new Transition_0();
}

Five::~Five()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Five::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Five_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Five_FuncRefs.mm"
#	include "State_Five_OnEntry.mm"
}

void Five::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Five_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Five_FuncRefs.mm"
#	include "State_Five_OnExit.mm"
}

void Five::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Five_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Five_FuncRefs.mm"
#	include "State_Five_Internal.mm"
}

bool Five::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Five_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Five_FuncRefs.mm"

	return
	(
#		include "State_Five_Transition_0.expr"
	);
}
