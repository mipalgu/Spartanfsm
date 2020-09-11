//
// State_BcdEncode.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SevenSegDisplay_Includes.h"
#include "SevenSegDisplay.h"
#include "State_BcdEncode.h"

#include "State_BcdEncode_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDisplay;
using namespace State;

BcdEncode::BcdEncode(const char *name): CLState(name, *new BcdEncode::OnEntry, *new BcdEncode::OnExit, *new BcdEncode::Internal)
{
	_transitions[0] = new Transition_0();
}

BcdEncode::~BcdEncode()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void BcdEncode::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_BcdEncode_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_BcdEncode_FuncRefs.mm"
#	include "State_BcdEncode_OnEntry.mm"
}

void BcdEncode::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_BcdEncode_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_BcdEncode_FuncRefs.mm"
#	include "State_BcdEncode_OnExit.mm"
}

void BcdEncode::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_BcdEncode_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_BcdEncode_FuncRefs.mm"
#	include "State_BcdEncode_Internal.mm"
}

bool BcdEncode::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_BcdEncode_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_BcdEncode_FuncRefs.mm"

	return
	(
#		include "State_BcdEncode_Transition_0.expr"
	);
}
