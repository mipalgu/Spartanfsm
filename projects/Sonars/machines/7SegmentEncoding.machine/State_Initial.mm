//
// State_Initial.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "7SegmentEncoding_Includes.h"
#include "7SegmentEncoding.h"
#include "State_Initial.h"

#include "State_Initial_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegmentEncoding;
using namespace State;

Initial::Initial(const char *name): CLState(name, *new Initial::OnEntry, *new Initial::OnExit, *new Initial::Internal, NULLPTR, new Initial::OnSuspend, new Initial::OnResume)
{
	_transitions[0] = new Transition_0();
}

Initial::~Initial()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Initial::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnEntry.mm"
}
 
void Initial::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnExit.mm"
}

void Initial::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_Internal.mm"
}

void Initial::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnSuspend.mm"
}

void Initial::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnResume.mm"
}
bool Initial::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_0.expr"
	);
}
