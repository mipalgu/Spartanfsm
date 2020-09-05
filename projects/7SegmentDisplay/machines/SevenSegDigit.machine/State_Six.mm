//
// State_Six.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Six.h"

#include "State_Six_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

Six::Six(const char *name): CLState(name, *new Six::OnEntry, *new Six::OnExit, *new Six::Internal)
{
}

Six::~Six()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Six::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Six_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Six_FuncRefs.mm"
#	include "State_Six_OnEntry.mm"
}

void Six::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Six_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Six_FuncRefs.mm"
#	include "State_Six_OnExit.mm"
}

void Six::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Six_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Six_FuncRefs.mm"
#	include "State_Six_Internal.mm"
}

