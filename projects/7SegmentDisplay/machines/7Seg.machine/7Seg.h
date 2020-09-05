//
// 7Seg.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_7Seg_
#define clfsm_machine_7Seg_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class 7Seg: public CLMachine
        {
            CLState *_states[10];
        public:
            7Seg(int mid  = 0, const char *name = "7Seg");
            virtual ~7Seg();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 10; }
#           include "7Seg_Variables.h"
#           include "7Seg_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::7Seg *CLM_Create_7Seg(int mid, const char *name);
}

#endif // defined(clfsm_machine_7Seg_)
