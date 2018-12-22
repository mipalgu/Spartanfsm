//
// ColourReader.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "ColourReader_Includes.h"
#include "ColourReader.h"

#include "State_Initial.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	ColourReader *CLM_Create_ColourReader(int mid, const char *name)
	{
		return new ColourReader(mid, name);
	}
}

ColourReader::ColourReader(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMColourReader::State::Initial;

	setInitialState(_states[0]);            // set initial state
}

ColourReader::~ColourReader()
{
	delete _states[0];
}
