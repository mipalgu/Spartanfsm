//
// State_CheckDigit.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegmentTester_Includes.h"
#include "SevenSegmentTester.h"
#include "State_CheckDigit.h"

#include "State_CheckDigit_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegmentTester;
using namespace State;

CheckDigit::CheckDigit(const char *name): CLState(name, *new CheckDigit::OnEntry, *new CheckDigit::OnExit, *new CheckDigit::Internal, NULLPTR, new CheckDigit::OnSuspend, new CheckDigit::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CheckDigit::~CheckDigit()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
}

void CheckDigit::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_CheckDigit_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_CheckDigit_FuncRefs.mm"
#	include "State_CheckDigit_OnEntry.mm"
}
 
void CheckDigit::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_CheckDigit_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_CheckDigit_FuncRefs.mm"
#	include "State_CheckDigit_OnExit.mm"
}

void CheckDigit::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_CheckDigit_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_CheckDigit_FuncRefs.mm"
#	include "State_CheckDigit_Internal.mm"
}

void CheckDigit::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_CheckDigit_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_CheckDigit_FuncRefs.mm"
#	include "State_CheckDigit_OnSuspend.mm"
}

void CheckDigit::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_CheckDigit_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_CheckDigit_FuncRefs.mm"
#	include "State_CheckDigit_OnResume.mm"
}
bool CheckDigit::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_CheckDigit_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_CheckDigit_FuncRefs.mm"

	return
	(
#		include "State_CheckDigit_Transition_0.expr"
	);
}
bool CheckDigit::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_CheckDigit_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_CheckDigit_FuncRefs.mm"

	return
	(
#		include "State_CheckDigit_Transition_1.expr"
	);
}
