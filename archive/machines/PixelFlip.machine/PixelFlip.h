//
// PixelFlip.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_machine_PixelFlip_
#define clfsm_machine_PixelFlip_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class PixelFlip: public CLMachine
        {
            CLState *_states[5];
        public:
            PixelFlip(int mid  = 0, const char *name = "PixelFlip");
            virtual ~PixelFlip();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "PixelFlip_Variables.h"
#           include "PixelFlip_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::PixelFlip *CLM_Create_PixelFlip(int mid, const char *name);
}

#endif // defined(clfsm_machine_PixelFlip_)
