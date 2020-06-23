//
// State_Suspend.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegmentEncoding_Includes.h"
#include "SevenSegmentEncoding.h"
#include "State_Suspend.h"

#include "State_Suspend_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegmentEncoding;
using namespace State;

Suspend::Suspend(const char *name): CLState(name, *new Suspend::OnEntry, *new Suspend::OnExit, *new Suspend::Internal, NULLPTR, new Suspend::OnSuspend, new Suspend::OnResume)
{
}

Suspend::~Suspend()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
}

void Suspend::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_OnEntry.mm"
}
 
void Suspend::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_OnExit.mm"
}

void Suspend::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_Internal.mm"
}

void Suspend::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_OnSuspend.mm"
}

void Suspend::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentEncoding_VarRefs.mm"
#	include "State_Suspend_VarRefs.mm"
#	include "SevenSegmentEncoding_FuncRefs.mm"
#	include "State_Suspend_FuncRefs.mm"
#	include "State_Suspend_OnResume.mm"
}
