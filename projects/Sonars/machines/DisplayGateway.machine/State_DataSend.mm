//
// State_DataSend.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_DataSend.h"

#include "State_DataSend_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

DataSend::DataSend(const char *name): CLState(name, *new DataSend::OnEntry, *new DataSend::OnExit, *new DataSend::Internal, NULLPTR, new DataSend::OnSuspend, new DataSend::OnResume)
{
	_transitions[0] = new Transition_0();
}

DataSend::~DataSend()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void DataSend::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DataSend_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DataSend_FuncRefs.mm"
#	include "State_DataSend_OnEntry.mm"
}
 
void DataSend::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DataSend_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DataSend_FuncRefs.mm"
#	include "State_DataSend_OnExit.mm"
}

void DataSend::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DataSend_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DataSend_FuncRefs.mm"
#	include "State_DataSend_Internal.mm"
}

void DataSend::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DataSend_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DataSend_FuncRefs.mm"
#	include "State_DataSend_OnSuspend.mm"
}

void DataSend::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DataSend_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DataSend_FuncRefs.mm"
#	include "State_DataSend_OnResume.mm"
}
bool DataSend::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DataSend_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DataSend_FuncRefs.mm"

	return
	(
#		include "State_DataSend_Transition_0.expr"
	);
}
