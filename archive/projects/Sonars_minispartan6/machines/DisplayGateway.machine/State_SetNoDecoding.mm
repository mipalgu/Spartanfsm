//
// State_SetNoDecoding.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_SetNoDecoding.h"

#include "State_SetNoDecoding_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

SetNoDecoding::SetNoDecoding(const char *name): CLState(name, *new SetNoDecoding::OnEntry, *new SetNoDecoding::OnExit, *new SetNoDecoding::Internal, NULLPTR, new SetNoDecoding::OnSuspend, new SetNoDecoding::OnResume)
{
	_transitions[0] = new Transition_0();
}

SetNoDecoding::~SetNoDecoding()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void SetNoDecoding::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SetNoDecoding_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SetNoDecoding_FuncRefs.mm"
#	include "State_SetNoDecoding_OnEntry.mm"
}
 
void SetNoDecoding::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SetNoDecoding_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SetNoDecoding_FuncRefs.mm"
#	include "State_SetNoDecoding_OnExit.mm"
}

void SetNoDecoding::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SetNoDecoding_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SetNoDecoding_FuncRefs.mm"
#	include "State_SetNoDecoding_Internal.mm"
}

void SetNoDecoding::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SetNoDecoding_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SetNoDecoding_FuncRefs.mm"
#	include "State_SetNoDecoding_OnSuspend.mm"
}

void SetNoDecoding::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SetNoDecoding_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SetNoDecoding_FuncRefs.mm"
#	include "State_SetNoDecoding_OnResume.mm"
}
bool SetNoDecoding::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SetNoDecoding_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SetNoDecoding_FuncRefs.mm"

	return
	(
#		include "State_SetNoDecoding_Transition_0.expr"
	);
}
