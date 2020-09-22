//
// State_ResetDigit.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegmentTester_Includes.h"
#include "SevenSegmentTester.h"
#include "State_ResetDigit.h"

#include "State_ResetDigit_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegmentTester;
using namespace State;

ResetDigit::ResetDigit(const char *name): CLState(name, *new ResetDigit::OnEntry, *new ResetDigit::OnExit, *new ResetDigit::Internal, NULLPTR, new ResetDigit::OnSuspend, new ResetDigit::OnResume)
{
	_transitions[0] = new Transition_0();
}

ResetDigit::~ResetDigit()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void ResetDigit::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_ResetDigit_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_ResetDigit_FuncRefs.mm"
#	include "State_ResetDigit_OnEntry.mm"
}
 
void ResetDigit::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_ResetDigit_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_ResetDigit_FuncRefs.mm"
#	include "State_ResetDigit_OnExit.mm"
}

void ResetDigit::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_ResetDigit_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_ResetDigit_FuncRefs.mm"
#	include "State_ResetDigit_Internal.mm"
}

void ResetDigit::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_ResetDigit_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_ResetDigit_FuncRefs.mm"
#	include "State_ResetDigit_OnSuspend.mm"
}

void ResetDigit::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_ResetDigit_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_ResetDigit_FuncRefs.mm"
#	include "State_ResetDigit_OnResume.mm"
}
bool ResetDigit::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_ResetDigit_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_ResetDigit_FuncRefs.mm"

	return
	(
#		include "State_ResetDigit_Transition_0.expr"
	);
}
