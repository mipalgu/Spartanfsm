//
// State_A.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_A.h"

#include "State_A_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

A::A(const char *name): CLState(name, *new A::OnEntry, *new A::OnExit, *new A::Internal)
{
	_transitions[0] = new Transition_0();
}

A::~A()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void A::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_A_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_A_FuncRefs.mm"
#	include "State_A_OnEntry.mm"
}

void A::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_A_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_A_FuncRefs.mm"
#	include "State_A_OnExit.mm"
}

void A::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_A_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_A_FuncRefs.mm"
#	include "State_A_Internal.mm"
}

bool A::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_A_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_A_FuncRefs.mm"

	return
	(
#		include "State_A_Transition_0.expr"
	);
}
