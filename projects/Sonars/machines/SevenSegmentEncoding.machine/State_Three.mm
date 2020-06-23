//
// State_Three.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegmentEncoding_Includes.h"
#include "SevenSegmentEncoding.h"
#include "State_Three.h"

#include "State_Three_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegmentEncoding;
using namespace State;

Three::Three(const char *name): CLState(name, *new Three::OnEntry, *new Three::OnExit, *new Three::Internal, NULLPTR, new Three::OnSuspend, new Three::OnResume)
{
	_transitions[0] = new Transition_0();
}

Three::~Three()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Three::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Three_FuncRefs.mm"
#	include "State_Three_OnEntry.mm"
}
 
void Three::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Three_FuncRefs.mm"
#	include "State_Three_OnExit.mm"
}

void Three::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Three_FuncRefs.mm"
#	include "State_Three_Internal.mm"
}

void Three::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Three_FuncRefs.mm"
#	include "State_Three_OnSuspend.mm"
}

void Three::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Three_FuncRefs.mm"
#	include "State_Three_OnResume.mm"
}
bool Three::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Three_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Three_FuncRefs.mm"

	return
	(
#		include "State_Three_Transition_0.expr"
	);
}
