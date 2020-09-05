//
// State_Two.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegmentEncoder_Includes.h"
#include "SevenSegmentEncoder.h"
#include "State_Two.h"

#include "State_Two_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegmentEncoder;
using namespace State;

Two::Two(const char *name): CLState(name, *new Two::OnEntry, *new Two::OnExit, *new Two::Internal, NULLPTR, new Two::OnSuspend, new Two::OnResume)
{
	_transitions[0] = new Transition_0();
}

Two::~Two()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Two::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Two_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Two_FuncRefs.mm"
#	include "State_Two_OnEntry.mm"
}
 
void Two::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Two_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Two_FuncRefs.mm"
#	include "State_Two_OnExit.mm"
}

void Two::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Two_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Two_FuncRefs.mm"
#	include "State_Two_Internal.mm"
}

void Two::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Two_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Two_FuncRefs.mm"
#	include "State_Two_OnSuspend.mm"
}

void Two::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Two_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Two_FuncRefs.mm"
#	include "State_Two_OnResume.mm"
}
bool Two::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Two_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Two_FuncRefs.mm"

	return
	(
#		include "State_Two_Transition_0.expr"
	);
}
