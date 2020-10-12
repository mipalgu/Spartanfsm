//
// State_FindSignificantBits.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "bcd_Includes.h"
#include "bcd.h"
#include "State_FindSignificantBits.h"

#include "State_FindSignificantBits_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMbcd;
using namespace State;

FindSignificantBits::FindSignificantBits(const char *name): CLState(name, *new FindSignificantBits::OnEntry, *new FindSignificantBits::OnExit, *new FindSignificantBits::Internal, NULLPTR, new FindSignificantBits::OnSuspend, new FindSignificantBits::OnResume)
{
	_transitions[0] = new Transition_0();
}

FindSignificantBits::~FindSignificantBits()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
}

void FindSignificantBits::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_FindSignificantBits_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_FindSignificantBits_FuncRefs.mm"
#	include "State_FindSignificantBits_OnEntry.mm"
}

void FindSignificantBits::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_FindSignificantBits_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_FindSignificantBits_FuncRefs.mm"
#	include "State_FindSignificantBits_OnExit.mm"
}

void FindSignificantBits::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_FindSignificantBits_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_FindSignificantBits_FuncRefs.mm"
#	include "State_FindSignificantBits_Internal.mm"
}

void FindSignificantBits::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_FindSignificantBits_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_FindSignificantBits_FuncRefs.mm"
#	include "State_FindSignificantBits_OnSuspend.mm"
}

void FindSignificantBits::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_FindSignificantBits_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_FindSignificantBits_FuncRefs.mm"
#	include "State_FindSignificantBits_OnResume.mm"
}

bool FindSignificantBits::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_FindSignificantBits_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_FindSignificantBits_FuncRefs.mm"

	return
	(
#		include "State_FindSignificantBits_Transition_0.expr"
	);
}
