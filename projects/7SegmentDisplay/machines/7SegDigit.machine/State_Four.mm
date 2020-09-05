//
// State_Four.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_Four.h"

#include "State_Four_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
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
#	include "7SegDigit_VarRefs.mm"
#	include "State_Four_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Four_FuncRefs.mm"
#	include "State_Four_OnEntry.mm"
}

void Four::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Four_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Four_FuncRefs.mm"
#	include "State_Four_OnExit.mm"
}

void Four::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Four_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Four_FuncRefs.mm"
#	include "State_Four_Internal.mm"
}

