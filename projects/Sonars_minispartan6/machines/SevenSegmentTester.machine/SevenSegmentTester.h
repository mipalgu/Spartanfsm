//
// SevenSegmentTester.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_SevenSegmentTester_
#define clfsm_machine_SevenSegmentTester_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SevenSegmentTester: public CLMachine
        {
            CLState *_states[6];
        public:
            SevenSegmentTester(int mid  = 0, const char *name = "SevenSegmentTester");
            virtual ~SevenSegmentTester();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 6; }
#           include "SevenSegmentTester_Variables.h"
#           include "SevenSegmentTester_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SevenSegmentTester *CLM_Create_SevenSegmentTester(int mid, const char *name);
}

#endif // defined(clfsm_machine_SevenSegmentTester_)
