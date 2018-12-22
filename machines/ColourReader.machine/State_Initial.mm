//
// State_Initial.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "ColourReader_Includes.h"
#include "ColourReader.h"
#include "State_Initial.h"

#include "State_Initial_Includes.h"

using namespace FSM;
using namespace CLM;
using namespace FSMColourReader;
using namespace State;

Initial::Initial(const char *name): CLState(name, *new Initial::OnEntry, *new Initial::OnExit, *new Initial::Internal)
{
}

Initial::~Initial()
{
	delete &onEntryAction();
	delete &onExitAction();
	delete &internalAction();

}

void Initial::OnEntry::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ColourReader_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "ColourReader_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnEntry.mm"
}

void Initial::OnExit::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ColourReader_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "ColourReader_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_OnExit.mm"
}

void Initial::Internal::perform(CLMachine *_machine, CLState *_state) const
{
#	include "ColourReader_VarRefs.mm"
#	include "State_Initial_VarRefs.mm"
#	include "ColourReader_FuncRefs.mm"
#	include "State_Initial_FuncRefs.mm"
#	include "State_Initial_Internal.mm"
}

