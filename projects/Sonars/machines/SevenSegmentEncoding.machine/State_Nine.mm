//
// State_Nine.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegmentEncoding_Includes.h"
#include "SevenSegmentEncoding.h"
#include "State_Nine.h"

#include "State_Nine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegmentEncoding;
using namespace State;

Nine::Nine(const char *name): CLState(name, *new Nine::OnEntry, *new Nine::OnExit, *new Nine::Internal, NULLPTR, new Nine::OnSuspend, new Nine::OnResume)
{
	_transitions[0] = new Transition_0();
}

Nine::~Nine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Nine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Nine_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Nine_FuncRefs.mm"
#	include "State_Nine_OnEntry.mm"
}
 
void Nine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Nine_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Nine_FuncRefs.mm"
#	include "State_Nine_OnExit.mm"
}

void Nine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Nine_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Nine_FuncRefs.mm"
#	include "State_Nine_Internal.mm"
}

void Nine::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Nine_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Nine_FuncRefs.mm"
#	include "State_Nine_OnSuspend.mm"
}

void Nine::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Nine_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Nine_FuncRefs.mm"
#	include "State_Nine_OnResume.mm"
}
bool Nine::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Nine_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Nine_FuncRefs.mm"

	return
	(
#		include "State_Nine_Transition_0.expr"
	);
}
