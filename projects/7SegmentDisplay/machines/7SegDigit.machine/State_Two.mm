//
// State_Two.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_Two.h"

#include "State_Two_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
using namespace State;

Two::Two(const char *name): CLState(name, *new Two::OnEntry, *new Two::OnExit, *new Two::Internal)
{
}

Two::~Two()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Two::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Two_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Two_FuncRefs.mm"
#	include "State_Two_OnEntry.mm"
}

void Two::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Two_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Two_FuncRefs.mm"
#	include "State_Two_OnExit.mm"
}

void Two::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Two_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Two_FuncRefs.mm"
#	include "State_Two_Internal.mm"
}

