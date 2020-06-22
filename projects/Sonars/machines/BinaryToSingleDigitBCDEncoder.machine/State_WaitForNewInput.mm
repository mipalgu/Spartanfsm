//
// State_WaitForNewInput.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "BinaryToSingleDigitBCDEncoder_Includes.h"
#include "BinaryToSingleDigitBCDEncoder.h"
#include "State_WaitForNewInput.h"

#include "State_WaitForNewInput_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBinaryToSingleDigitBCDEncoder;
using namespace State;

WaitForNewInput::WaitForNewInput(const char *name): CLState(name, *new WaitForNewInput::OnEntry, *new WaitForNewInput::OnExit, *new WaitForNewInput::Internal, NULLPTR, new WaitForNewInput::OnSuspend, new WaitForNewInput::OnResume)
{
	_transitions[0] = new Transition_0();
}

WaitForNewInput::~WaitForNewInput()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void WaitForNewInput::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_WaitForNewInput_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_WaitForNewInput_FuncRefs.mm"
#	include "State_WaitForNewInput_OnEntry.mm"
}
 
void WaitForNewInput::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_WaitForNewInput_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_WaitForNewInput_FuncRefs.mm"
#	include "State_WaitForNewInput_OnExit.mm"
}

void WaitForNewInput::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_WaitForNewInput_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_WaitForNewInput_FuncRefs.mm"
#	include "State_WaitForNewInput_Internal.mm"
}

void WaitForNewInput::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_WaitForNewInput_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_WaitForNewInput_FuncRefs.mm"
#	include "State_WaitForNewInput_OnSuspend.mm"
}

void WaitForNewInput::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_WaitForNewInput_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_WaitForNewInput_FuncRefs.mm"
#	include "State_WaitForNewInput_OnResume.mm"
}
bool WaitForNewInput::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_WaitForNewInput_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_WaitForNewInput_FuncRefs.mm"

	return
	(
#		include "State_WaitForNewInput_Transition_0.expr"
	);
}
