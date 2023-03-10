//
// State_SuspendChild.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "ParentMachine_Includes.h"
#include "ParentMachine.h"
#include "State_SuspendChild.h"

#include "State_SuspendChild_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMParentMachine;
using namespace State;

SuspendChild::SuspendChild(const char *name): CLState(name, *new SuspendChild::OnEntry, *new SuspendChild::OnExit, *new SuspendChild::Internal, NULLPTR, new SuspendChild::OnSuspend, new SuspendChild::OnResume)
{
	_transitions[0] = new Transition_0();
}

SuspendChild::~SuspendChild()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void SuspendChild::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_SuspendChild_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_SuspendChild_FuncRefs.mm"
#	include "State_SuspendChild_OnEntry.mm"
}
 
void SuspendChild::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_SuspendChild_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_SuspendChild_FuncRefs.mm"
#	include "State_SuspendChild_OnExit.mm"
}

void SuspendChild::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_SuspendChild_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_SuspendChild_FuncRefs.mm"
#	include "State_SuspendChild_Internal.mm"
}

void SuspendChild::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_SuspendChild_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_SuspendChild_FuncRefs.mm"
#	include "State_SuspendChild_OnSuspend.mm"
}

void SuspendChild::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_SuspendChild_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_SuspendChild_FuncRefs.mm"
#	include "State_SuspendChild_OnResume.mm"
}
bool SuspendChild::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "ParentMachine_VarRefs.mm"
#	include "State_SuspendChild_VarRefs.mm"
#	include "ParentMachine_FuncRefs.mm"
#	include "State_SuspendChild_FuncRefs.mm"

	return
	(
#		include "State_SuspendChild_Transition_0.expr"
	);
}
