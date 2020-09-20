//
// State_Four.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Four.h"

#include "State_Four_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

Four::Four(const char *name): CLState(name, *new Four::OnEntry, *new Four::OnExit, *new Four::Internal, NULLPTR, new Four::OnSuspend, new Four::OnResume)
{
	_transitions[0] = new Transition_0();
}

Four::~Four()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Four::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Four_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Four_FuncRefs.mm"
#	include "State_Four_OnEntry.mm"
}
 
void Four::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Four_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Four_FuncRefs.mm"
#	include "State_Four_OnExit.mm"
}

void Four::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Four_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Four_FuncRefs.mm"
#	include "State_Four_Internal.mm"
}

void Four::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Four_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Four_FuncRefs.mm"
#	include "State_Four_OnSuspend.mm"
}

void Four::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Four_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Four_FuncRefs.mm"
#	include "State_Four_OnResume.mm"
}
bool Four::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Four_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Four_FuncRefs.mm"

	return
	(
#		include "State_Four_Transition_0.expr"
	);
}
