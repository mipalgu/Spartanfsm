//
// State_Error.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegmentEncoder_Includes.h"
#include "SevenSegmentEncoder.h"
#include "State_Error.h"

#include "State_Error_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegmentEncoder;
using namespace State;

Error::Error(const char *name): CLState(name, *new Error::OnEntry, *new Error::OnExit, *new Error::Internal, NULLPTR, new Error::OnSuspend, new Error::OnResume)
{
	_transitions[0] = new Transition_0();
}

Error::~Error()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Error::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Error_FuncRefs.mm"
#	include "State_Error_OnEntry.mm"
}
 
void Error::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Error_FuncRefs.mm"
#	include "State_Error_OnExit.mm"
}

void Error::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Error_FuncRefs.mm"
#	include "State_Error_Internal.mm"
}

void Error::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Error_FuncRefs.mm"
#	include "State_Error_OnSuspend.mm"
}

void Error::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Error_FuncRefs.mm"
#	include "State_Error_OnResume.mm"
}
bool Error::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_Error_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_Error_FuncRefs.mm"

	return
	(
#		include "State_Error_Transition_0.expr"
	);
}
