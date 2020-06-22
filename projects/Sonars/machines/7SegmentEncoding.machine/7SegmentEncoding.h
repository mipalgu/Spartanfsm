//
// 7SegmentEncoding.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_7SegmentEncoding_
#define clfsm_machine_7SegmentEncoding_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class 7SegmentEncoding: public CLMachine
        {
            CLState *_states[16];
        public:
            7SegmentEncoding(int mid  = 0, const char *name = "7SegmentEncoding");
            virtual ~7SegmentEncoding();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 16; }
#           include "7SegmentEncoding_Variables.h"
#           include "7SegmentEncoding_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::7SegmentEncoding *CLM_Create_7SegmentEncoding(int mid, const char *name);
}

#endif // defined(clfsm_machine_7SegmentEncoding_)
