//
// State_Six.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_Six.h"

#include "State_Six_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
using namespace State;

Six::Six(const char *name): CLState(name, *new Six::OnEntry, *new Six::OnExit, *new Six::Internal)
{
}

Six::~Six()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Six::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Six_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Six_FuncRefs.mm"
#	include "State_Six_OnEntry.mm"
}

void Six::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Six_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Six_FuncRefs.mm"
#	include "State_Six_OnExit.mm"
}

void Six::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Six_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Six_FuncRefs.mm"
#	include "State_Six_Internal.mm"
}

