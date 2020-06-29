//
// State_SendData.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SevenSegmentTester_Includes.h"
#include "SevenSegmentTester.h"
#include "State_SendData.h"

#include "State_SendData_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSevenSegmentTester;
using namespace State;

SendData::SendData(const char *name): CLState(name, *new SendData::OnEntry, *new SendData::OnExit, *new SendData::Internal, NULLPTR, new SendData::OnSuspend, new SendData::OnResume)
{
	_transitions[0] = new Transition_0();
}

SendData::~SendData()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void SendData::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_SendData_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_SendData_FuncRefs.mm"
#	include "State_SendData_OnEntry.mm"
}
 
void SendData::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_SendData_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_SendData_FuncRefs.mm"
#	include "State_SendData_OnExit.mm"
}

void SendData::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_SendData_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_SendData_FuncRefs.mm"
#	include "State_SendData_Internal.mm"
}

void SendData::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_SendData_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_SendData_FuncRefs.mm"
#	include "State_SendData_OnSuspend.mm"
}

void SendData::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_SendData_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_SendData_FuncRefs.mm"
#	include "State_SendData_OnResume.mm"
}
bool SendData::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SevenSegmentTester_VarRefs.mm"
#	include "State_SendData_VarRefs.mm"
#	include "SevenSegmentTester_FuncRefs.mm"
#	include "State_SendData_FuncRefs.mm"

	return
	(
#		include "State_SendData_Transition_0.expr"
	);
}
