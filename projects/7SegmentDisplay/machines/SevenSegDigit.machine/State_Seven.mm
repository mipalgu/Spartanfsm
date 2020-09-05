//
// State_Seven.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Seven.h"

#include "State_Seven_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

Seven::Seven(const char *name): CLState(name, *new Seven::OnEntry, *new Seven::OnExit, *new Seven::Internal)
{
	_transitions[0] = new Transition_0();
}

Seven::~Seven()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Seven::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Seven_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Seven_FuncRefs.mm"
#	include "State_Seven_OnEntry.mm"
}

void Seven::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Seven_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Seven_FuncRefs.mm"
#	include "State_Seven_OnExit.mm"
}

void Seven::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Seven_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Seven_FuncRefs.mm"
#	include "State_Seven_Internal.mm"
}

bool Seven::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Seven_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Seven_FuncRefs.mm"

	return
	(
#		include "State_Seven_Transition_0.expr"
	);
}
