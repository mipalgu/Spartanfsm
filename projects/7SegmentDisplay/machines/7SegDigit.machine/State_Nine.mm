//
// State_Nine.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_Nine.h"

#include "State_Nine_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
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
#	include "7SegDigit_VarRefs.mm"
#	include "State_Nine_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Nine_FuncRefs.mm"
#	include "State_Nine_OnEntry.mm"
}

void Nine::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Nine_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Nine_FuncRefs.mm"
#	include "State_Nine_OnExit.mm"
}

void Nine::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Nine_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Nine_FuncRefs.mm"
#	include "State_Nine_Internal.mm"
}

