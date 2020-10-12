//
// State_Five.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Five.h"

#include "State_Five_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

Five::Five(const char *name): CLState(name, *new Five::OnEntry, *new Five::OnExit, *new Five::Internal, NULLPTR, new Five::OnSuspend, new Five::OnResume)
{
	_transitions[0] = new Transition_0();
}

Five::~Five()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

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

void Five::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Five_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Five_FuncRefs.mm"
#	include "State_Five_OnSuspend.mm"
}

void Five::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Five_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Five_FuncRefs.mm"
#	include "State_Five_OnResume.mm"
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
