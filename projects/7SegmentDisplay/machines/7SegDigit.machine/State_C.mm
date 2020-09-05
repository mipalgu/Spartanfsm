//
// State_C.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_C.h"

#include "State_C_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
using namespace State;

C::C(const char *name): CLState(name, *new C::OnEntry, *new C::OnExit, *new C::Internal)
{
}

C::~C()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void C::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_C_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_C_FuncRefs.mm"
#	include "State_C_OnEntry.mm"
}

void C::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_C_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_C_FuncRefs.mm"
#	include "State_C_OnExit.mm"
}

void C::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_C_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_C_FuncRefs.mm"
#	include "State_C_Internal.mm"
}

