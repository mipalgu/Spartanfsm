//
// State_SetupVarsForEncoding.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SixteenBitBinaryToBCDEncoder_Includes.h"
#include "SixteenBitBinaryToBCDEncoder.h"
#include "State_SetupVarsForEncoding.h"

#include "State_SetupVarsForEncoding_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMSixteenBitBinaryToBCDEncoder;
using namespace State;

SetupVarsForEncoding::SetupVarsForEncoding(const char *name): CLState(name, *new SetupVarsForEncoding::OnEntry, *new SetupVarsForEncoding::OnExit, *new SetupVarsForEncoding::Internal)
{
	_transitions[0] = new Transition_0();
}

SetupVarsForEncoding::~SetupVarsForEncoding()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

	delete _transitions[0];
}

void SetupVarsForEncoding::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetupVarsForEncoding_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_OnEntry.mm"
}

void SetupVarsForEncoding::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetupVarsForEncoding_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_OnExit.mm"
}

void SetupVarsForEncoding::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetupVarsForEncoding_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_Internal.mm"
}

bool SetupVarsForEncoding::Transition_0::check(CLMachine *_machine, CLState *_state) const
{
#	include "SixteenBitBinaryToBCDEncoder_VarRefs.mm"
#	include "State_SetupVarsForEncoding_VarRefs.mm"
#	include "SixteenBitBinaryToBCDEncoder_FuncRefs.mm"
#	include "State_SetupVarsForEncoding_FuncRefs.mm"

	return
	(
#		include "State_SetupVarsForEncoding_Transition_0.expr"
	);
}
