//
// State_Compare.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegmentEncoder_Includes.h"
#include "SevenSegmentEncoder.h"
#include "State_Compare.h"

#include "State_Compare_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegmentEncoder;
using namespace State;

Compare::Compare(const char *name): CLState(name, *new Compare::OnEntry, *new Compare::OnExit, *new Compare::Internal, NULLPTR, new Compare::OnSuspend, new Compare::OnResume)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
	_transitions[3] = new Transition_3();
	_transitions[4] = new Transition_4();
	_transitions[5] = new Transition_5();
	_transitions[6] = new Transition_6();
	_transitions[7] = new Transition_7();
	_transitions[8] = new Transition_8();
	_transitions[9] = new Transition_9();
	_transitions[10] = new Transition_10();
	_transitions[11] = new Transition_11();
}

Compare::~Compare()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
	delete _transitions[3];
	delete _transitions[4];
	delete _transitions[5];
	delete _transitions[6];
	delete _transitions[7];
	delete _transitions[8];
	delete _transitions[9];
	delete _transitions[10];
	delete _transitions[11];
}

void Compare::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"
#	include "State_Compare_OnEntry.mm"
}
 
void Compare::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"
#	include "State_Compare_OnExit.mm"
}

void Compare::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"
#	include "State_Compare_Internal.mm"
}

void Compare::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"
#	include "State_Compare_OnSuspend.mm"
}

void Compare::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"
#	include "State_Compare_OnResume.mm"
}
bool Compare::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_0.expr"
	);
}
bool Compare::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_1.expr"
	);
}
bool Compare::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_2.expr"
	);
}
bool Compare::Transition_3::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_3.expr"
	);
}
bool Compare::Transition_4::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_4.expr"
	);
}
bool Compare::Transition_5::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_5.expr"
	);
}
bool Compare::Transition_6::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_6.expr"
	);
}
bool Compare::Transition_7::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_7.expr"
	);
}
bool Compare::Transition_8::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_8.expr"
	);
}
bool Compare::Transition_9::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_9.expr"
	);
}
bool Compare::Transition_10::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_10.expr"
	);
}
bool Compare::Transition_11::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_11.expr"
	);
}
