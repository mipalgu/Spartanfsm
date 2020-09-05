//
// State_Check.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_Check.h"

#include "State_Check_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
using namespace State;

Check::Check(const char *name): CLState(name, *new Check::OnEntry, *new Check::OnExit, *new Check::Internal)
{
	_transitions[0] = new Transition_0();
}

Check::~Check()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Check::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"
#	include "State_Check_OnEntry.mm"
}

void Check::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"
#	include "State_Check_OnExit.mm"
}

void Check::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"
#	include "State_Check_Internal.mm"
}

bool Check::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_0.expr"
	);
}
