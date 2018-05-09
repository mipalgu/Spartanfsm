//
// State_Waits.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "PixelFlip_Includes.h"
#include "PixelFlip.h"
#include "State_Waits.h"

#include "State_Waits_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMPixelFlip;
using namespace State;

Waits::Waits(const char *name): CLState(name, *new Waits::OnEntry, *new Waits::OnExit, *new Waits::Internal)
{
	_transitions[0] = new Transition_0();
}

Waits::~Waits()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Waits::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PixelFlip_VarRefs.mm"
#	include "State_Waits_VarRefs.mm"
#	include "PixelFlip_FuncRefs.mm"
#	include "State_Waits_FuncRefs.mm"
#	include "State_Waits_OnEntry.mm"
}

void Waits::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PixelFlip_VarRefs.mm"
#	include "State_Waits_VarRefs.mm"
#	include "PixelFlip_FuncRefs.mm"
#	include "State_Waits_FuncRefs.mm"
#	include "State_Waits_OnExit.mm"
}

void Waits::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "PixelFlip_VarRefs.mm"
#	include "State_Waits_VarRefs.mm"
#	include "PixelFlip_FuncRefs.mm"
#	include "State_Waits_FuncRefs.mm"
#	include "State_Waits_Internal.mm"
}

bool Waits::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "PixelFlip_VarRefs.mm"
#	include "State_Waits_VarRefs.mm"
#	include "PixelFlip_FuncRefs.mm"
#	include "State_Waits_FuncRefs.mm"

	return
	(
#		include "State_Waits_Transition_0.expr"
	);
}
