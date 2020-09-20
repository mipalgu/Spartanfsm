//
// State_A.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_A.h"

#include "State_A_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

A::A(const char *name): CLState(name, *new A::OnEntry, *new A::OnExit, *new A::Internal, NULLPTR, new A::OnSuspend, new A::OnResume)
{
	_transitions[0] = new Transition_0();
}

A::~A()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
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

void A::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_A_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_A_FuncRefs.mm"
#	include "State_A_OnSuspend.mm"
}

void A::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_A_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_A_FuncRefs.mm"
#	include "State_A_OnResume.mm"
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
