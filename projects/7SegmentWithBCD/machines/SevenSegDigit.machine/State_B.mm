//
// State_B.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_B.h"

#include "State_B_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

B::B(const char *name): CLState(name, *new B::OnEntry, *new B::OnExit, *new B::Internal)
{
	_transitions[0] = new Transition_0();
}

B::~B()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void B::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_B_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_B_FuncRefs.mm"
#	include "State_B_OnEntry.mm"
}

void B::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_B_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_B_FuncRefs.mm"
#	include "State_B_OnExit.mm"
}

void B::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_B_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_B_FuncRefs.mm"
#	include "State_B_Internal.mm"
}

bool B::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_B_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_B_FuncRefs.mm"

	return
	(
#		include "State_B_Transition_0.expr"
	);
}
