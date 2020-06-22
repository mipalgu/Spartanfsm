//
// State_InitialPseudostate.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "7SegmentEncoding_Includes.h"
#include "7SegmentEncoding.h"
#include "State_InitialPseudostate.h"

#include "State_InitialPseudostate_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegmentEncoding;
using namespace State;

InitialPseudostate::InitialPseudostate(const char *name): CLState(name, *new InitialPseudostate::OnEntry, *new InitialPseudostate::OnExit, *new InitialPseudostate::Internal, NULLPTR, new InitialPseudostate::OnSuspend, new InitialPseudostate::OnResume)
{
	_transitions[0] = new Transition_0();
}

InitialPseudostate::~InitialPseudostate()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void InitialPseudostate::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_InitialPseudostate_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_InitialPseudostate_FuncRefs.mm"
#	include "State_InitialPseudostate_OnEntry.mm"
}
 
void InitialPseudostate::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_InitialPseudostate_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_InitialPseudostate_FuncRefs.mm"
#	include "State_InitialPseudostate_OnExit.mm"
}

void InitialPseudostate::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_InitialPseudostate_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_InitialPseudostate_FuncRefs.mm"
#	include "State_InitialPseudostate_Internal.mm"
}

void InitialPseudostate::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_InitialPseudostate_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_InitialPseudostate_FuncRefs.mm"
#	include "State_InitialPseudostate_OnSuspend.mm"
}

void InitialPseudostate::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_InitialPseudostate_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_InitialPseudostate_FuncRefs.mm"
#	include "State_InitialPseudostate_OnResume.mm"
}
bool InitialPseudostate::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "7SegmentEncoding_VarRefs.mm"
#	include "State_InitialPseudostate_VarRefs.mm"
#	include "7SegmentEncoding_FuncRefs.mm"
#	include "State_InitialPseudostate_FuncRefs.mm"

	return
	(
#		include "State_InitialPseudostate_Transition_0.expr"
	);
}
