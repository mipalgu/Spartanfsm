//
// State_SetOutput.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "FourBitBCD_Includes.h"
#include "FourBitBCD.h"
#include "State_SetOutput.h"

#include "State_SetOutput_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMFourBitBCD;
using namespace State;

SetOutput::SetOutput(const char *name): CLState(name, *new SetOutput::OnEntry, *new SetOutput::OnExit, *new SetOutput::Internal)
{
	_transitions[0] = new Transition_0();
}

SetOutput::~SetOutput()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SetOutput::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FourBitBCD_VarRefs.mm"
#	include "State_SetOutput_VarRefs.mm"
#	include "FourBitBCD_FuncRefs.mm"
#	include "State_SetOutput_FuncRefs.mm"
#	include "State_SetOutput_OnEntry.mm"
}

void SetOutput::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FourBitBCD_VarRefs.mm"
#	include "State_SetOutput_VarRefs.mm"
#	include "FourBitBCD_FuncRefs.mm"
#	include "State_SetOutput_FuncRefs.mm"
#	include "State_SetOutput_OnExit.mm"
}

void SetOutput::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FourBitBCD_VarRefs.mm"
#	include "State_SetOutput_VarRefs.mm"
#	include "FourBitBCD_FuncRefs.mm"
#	include "State_SetOutput_FuncRefs.mm"
#	include "State_SetOutput_Internal.mm"
}

bool SetOutput::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "FourBitBCD_VarRefs.mm"
#	include "State_SetOutput_VarRefs.mm"
#	include "FourBitBCD_FuncRefs.mm"
#	include "State_SetOutput_FuncRefs.mm"

	return
	(
#		include "State_SetOutput_Transition_0.expr"
	);
}
