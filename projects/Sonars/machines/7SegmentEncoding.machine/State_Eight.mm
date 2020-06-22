//
// State_Eight.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "7SegmentEncoding_Includes.h"
#include "7SegmentEncoding.h"
#include "State_Eight.h"

#include "State_Eight_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegmentEncoding;
using namespace State;

Eight::Eight(const char *name): CLState(name, *new Eight::OnEntry, *new Eight::OnExit, *new Eight::Internal, NULLPTR, new Eight::OnSuspend, new Eight::OnResume)
{
	_transitions[0] = new Transition_0();
}

Eight::~Eight()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Eight::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_OnEntry.mm"
}
 
void Eight::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_OnExit.mm"
}

void Eight::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_Internal.mm"
}

void Eight::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_OnSuspend.mm"
}

void Eight::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_OnResume.mm"
}
bool Eight::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"

	return
	(
#		include "State_Eight_Transition_0.expr"
	);
}
