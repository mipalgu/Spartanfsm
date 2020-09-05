//
// State_Eight.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_Eight.h"

#include "State_Eight_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

Eight::Eight(const char *name): CLState(name, *new Eight::OnEntry, *new Eight::OnExit, *new Eight::Internal)
{
}

Eight::~Eight()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Eight::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_OnEntry.mm"
}

void Eight::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_OnExit.mm"
}

void Eight::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_Internal.mm"
}

