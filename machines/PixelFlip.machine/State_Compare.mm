//
// State_Compare.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "PixelFlip_Includes.h"
#include "PixelFlip.h"
#include "State_Compare.h"

#include "State_Compare_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMPixelFlip;
using namespace State;

Compare::Compare(const char *name): CLState(name, *new Compare::OnEntry, *new Compare::OnExit, *new Compare::Internal)
{
	_transitions[0] = new Transition_0();
	_transitions[1] = new Transition_1();
	_transitions[2] = new Transition_2();
}

Compare::~Compare()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
	delete _transitions[1];
	delete _transitions[2];
}

void Compare::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PixelFlip_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "PixelFlip_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"
#	include "State_Compare_OnEntry.mm"
}

void Compare::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PixelFlip_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "PixelFlip_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"
#	include "State_Compare_OnExit.mm"
}

void Compare::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PixelFlip_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "PixelFlip_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"
#	include "State_Compare_Internal.mm"
}

bool Compare::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "PixelFlip_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "PixelFlip_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_0.expr"
	);
}
bool Compare::Transition_1::check(CLMachine *_machine, CLState *_state) const
{
#	include "PixelFlip_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "PixelFlip_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_1.expr"
	);
}
bool Compare::Transition_2::check(CLMachine *_machine, CLState *_state) const
{
#	include "PixelFlip_VarRefs.mm"
#	include "State_Compare_VarRefs.mm"
#	include "PixelFlip_FuncRefs.mm"
#	include "State_Compare_FuncRefs.mm"

	return
	(
#		include "State_Compare_Transition_2.expr"
	);
}
