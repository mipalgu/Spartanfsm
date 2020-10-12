//
// State_ConvertToBcd.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "bcd_Includes.h"
#include "bcd.h"
#include "State_ConvertToBcd.h"

#include "State_ConvertToBcd_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMbcd;
using namespace State;

ConvertToBcd::ConvertToBcd(const char *name): CLState(name, *new ConvertToBcd::OnEntry, *new ConvertToBcd::OnExit, *new ConvertToBcd::Internal, NULLPTR, new ConvertToBcd::OnSuspend, new ConvertToBcd::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

ConvertToBcd::~ConvertToBcd()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
	delete _transitions[1];
}

void ConvertToBcd::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_ConvertToBcd_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_ConvertToBcd_FuncRefs.mm"
#	include "State_ConvertToBcd_OnEntry.mm"
}

void ConvertToBcd::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_ConvertToBcd_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_ConvertToBcd_FuncRefs.mm"
#	include "State_ConvertToBcd_OnExit.mm"
}

void ConvertToBcd::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_ConvertToBcd_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_ConvertToBcd_FuncRefs.mm"
#	include "State_ConvertToBcd_Internal.mm"
}

void ConvertToBcd::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_ConvertToBcd_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_ConvertToBcd_FuncRefs.mm"
#	include "State_ConvertToBcd_OnSuspend.mm"
}

void ConvertToBcd::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_ConvertToBcd_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_ConvertToBcd_FuncRefs.mm"
#	include "State_ConvertToBcd_OnResume.mm"
}

bool ConvertToBcd::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_ConvertToBcd_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_ConvertToBcd_FuncRefs.mm"

	return
	(
#		include "State_ConvertToBcd_Transition_0.expr"
	);
}

bool ConvertToBcd::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_ConvertToBcd_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_ConvertToBcd_FuncRefs.mm"

	return
	(
#		include "State_ConvertToBcd_Transition_1.expr"
	);
}
