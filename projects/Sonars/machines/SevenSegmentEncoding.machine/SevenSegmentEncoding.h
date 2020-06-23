//
// SevenSegmentEncoding.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_SevenSegmentEncoding_
#define clfsm_machine_SevenSegmentEncoding_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SevenSegmentEncoding: public CLMachine
        {
            CLState *_states[16];
        public:
            SevenSegmentEncoding(int mid  = 0, const char *name = "SevenSegmentEncoding");
            virtual ~SevenSegmentEncoding();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 16; }
#           include "SevenSegmentEncoding_Variables.h"
#           include "SevenSegmentEncoding_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SevenSegmentEncoding *CLM_Create_SevenSegmentEncoding(int mid, const char *name);
}

#endif // defined(clfsm_machine_SevenSegmentEncoding_)
