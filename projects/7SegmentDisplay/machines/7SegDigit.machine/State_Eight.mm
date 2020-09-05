//
// State_Eight.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_Eight.h"

#include "State_Eight_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
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
#	include "7SegDigit_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_OnEntry.mm"
}

void Eight::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_OnExit.mm"
}

void Eight::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Eight_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Eight_FuncRefs.mm"
#	include "State_Eight_Internal.mm"
}

