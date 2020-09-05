//
// State_D.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDigit_Includes.h"
#include "SevenSegDigit.h"
#include "State_D.h"

#include "State_D_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDigit;
using namespace State;

D::D(const char *name): CLState(name, *new D::OnEntry, *new D::OnExit, *new D::Internal)
{
	_transitions[0] = new Transition_0();
}

D::~D()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void D::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_D_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_D_FuncRefs.mm"
#	include "State_D_OnEntry.mm"
}

void D::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_D_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_D_FuncRefs.mm"
#	include "State_D_OnExit.mm"
}

void D::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_D_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_D_FuncRefs.mm"
#	include "State_D_Internal.mm"
}

bool D::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDigit_VarRefs.mm"
#	include "State_D_VarRefs.mm"
#	include "SevenSegDigit_FuncRefs.mm"
#	include "State_D_FuncRefs.mm"

	return
	(
#		include "State_D_Transition_0.expr"
	);
}
