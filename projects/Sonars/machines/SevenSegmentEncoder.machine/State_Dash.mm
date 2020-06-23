//
// State_Dash.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegmentEncoder_Includes.h"
#include "SevenSegmentEncoder.h"
#include "State_Dash.h"

#include "State_Dash_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegmentEncoder;
using namespace State;

Dash::Dash(const char *name): CLState(name, *new Dash::OnEntry, *new Dash::OnExit, *new Dash::Internal, NULLPTR, new Dash::OnSuspend, new Dash::OnResume)
{
	_transitions[0] = new Transition_0();
}

Dash::~Dash()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Dash::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Dash_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Dash_FuncRefs.mm"
#	include "State_Dash_OnEntry.mm"
}
 
void Dash::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Dash_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Dash_FuncRefs.mm"
#	include "State_Dash_OnExit.mm"
}

void Dash::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Dash_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Dash_FuncRefs.mm"
#	include "State_Dash_Internal.mm"
}

void Dash::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Dash_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Dash_FuncRefs.mm"
#	include "State_Dash_OnSuspend.mm"
}

void Dash::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Dash_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Dash_FuncRefs.mm"
#	include "State_Dash_OnResume.mm"
}
bool Dash::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Dash_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Dash_FuncRefs.mm"

	return
	(
#		include "State_Dash_Transition_0.expr"
	);
}
