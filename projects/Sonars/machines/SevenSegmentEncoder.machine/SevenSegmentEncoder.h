//
// SevenSegmentEncoder.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_SevenSegmentEncoder_
#define clfsm_machine_SevenSegmentEncoder_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SevenSegmentEncoder: public CLMachine
        {
            CLState *_states[17];
        public:
            SevenSegmentEncoder(int mid  = 0, const char *name = "SevenSegmentEncoder");
            virtual ~SevenSegmentEncoder();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 17; }
#           include "SevenSegmentEncoder_Variables.h"
#           include "SevenSegmentEncoder_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SevenSegmentEncoder *CLM_Create_SevenSegmentEncoder(int mid, const char *name);
}

#endif // defined(clfsm_machine_SevenSegmentEncoder_)
