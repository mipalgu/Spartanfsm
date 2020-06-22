//
// State_Six.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "7SegmentEncoding_Includes.h"
#include "7SegmentEncoding.h"
#include "State_Six.h"

#include "State_Six_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegmentEncoding;
using namespace State;

Six::Six(const char *name): CLState(name, *new Six::OnEntry, *new Six::OnExit, *new Six::Internal, NULLPTR, new Six::OnSuspend, new Six::OnResume)
{
	_transitions[0] = new Transition_0();
}

Six::~Six()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Six::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Six_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Six_FuncRefs.mm"
#	include "State_Six_OnEntry.mm"
}
 
void Six::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Six_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Six_FuncRefs.mm"
#	include "State_Six_OnExit.mm"
}

void Six::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Six_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Six_FuncRefs.mm"
#	include "State_Six_Internal.mm"
}

void Six::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Six_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Six_FuncRefs.mm"
#	include "State_Six_OnSuspend.mm"
}

void Six::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Six_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Six_FuncRefs.mm"
#	include "State_Six_OnResume.mm"
}
bool Six::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Six_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Six_FuncRefs.mm"

	return
	(
#		include "State_Six_Transition_0.expr"
	);
}
