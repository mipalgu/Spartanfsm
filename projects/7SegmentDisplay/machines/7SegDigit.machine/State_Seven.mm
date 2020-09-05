//
// State_Seven.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_Seven.h"

#include "State_Seven_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
using namespace State;

Seven::Seven(const char *name): CLState(name, *new Seven::OnEntry, *new Seven::OnExit, *new Seven::Internal)
{
}

Seven::~Seven()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Seven::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Seven_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Seven_FuncRefs.mm"
#	include "State_Seven_OnEntry.mm"
}

void Seven::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Seven_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Seven_FuncRefs.mm"
#	include "State_Seven_OnExit.mm"
}

void Seven::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Seven_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Seven_FuncRefs.mm"
#	include "State_Seven_Internal.mm"
}

