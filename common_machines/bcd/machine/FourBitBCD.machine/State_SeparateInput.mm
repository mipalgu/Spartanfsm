//
// State_SeparateInput.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "FourBitBCD_Includes.h"
#include "FourBitBCD.h"
#include "State_SeparateInput.h"

#include "State_SeparateInput_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMFourBitBCD;
using namespace State;

SeparateInput::SeparateInput(const char *name): CLState(name, *new SeparateInput::OnEntry, *new SeparateInput::OnExit, *new SeparateInput::Internal)
{
	_transitions[0] = new Transition_0();
}

SeparateInput::~SeparateInput()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SeparateInput::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FourBitBCD_VarRefs.mm"
#	include "State_SeparateInput_VarRefs.mm"
#	include "FourBitBCD_FuncRefs.mm"
#	include "State_SeparateInput_FuncRefs.mm"
#	include "State_SeparateInput_OnEntry.mm"
}

void SeparateInput::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FourBitBCD_VarRefs.mm"
#	include "State_SeparateInput_VarRefs.mm"
#	include "FourBitBCD_FuncRefs.mm"
#	include "State_SeparateInput_FuncRefs.mm"
#	include "State_SeparateInput_OnExit.mm"
}

void SeparateInput::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "FourBitBCD_VarRefs.mm"
#	include "State_SeparateInput_VarRefs.mm"
#	include "FourBitBCD_FuncRefs.mm"
#	include "State_SeparateInput_FuncRefs.mm"
#	include "State_SeparateInput_Internal.mm"
}

bool SeparateInput::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "FourBitBCD_VarRefs.mm"
#	include "State_SeparateInput_VarRefs.mm"
#	include "FourBitBCD_FuncRefs.mm"
#	include "State_SeparateInput_FuncRefs.mm"

	return
	(
#		include "State_SeparateInput_Transition_0.expr"
	);
}
