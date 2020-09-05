//
// State_Nine.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Nine.h"

#include "State_Nine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

Nine::Nine(const char *name): CLState(name, *new Nine::OnEntry, *new Nine::OnExit, *new Nine::Internal)
{
}

Nine::~Nine()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Nine::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Nine_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Nine_FuncRefs.mm"
#	include "State_Nine_OnEntry.mm"
}

void Nine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Nine_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Nine_FuncRefs.mm"
#	include "State_Nine_OnExit.mm"
}

void Nine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Nine_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Nine_FuncRefs.mm"
#	include "State_Nine_Internal.mm"
}

