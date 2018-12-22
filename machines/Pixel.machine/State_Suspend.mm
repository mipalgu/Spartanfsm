//
// State_Suspend.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "Pixel_Includes.h"
#include "Pixel.h"
#include "State_Suspend.h"

#include "State_Suspend_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMPixel;
using namespace State;

Suspend::Suspend(const char *name): CLState(name, *new Suspend::OnEntry, *new Suspend::OnExit, *new Suspend::Internal)
{
	_transitions[0] = new Transition_0();
}

Suspend::~Suspend()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Suspend::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Pixel_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "Pixel_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_OnEntry.mm"
}

void Suspend::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Pixel_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "Pixel_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_OnExit.mm"
}

void Suspend::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Pixel_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "Pixel_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_Internal.mm"
}

bool Suspend::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Pixel_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "Pixel_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"

	return
	(
#		include "State_Suspend_Transition_0.expr"
	);
}
