//
// State_Reset.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "8BitBinaryToBCDEncoder_Includes.h"
#include "8BitBinaryToBCDEncoder.h"
#include "State_Reset.h"

#include "State_Reset_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM8BitBinaryToBCDEncoder;
using namespace State;

Reset::Reset(const char *name): CLState(name, *new Reset::OnEntry, *new Reset::OnExit, *new Reset::Internal, NULLPTR, new Reset::OnSuspend, new Reset::OnResume)
{
	_transitions[0] = new Transition_0();
}

Reset::~Reset()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void Reset::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_Reset_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_Reset_FuncRefs.mm"
#	include "State_Reset_OnEntry.mm"
}
 
void Reset::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_Reset_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_Reset_FuncRefs.mm"
#	include "State_Reset_OnExit.mm"
}

void Reset::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_Reset_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_Reset_FuncRefs.mm"
#	include "State_Reset_Internal.mm"
}

void Reset::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_Reset_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_Reset_FuncRefs.mm"
#	include "State_Reset_OnSuspend.mm"
}

void Reset::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_Reset_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_Reset_FuncRefs.mm"
#	include "State_Reset_OnResume.mm"
}
bool Reset::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_Reset_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_Reset_FuncRefs.mm"

	return
	(
#		include "State_Reset_Transition_0.expr"
	);
}
