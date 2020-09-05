//
// State_B.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_B.h"

#include "State_B_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
using namespace State;

B::B(const char *name): CLState(name, *new B::OnEntry, *new B::OnExit, *new B::Internal)
{
}

B::~B()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void B::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_B_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_B_FuncRefs.mm"
#	include "State_B_OnEntry.mm"
}

void B::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_B_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_B_FuncRefs.mm"
#	include "State_B_OnExit.mm"
}

void B::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_B_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_B_FuncRefs.mm"
#	include "State_B_Internal.mm"
}

