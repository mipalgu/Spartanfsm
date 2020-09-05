//
// State_Five.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_Five.h"

#include "State_Five_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
using namespace State;

Five::Five(const char *name): CLState(name, *new Five::OnEntry, *new Five::OnExit, *new Five::Internal)
{
}

Five::~Five()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Five::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Five_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Five_FuncRefs.mm"
#	include "State_Five_OnEntry.mm"
}

void Five::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Five_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Five_FuncRefs.mm"
#	include "State_Five_OnExit.mm"
}

void Five::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Five_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Five_FuncRefs.mm"
#	include "State_Five_Internal.mm"
}

