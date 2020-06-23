//
// SonarReader.mm
//
// Automatically created through MiPalCASE -- do not change manually!
//
#include "SonarReader_Includes.h"
#include "SonarReader.h"

#include "State_Initial.h"
#include "State_SUSPENDED.h"
#include "State_ResetDigit.h"
#include "State_InitialPseudoState.h"
#include "State_ConvertDistance1.h"
#include "State_SelectDistance.h"
#include "State_CreateSeparator.h"
#include "State_ConvertDistance2.h"
#include "State_LeastSignificantNibble.h"
#include "State_MiddleNibble.h"
#include "State_MostSignificantNibble.h"
#include "State_CompareDigitSelect.h"
#include "State_WaitForEncoder.h"
#include "State_WaitToFinish.h"
#include "State_EncoderFinished.h"
#include "State_SendToDisplay.h"
#include "State_WaitForDataToSend.h"
#include "State_UpdateDigit.h"

using namespace FSM;
using namespace CLM;

extern "C"
{
	SonarReader *CLM_Create_SonarReader(int mid, const char *name)
	{
		return new SonarReader(mid, name);
	}
}

SonarReader::SonarReader(int mid, const char *name): CLMachine(mid, name)
{
	_states[0] = new FSMSonarReader::State::Initial;
	_states[1] = new FSMSonarReader::State::SUSPENDED;
	_states[2] = new FSMSonarReader::State::ResetDigit;
	_states[3] = new FSMSonarReader::State::InitialPseudoState;
	_states[4] = new FSMSonarReader::State::ConvertDistance1;
	_states[5] = new FSMSonarReader::State::SelectDistance;
	_states[6] = new FSMSonarReader::State::CreateSeparator;
	_states[7] = new FSMSonarReader::State::ConvertDistance2;
	_states[8] = new FSMSonarReader::State::LeastSignificantNibble;
	_states[9] = new FSMSonarReader::State::MiddleNibble;
	_states[10] = new FSMSonarReader::State::MostSignificantNibble;
	_states[11] = new FSMSonarReader::State::CompareDigitSelect;
	_states[12] = new FSMSonarReader::State::WaitForEncoder;
	_states[13] = new FSMSonarReader::State::WaitToFinish;
	_states[14] = new FSMSonarReader::State::EncoderFinished;
	_states[15] = new FSMSonarReader::State::SendToDisplay;
	_states[16] = new FSMSonarReader::State::WaitForDataToSend;
	_states[17] = new FSMSonarReader::State::UpdateDigit;

	setSuspendState(_states[1]);            // set suspend state
	setInitialState(_states[0]);            // set initial state
}

SonarReader::~SonarReader()
{
	delete _states[0];
	delete _states[1];
	delete _states[2];
	delete _states[3];
	delete _states[4];
	delete _states[5];
	delete _states[6];
	delete _states[7];
	delete _states[8];
	delete _states[9];
	delete _states[10];
	delete _states[11];
	delete _states[12];
	delete _states[13];
	delete _states[14];
	delete _states[15];
	delete _states[16];
	delete _states[17];
}
