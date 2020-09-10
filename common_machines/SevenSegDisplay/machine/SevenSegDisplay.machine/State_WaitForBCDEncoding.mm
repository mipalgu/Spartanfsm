//
// State_WaitForBCDEncoding.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDisplay_Includes.h"
#include "SevenSegDisplay.h"
#include "State_WaitForBCDEncoding.h"

#include "State_WaitForBCDEncoding_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDisplay;
using namespace State;

WaitForBCDEncoding::WaitForBCDEncoding(const char *name): CLState(name, *new WaitForBCDEncoding::OnEntry, *new WaitForBCDEncoding::OnExit, *new WaitForBCDEncoding::Internal)
{
	_transitions[0] = new Transition_0();
}

WaitForBCDEncoding::~WaitForBCDEncoding()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void WaitForBCDEncoding::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_WaitForBCDEncoding_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_WaitForBCDEncoding_FuncRefs.mm"
#	include "State_WaitForBCDEncoding_OnEntry.mm"
}

void WaitForBCDEncoding::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_WaitForBCDEncoding_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_WaitForBCDEncoding_FuncRefs.mm"
#	include "State_WaitForBCDEncoding_OnExit.mm"
}

void WaitForBCDEncoding::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_WaitForBCDEncoding_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_WaitForBCDEncoding_FuncRefs.mm"
#	include "State_WaitForBCDEncoding_Internal.mm"
}

bool WaitForBCDEncoding::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_WaitForBCDEncoding_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_WaitForBCDEncoding_FuncRefs.mm"

	return
	(
#		include "State_WaitForBCDEncoding_Transition_0.expr"
	);
}
