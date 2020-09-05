//
// State_E.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_E.h"

#include "State_E_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
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
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_E_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_E_FuncRefs.mm"
#	include "State_E_OnEntry.mm"
}

void E::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_E_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_E_FuncRefs.mm"
#	include "State_E_OnExit.mm"
}

void E::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_E_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_E_FuncRefs.mm"
#	include "State_E_Internal.mm"
}

