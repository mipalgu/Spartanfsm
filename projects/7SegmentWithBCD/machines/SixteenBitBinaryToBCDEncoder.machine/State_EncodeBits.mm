//
// State_EncodeBits.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SixteenBitBinaryToBCDEncoder_Includes.h"
#include "SixteenBitBinaryToBCDEncoder.h"
#include "State_EncodeBits.h"

#include "State_EncodeBits_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSixteenBitBinaryToBCDEncoder;
using namespace State;

EncodeBits::EncodeBits(const char *name): CLState(name, *new EncodeBits::OnEntry, *new EncodeBits::OnExit, *new EncodeBits::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
}

EncodeBits::~EncodeBits()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
}

void EncodeBits::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_EncodeBits_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_EncodeBits_FuncRefs.mm"
#	include "State_EncodeBits_OnEntry.mm"
}

void EncodeBits::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_EncodeBits_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_EncodeBits_FuncRefs.mm"
#	include "State_EncodeBits_OnExit.mm"
}

void EncodeBits::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_EncodeBits_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_EncodeBits_FuncRefs.mm"
#	include "State_EncodeBits_Internal.mm"
}

bool EncodeBits::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_EncodeBits_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_EncodeBits_FuncRefs.mm"

	return
	(
#		include "State_EncodeBits_Transition_0.expr"
	);
}
bool EncodeBits::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_EncodeBits_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_EncodeBits_FuncRefs.mm"

	return
	(
#		include "State_EncodeBits_Transition_1.expr"
	);
}
