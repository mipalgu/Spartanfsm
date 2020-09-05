//
// State_One.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_One.h"

#include "State_One_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
using namespace State;

One::One(const char *name): CLState(name, *new One::OnEntry, *new One::OnExit, *new One::Internal)
{
}

One::~One()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void One::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_One_FuncRefs.mm"
#	include "State_One_OnEntry.mm"
}

void One::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_One_FuncRefs.mm"
#	include "State_One_OnExit.mm"
}

void One::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_One_FuncRefs.mm"
#	include "State_One_Internal.mm"
}

