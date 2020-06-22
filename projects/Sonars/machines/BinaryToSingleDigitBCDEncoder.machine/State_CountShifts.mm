//
// State_CountShifts.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "BinaryToSingleDigitBCDEncoder_Includes.h"
#include "BinaryToSingleDigitBCDEncoder.h"
#include "State_CountShifts.h"

#include "State_CountShifts_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMBinaryToSingleDigitBCDEncoder;
using namespace State;

CountShifts::CountShifts(const char *name): CLState(name, *new CountShifts::OnEntry, *new CountShifts::OnExit, *new CountShifts::Internal, NULLPTR, new CountShifts::OnSuspend, new CountShifts::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

CountShifts::~CountShifts()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
}

void CountShifts::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CountShifts_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CountShifts_FuncRefs.mm"
#	include "State_CountShifts_OnEntry.mm"
}
 
void CountShifts::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CountShifts_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CountShifts_FuncRefs.mm"
#	include "State_CountShifts_OnExit.mm"
}

void CountShifts::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CountShifts_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CountShifts_FuncRefs.mm"
#	include "State_CountShifts_Internal.mm"
}

void CountShifts::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CountShifts_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CountShifts_FuncRefs.mm"
#	include "State_CountShifts_OnSuspend.mm"
}

void CountShifts::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CountShifts_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CountShifts_FuncRefs.mm"
#	include "State_CountShifts_OnResume.mm"
}
bool CountShifts::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CountShifts_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CountShifts_FuncRefs.mm"

	return
	(
#		include "State_CountShifts_Transition_0.expr"
	);
}
bool CountShifts::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "BinaryToSingleDigitBCDEncoder_VarRefs.mm"
#	include "State_CountShifts_VarRefs.mm"
#	include "BinaryToSingleDigitBCDEncoder_FuncRefs.mm"
#	include "State_CountShifts_FuncRefs.mm"

	return
	(
#		include "State_CountShifts_Transition_1.expr"
	);
}
