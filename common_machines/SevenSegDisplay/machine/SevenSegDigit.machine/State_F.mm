//
// State_F.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_F.h"

#include "State_F_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

F::F(const char *name): CLState(name, *new F::OnEntry, *new F::OnExit, *new F::Internal, NULLPTR, new F::OnSuspend, new F::OnResume)
{
	_transitions[0] = new Transition_0();
}

F::~F()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void F::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_F_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_F_FuncRefs.mm"
#	include "State_F_OnEntry.mm"
}
 
void F::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_F_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_F_FuncRefs.mm"
#	include "State_F_OnExit.mm"
}

void F::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_F_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_F_FuncRefs.mm"
#	include "State_F_Internal.mm"
}

void F::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_F_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_F_FuncRefs.mm"
#	include "State_F_OnSuspend.mm"
}

void F::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_F_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_F_FuncRefs.mm"
#	include "State_F_OnResume.mm"
}
bool F::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_F_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_F_FuncRefs.mm"

	return
	(
#		include "State_F_Transition_0.expr"
	);
}
