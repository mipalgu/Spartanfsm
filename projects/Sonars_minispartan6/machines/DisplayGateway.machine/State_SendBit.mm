//
// State_SendBit.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_SendBit.h"

#include "State_SendBit_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

SendBit::SendBit(const char *name): CLState(name, *new SendBit::OnEntry, *new SendBit::OnExit, *new SendBit::Internal, NULLPTR, new SendBit::OnSuspend, new SendBit::OnResume)
{
	_transitions[0] = new Transition_0();
}

SendBit::~SendBit()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void SendBit::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SendBit_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SendBit_FuncRefs.mm"
#	include "State_SendBit_OnEntry.mm"
}
 
void SendBit::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SendBit_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SendBit_FuncRefs.mm"
#	include "State_SendBit_OnExit.mm"
}

void SendBit::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SendBit_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SendBit_FuncRefs.mm"
#	include "State_SendBit_Internal.mm"
}

void SendBit::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SendBit_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SendBit_FuncRefs.mm"
#	include "State_SendBit_OnSuspend.mm"
}

void SendBit::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SendBit_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SendBit_FuncRefs.mm"
#	include "State_SendBit_OnResume.mm"
}
bool SendBit::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_SendBit_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_SendBit_FuncRefs.mm"

	return
	(
#		include "State_SendBit_Transition_0.expr"
	);
}
