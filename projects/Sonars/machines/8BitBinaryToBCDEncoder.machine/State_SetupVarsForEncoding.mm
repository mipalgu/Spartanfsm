//
// State_SetupVarsForEncoding.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "8BitBinaryToBCDEncoder_Includes.h"
#include "8BitBinaryToBCDEncoder.h"
#include "State_SetupVarsForEncoding.h"

#include "State_SetupVarsForEncoding_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSM8BitBinaryToBCDEncoder;
using namespace State;

SetupVarsForEncoding::SetupVarsForEncoding(const char *name): CLState(name, *new SetupVarsForEncoding::OnEntry, *new SetupVarsForEncoding::OnExit, *new SetupVarsForEncoding::Internal, NULLPTR, new SetupVarsForEncoding::OnSuspend, new SetupVarsForEncoding::OnResume)
{
	_transitions[0] = new Transition_0();
}

SetupVarsForEncoding::~SetupVarsForEncoding()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();
	delete onSuspendAction();
	delete onResumeAction();
	delete _transitions[0];
}

void SetupVarsForEncoding::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetupVarsForEncoding_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_OnEntry.mm"
}
 
void SetupVarsForEncoding::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetupVarsForEncoding_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_OnExit.mm"
}

void SetupVarsForEncoding::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetupVarsForEncoding_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_Internal.mm"
}

void SetupVarsForEncoding::OnSuspend::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetupVarsForEncoding_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_OnSuspend.mm"
}

void SetupVarsForEncoding::OnResume::perform(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetupVarsForEncoding_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_OnResume.mm"
}
bool SetupVarsForEncoding::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "8BitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetupVarsForEncoding_VarRefs.mm"
#	include "8BitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_FuncRefs.mm"

	return
	(
#		include "State_SetupVarsForEncoding_Transition_0.expr"
	);
}
