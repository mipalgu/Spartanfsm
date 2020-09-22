//
// State_One.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegmentEncoder_Includes.h"
#include "SevenSegmentEncoder.h"
#include "State_One.h"

#include "State_One_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegmentEncoder;
using namespace State;

One::One(const char *name): CLState(name, *new One::OnEntry, *new One::OnExit, *new One::Internal, NULLPTR, new One::OnSuspend, new One::OnResume)
{
	_transitions[0] = new Transition_0();
}

One::~One()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void One::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_One_FuncRefs.mm"
#	include "State_One_OnEntry.mm"
}
 
void One::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_One_FuncRefs.mm"
#	include "State_One_OnExit.mm"
}

void One::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_One_FuncRefs.mm"
#	include "State_One_Internal.mm"
}

void One::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_One_FuncRefs.mm"
#	include "State_One_OnSuspend.mm"
}

void One::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_One_FuncRefs.mm"
#	include "State_One_OnResume.mm"
}
bool One::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoder_VarRefs.mm"
#	include "State_One_VarRefs.mm"
#	include "SevenSegmentEncoder_FuncRefs.mm"
#	include "State_One_FuncRefs.mm"

	return
	(
#		include "State_One_Transition_0.expr"
	);
}
