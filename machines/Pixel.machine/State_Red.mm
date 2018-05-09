//
// State_Red.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "Pixel_Includes.h"
#include "Pixel.h"
#include "State_Red.h"

#include "State_Red_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMPixel;
using namespace State;

Red::Red(const char *name): CLState(name, *new Red::OnEntry, *new Red::OnExit, *new Red::Internal)
{
	_transitions[0] = new Transition_0();
}

Red::~Red()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void Red::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Pixel_VarRefs.mm"
#	include "State_Red_VarRefs.mm"
#	include "Pixel_FuncRefs.mm"
#	include "State_Red_FuncRefs.mm"
#	include "State_Red_OnEntry.mm"
}

void Red::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Pixel_VarRefs.mm"
#	include "State_Red_VarRefs.mm"
#	include "Pixel_FuncRefs.mm"
#	include "State_Red_FuncRefs.mm"
#	include "State_Red_OnExit.mm"
}

void Red::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "Pixel_VarRefs.mm"
#	include "State_Red_VarRefs.mm"
#	include "Pixel_FuncRefs.mm"
#	include "State_Red_FuncRefs.mm"
#	include "State_Red_Internal.mm"
}

bool Red::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "Pixel_VarRefs.mm"
#	include "State_Red_VarRefs.mm"
#	include "Pixel_FuncRefs.mm"
#	include "State_Red_FuncRefs.mm"

	return
	(
#		include "State_Red_Transition_0.expr"
	);
}
