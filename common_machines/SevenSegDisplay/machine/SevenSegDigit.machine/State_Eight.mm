//
// State_Eight.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Eight.h"

#include "State_Eight_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
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
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_OnEntry.mm"
}

void Eight::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_OnExit.mm"
}

void Eight::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_Internal.mm"
}

void Eight::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_OnSuspend.mm"
}

void Eight::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_OnResume.mm"
}

bool Eight::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"

	return
	(
#		include "State_Eight_Transition_0.expr"
	);
}
