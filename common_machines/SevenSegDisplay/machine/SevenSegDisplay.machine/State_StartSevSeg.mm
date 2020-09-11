//
// State_StartSevSeg.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDisplay_Includes.h"
#include "SevenSegDisplay.h"
#include "State_StartSevSeg.h"

#include "State_StartSevSeg_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDisplay;
using namespace State;

StartSevSeg::StartSevSeg(const char *name): CLState(name, *new StartSevSeg::OnEntry, *new StartSevSeg::OnExit, *new StartSevSeg::Internal)
{
	_transitions[0] = new Transition_0();
}

StartSevSeg::~StartSevSeg()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void StartSevSeg::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_StartSevSeg_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_StartSevSeg_FuncRefs.mm"
#	include "State_StartSevSeg_OnEntry.mm"
}

void StartSevSeg::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_StartSevSeg_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_StartSevSeg_FuncRefs.mm"
#	include "State_StartSevSeg_OnExit.mm"
}

void StartSevSeg::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_StartSevSeg_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_StartSevSeg_FuncRefs.mm"
#	include "State_StartSevSeg_Internal.mm"
}

bool StartSevSeg::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_StartSevSeg_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_StartSevSeg_FuncRefs.mm"

	return
	(
#		include "State_StartSevSeg_Transition_0.expr"
	);
}
