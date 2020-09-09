//
// State_ConvertToBcd.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "bcd_Includes.h"
#include "bcd.h"
#include "State_ConvertToBcd.h"

#include "State_ConvertToBcd_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMbcd;
using namespace State;

ConvertToBcd::ConvertToBcd(const char *name): CLState(name, *new ConvertToBcd::OnEntry, *new ConvertToBcd::OnExit, *new ConvertToBcd::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

ConvertToBcd::~ConvertToBcd()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

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
