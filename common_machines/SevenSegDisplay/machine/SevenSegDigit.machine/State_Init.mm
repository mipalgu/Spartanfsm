//
// State_Init.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Init.h"

#include "State_Init_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

Init::Init(const char *name): CLState(name, *new Init::OnEntry, *new Init::OnExit, *new Init::Internal, NULLPTR, new Init::OnSuspend, new Init::OnResume)
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
	_transitions[12] = new Transition_12();
	_transitions[13] = new Transition_13();
	_transitions[14] = new Transition_14();
	_transitions[15] = new Transition_15();
}

Init::~Init()
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
	delete _transitions[12];
	delete _transitions[13];
	delete _transitions[14];
	delete _transitions[15];
}

void Init::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"
#	include "State_Init_OnEntry.mm"
}
 
void Init::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"
#	include "State_Init_OnExit.mm"
}

void Init::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"
#	include "State_Init_Internal.mm"
}

void Init::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"
#	include "State_Init_OnSuspend.mm"
}

void Init::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"
#	include "State_Init_OnResume.mm"
}
bool Init::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_0.expr"
	);
}
bool Init::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_1.expr"
	);
}
bool Init::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_2.expr"
	);
}
bool Init::Transition_3::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_3.expr"
	);
}
bool Init::Transition_4::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_4.expr"
	);
}
bool Init::Transition_5::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_5.expr"
	);
}
bool Init::Transition_6::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_6.expr"
	);
}
bool Init::Transition_7::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_7.expr"
	);
}
bool Init::Transition_8::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_8.expr"
	);
}
bool Init::Transition_9::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_9.expr"
	);
}
bool Init::Transition_10::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_10.expr"
	);
}
bool Init::Transition_11::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_11.expr"
	);
}
bool Init::Transition_12::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_12.expr"
	);
}
bool Init::Transition_13::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_13.expr"
	);
}
bool Init::Transition_14::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_14.expr"
	);
}
bool Init::Transition_15::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Init_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Init_FuncRefs.mm"

	return
	(
#		include "State_Init_Transition_15.expr"
	);
}
