//
// State_E.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_E.h"

#include "State_E_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
using namespace State;

E::E(const char *name): CLState(name, *new E::OnEntry, *new E::OnExit, *new E::Internal)
{
}

E::~E()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void E::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_E_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_E_FuncRefs.mm"
#	include "State_E_OnEntry.mm"
}

void E::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_E_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_E_FuncRefs.mm"
#	include "State_E_OnExit.mm"
}

void E::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_E_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_E_FuncRefs.mm"
#	include "State_E_Internal.mm"
}

