//
// State_WaitForFinish.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#include "SevenSegDisplay_Includes.h"
#include "SevenSegDisplay.h"
#include "State_WaitForFinish.h"

#include "State_WaitForFinish_Includes.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegDisplay;
using namespace State;

WaitForFinish::WaitForFinish(const char *name): CLState(name, *new WaitForFinish::OnEntry, *new WaitForFinish::OnExit, *new WaitForFinish::Internal, NULLPTR, new WaitForFinish::OnSuspend, new WaitForFinish::OnResume)
{
	_transitions[0] = new Transition_0();
}

WaitForFinish::~WaitForFinish()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();

	delete _transitions[0];
}

void WaitForFinish::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_WaitForFinish_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_WaitForFinish_FuncRefs.mm"
#	include "State_WaitForFinish_OnEntry.mm"
}

void WaitForFinish::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_WaitForFinish_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_WaitForFinish_FuncRefs.mm"
#	include "State_WaitForFinish_OnExit.mm"
}

void WaitForFinish::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_WaitForFinish_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_WaitForFinish_FuncRefs.mm"
#	include "State_WaitForFinish_Internal.mm"
}

void WaitForFinish::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_WaitForFinish_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_WaitForFinish_FuncRefs.mm"
#	include "State_WaitForFinish_OnSuspend.mm"
}

void WaitForFinish::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_WaitForFinish_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_WaitForFinish_FuncRefs.mm"
#	include "State_WaitForFinish_OnResume.mm"
}

bool WaitForFinish::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegDisplay_VarRefs.mm"
#	include "State_WaitForFinish_VarRefs.mm"
#	include "SevenSegDisplay_FuncRefs.mm"
#	include "State_WaitForFinish_FuncRefs.mm"

	return
	(
#		include "State_WaitForFinish_Transition_0.expr"
	);
}
