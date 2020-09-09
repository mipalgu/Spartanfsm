//
// State_SeparateInput.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "bcd_Includes.h"
#include "bcd.h"
#include "State_SeparateInput.h"

#include "State_SeparateInput_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMbcd;
using namespace State;

SeparateInput::SeparateInput(const char *name): CLState(name, *new SeparateInput::OnEntry, *new SeparateInput::OnExit, *new SeparateInput::Internal)
{
}

SeparateInput::~SeparateInput()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void SeparateInput::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_SeparateInput_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_SeparateInput_FuncRefs.mm"
#	include "State_SeparateInput_OnEntry.mm"
}

void SeparateInput::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_SeparateInput_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_SeparateInput_FuncRefs.mm"
#	include "State_SeparateInput_OnExit.mm"
}

void SeparateInput::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "bcd_VarRefs.mm"
#	include "State_SeparateInput_VarRefs.mm"
#	include "bcd_FuncRefs.mm"
#	include "State_SeparateInput_FuncRefs.mm"
#	include "State_SeparateInput_Internal.mm"
}

