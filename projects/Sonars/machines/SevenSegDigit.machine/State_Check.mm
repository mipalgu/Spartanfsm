//
// State_Check.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Check.h"

#include "State_Check_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

Check::Check(const char *name): CLState(name, *new Check::OnEntry, *new Check::OnExit, *new Check::Internal)
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

Check::~Check()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

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

void Check::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"
#	include "State_Check_OnEntry.mm"
}

void Check::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"
#	include "State_Check_OnExit.mm"
}

void Check::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"
#	include "State_Check_Internal.mm"
}

bool Check::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_0.expr"
	);
}
bool Check::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_1.expr"
	);
}
bool Check::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_2.expr"
	);
}
bool Check::Transition_3::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_3.expr"
	);
}
bool Check::Transition_4::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_4.expr"
	);
}
bool Check::Transition_5::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_5.expr"
	);
}
bool Check::Transition_6::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_6.expr"
	);
}
bool Check::Transition_7::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_7.expr"
	);
}
bool Check::Transition_8::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_8.expr"
	);
}
bool Check::Transition_9::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_9.expr"
	);
}
bool Check::Transition_10::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_10.expr"
	);
}
bool Check::Transition_11::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_11.expr"
	);
}
bool Check::Transition_12::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_12.expr"
	);
}
bool Check::Transition_13::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_13.expr"
	);
}
bool Check::Transition_14::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_14.expr"
	);
}
bool Check::Transition_15::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Check_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Check_FuncRefs.mm"

	return
	(
#		include "State_Check_Transition_15.expr"
	);
}
