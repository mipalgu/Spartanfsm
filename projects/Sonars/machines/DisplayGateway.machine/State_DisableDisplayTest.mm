//
// State_DisableDisplayTest.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "DisplayGateway_Includes.h"
#include "DisplayGateway.h"
#include "State_DisableDisplayTest.h"

#include "State_DisableDisplayTest_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMDisplayGateway;
using namespace State;

DisableDisplayTest::DisableDisplayTest(const char *name): CLState(name, *new DisableDisplayTest::OnEntry, *new DisableDisplayTest::OnExit, *new DisableDisplayTest::Internal, NULLPTR, new DisableDisplayTest::OnSuspend, new DisableDisplayTest::OnResume)
{
	_transitions[0] = new Transition_0();
}

DisableDisplayTest::~DisableDisplayTest()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void DisableDisplayTest::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DisableDisplayTest_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DisableDisplayTest_FuncRefs.mm"
#	include "State_DisableDisplayTest_OnEntry.mm"
}
 
void DisableDisplayTest::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DisableDisplayTest_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DisableDisplayTest_FuncRefs.mm"
#	include "State_DisableDisplayTest_OnExit.mm"
}

void DisableDisplayTest::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DisableDisplayTest_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DisableDisplayTest_FuncRefs.mm"
#	include "State_DisableDisplayTest_Internal.mm"
}

void DisableDisplayTest::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DisableDisplayTest_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DisableDisplayTest_FuncRefs.mm"
#	include "State_DisableDisplayTest_OnSuspend.mm"
}

void DisableDisplayTest::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DisableDisplayTest_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DisableDisplayTest_FuncRefs.mm"
#	include "State_DisableDisplayTest_OnResume.mm"
}
bool DisableDisplayTest::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "DisplayGateway_VarRefs.mm"
#	include "State_DisableDisplayTest_VarRefs.mm"
#	include "DisplayGateway_FuncRefs.mm"
#	include "State_DisableDisplayTest_FuncRefs.mm"

	return
	(
#		include "State_DisableDisplayTest_Transition_0.expr"
	);
}
