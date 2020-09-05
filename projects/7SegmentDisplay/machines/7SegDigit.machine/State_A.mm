//
// State_A.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_A.h"

#include "State_A_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
using namespace State;

A::A(const char *name): CLState(name, *new A::OnEntry, *new A::OnExit, *new A::Internal)
{
}

A::~A()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void A::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_A_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_A_FuncRefs.mm"
#	include "State_A_OnEntry.mm"
}

void A::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_A_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_A_FuncRefs.mm"
#	include "State_A_OnExit.mm"
}

void A::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_A_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_A_FuncRefs.mm"
#	include "State_A_Internal.mm"
}

