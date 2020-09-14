//
// State_LightOn.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "SuspensibleHelloWorld_Includes.h"
#include "SuspensibleHelloWorld.h"
#include "State_LightOn.h"

#include "State_LightOn_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSuspensibleHelloWorld;
using namespace State;

LightOn::LightOn(const char *name): CLState(name, *new LightOn::OnEntry, *new LightOn::OnExit, *new LightOn::Internal, NULLPTR, new LightOn::OnSuspend, new LightOn::OnResume)
{
}

LightOn::~LightOn()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
}

void LightOn::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SuspensibleHelloWorld_VarRefs.mm"
#	include "State_LightOn_VarRefs.mm"
#	include "SuspensibleHelloWorld_FuncRefs.mm"
#	include "State_LightOn_FuncRefs.mm"
#	include "State_LightOn_OnEntry.mm"
}
 
void LightOn::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SuspensibleHelloWorld_VarRefs.mm"
#	include "State_LightOn_VarRefs.mm"
#	include "SuspensibleHelloWorld_FuncRefs.mm"
#	include "State_LightOn_FuncRefs.mm"
#	include "State_LightOn_OnExit.mm"
}

void LightOn::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SuspensibleHelloWorld_VarRefs.mm"
#	include "State_LightOn_VarRefs.mm"
#	include "SuspensibleHelloWorld_FuncRefs.mm"
#	include "State_LightOn_FuncRefs.mm"
#	include "State_LightOn_Internal.mm"
}

void LightOn::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SuspensibleHelloWorld_VarRefs.mm"
#	include "State_LightOn_VarRefs.mm"
#	include "SuspensibleHelloWorld_FuncRefs.mm"
#	include "State_LightOn_FuncRefs.mm"
#	include "State_LightOn_OnSuspend.mm"
}

void LightOn::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SuspensibleHelloWorld_VarRefs.mm"
#	include "State_LightOn_VarRefs.mm"
#	include "SuspensibleHelloWorld_FuncRefs.mm"
#	include "State_LightOn_FuncRefs.mm"
#	include "State_LightOn_OnResume.mm"
}
