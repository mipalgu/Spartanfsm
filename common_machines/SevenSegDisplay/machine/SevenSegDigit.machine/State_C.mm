//
// State_C.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_C.h"

#include "State_C_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

C::C(const char *name): CLState(name, *new C::OnEntry, *new C::OnExit, *new C::Internal)
{
	_transitions[0] = new Transition_0();
}

C::~C()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void C::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_C_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_C_FuncRefs.mm"
#	include "State_C_OnEntry.mm"
}

void C::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_C_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_C_FuncRefs.mm"
#	include "State_C_OnExit.mm"
}

void C::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_C_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_C_FuncRefs.mm"
#	include "State_C_Internal.mm"
}

bool C::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_C_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_C_FuncRefs.mm"

	return
	(
#		include "State_C_Transition_0.expr"
	);
}
