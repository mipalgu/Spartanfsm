//
// State_Zero.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegmentEncoder_Includes.h"
#include "SevenSegmentEncoder.h"
#include "State_Zero.h"

#include "State_Zero_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegmentEncoder;
using namespace State;

Zero::Zero(const char *name): CLState(name, *new Zero::OnEntry, *new Zero::OnExit, *new Zero::Internal, NULLPTR, new Zero::OnSuspend, new Zero::OnResume)
{
	_transitions[0] = new Transition_0();
}

Zero::~Zero()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Zero::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Zero_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Zero_FuncRefs.mm"
#	include "State_Zero_OnEntry.mm"
}
 
void Zero::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Zero_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Zero_FuncRefs.mm"
#	include "State_Zero_OnExit.mm"
}

void Zero::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Zero_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Zero_FuncRefs.mm"
#	include "State_Zero_Internal.mm"
}

void Zero::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Zero_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Zero_FuncRefs.mm"
#	include "State_Zero_OnSuspend.mm"
}

void Zero::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Zero_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Zero_FuncRefs.mm"
#	include "State_Zero_OnResume.mm"
}
bool Zero::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Zero_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Zero_FuncRefs.mm"

	return
	(
#		include "State_Zero_Transition_0.expr"
	);
}
