//
// State_Initial.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Initial.h"

#include "State_Initial_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

Initial::Initial(const char *name): CLState(name, *new Initial::OnEntry, *new Initial::OnExit, *new Initial::Internal)
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

Initial::~Initial()
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

void Initial::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnEntry.mm"
}

void Initial::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnExit.mm"
}

void Initial::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_Internal.mm"
}

bool Initial::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_0.expr"
	);
}
bool Initial::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_1.expr"
	);
}
bool Initial::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_2.expr"
	);
}
bool Initial::Transition_3::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_3.expr"
	);
}
bool Initial::Transition_4::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_4.expr"
	);
}
bool Initial::Transition_5::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_5.expr"
	);
}
bool Initial::Transition_6::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_6.expr"
	);
}
bool Initial::Transition_7::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_7.expr"
	);
}
bool Initial::Transition_8::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_8.expr"
	);
}
bool Initial::Transition_9::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_9.expr"
	);
}
bool Initial::Transition_10::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_10.expr"
	);
}
bool Initial::Transition_11::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_11.expr"
	);
}
bool Initial::Transition_12::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_12.expr"
	);
}
bool Initial::Transition_13::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_13.expr"
	);
}
bool Initial::Transition_14::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_14.expr"
	);
}
bool Initial::Transition_15::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"

	return
	(
#		include "State_Initial_Transition_15.expr"
	);
}
