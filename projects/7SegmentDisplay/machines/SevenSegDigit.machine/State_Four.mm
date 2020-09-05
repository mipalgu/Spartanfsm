//
// State_Four.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Four.h"

#include "State_Four_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

Four::Four(const char *name): CLState(name, *new Four::OnEntry, *new Four::OnExit, *new Four::Internal)
{
}

Four::~Four()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Four::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Four_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Four_FuncRefs.mm"
#	include "State_Four_OnEntry.mm"
}

void Four::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Four_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Four_FuncRefs.mm"
#	include "State_Four_OnExit.mm"
}

void Four::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Four_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Four_FuncRefs.mm"
#	include "State_Four_Internal.mm"
}

