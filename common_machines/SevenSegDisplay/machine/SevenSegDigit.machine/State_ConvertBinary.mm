//
// State_ConvertBinary.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_ConvertBinary.h"

#include "State_ConvertBinary_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

ConvertBinary::ConvertBinary(const char *name): CLState(name, *new ConvertBinary::OnEntry, *new ConvertBinary::OnExit, *new ConvertBinary::Internal, NULLPTR, new ConvertBinary::OnSuspend, new ConvertBinary::OnResume)
{
	_transitions[0] = new Transition_0();
}

ConvertBinary::~ConvertBinary()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
}

void ConvertBinary::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_ConvertBinary_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_ConvertBinary_FuncRefs.mm"
#	include "State_ConvertBinary_OnEntry.mm"
}

void ConvertBinary::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_ConvertBinary_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_ConvertBinary_FuncRefs.mm"
#	include "State_ConvertBinary_OnExit.mm"
}

void ConvertBinary::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_ConvertBinary_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_ConvertBinary_FuncRefs.mm"
#	include "State_ConvertBinary_Internal.mm"
}

void ConvertBinary::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_ConvertBinary_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_ConvertBinary_FuncRefs.mm"
#	include "State_ConvertBinary_OnSuspend.mm"
}

void ConvertBinary::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_ConvertBinary_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_ConvertBinary_FuncRefs.mm"
#	include "State_ConvertBinary_OnResume.mm"
}

bool ConvertBinary::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_ConvertBinary_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_ConvertBinary_FuncRefs.mm"

	return
	(
#		include "State_ConvertBinary_Transition_0.expr"
	);
}
