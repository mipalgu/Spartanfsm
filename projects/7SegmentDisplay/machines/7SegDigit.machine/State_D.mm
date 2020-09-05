//
// State_D.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "7SegDigit_Includes.h"
#include "7SegDigit.h"
#include "State_D.h"

#include "State_D_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM7SegDigit;
using namespace State;

D::D(const char *name): CLState(name, *new D::OnEntry, *new D::OnExit, *new D::Internal)
{
}

D::~D()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void D::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_D_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_D_FuncRefs.mm"
#	include "State_D_OnEntry.mm"
}

void D::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_D_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_D_FuncRefs.mm"
#	include "State_D_OnExit.mm"
}

void D::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "7SegDigit_VarRefs.mm"
#	include "State_D_VarRefs.mm"
#	include "7SegDigit_FuncRefs.mm"
#	include "State_D_FuncRefs.mm"
#	include "State_D_Internal.mm"
}

