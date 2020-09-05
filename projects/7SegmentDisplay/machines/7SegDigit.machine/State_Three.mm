//
// State_Three.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_Three.h"

#include "State_Three_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
using namespace State;

Three::Three(const char *name): CLState(name, *new Three::OnEntry, *new Three::OnExit, *new Three::Internal)
{
}

Three::~Three()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Three::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Three_FuncRefs.mm"
#	include "State_Three_OnEntry.mm"
}

void Three::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Three_FuncRefs.mm"
#	include "State_Three_OnExit.mm"
}

void Three::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_Three_FuncRefs.mm"
#	include "State_Three_Internal.mm"
}

