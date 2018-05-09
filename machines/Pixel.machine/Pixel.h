//
// Pixel.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_Pixel_
#define clfsm_machine_Pixel_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class Pixel: public CLMachine
        {
            CLState *_states[4];
        public:
            Pixel(int mid  = 0, const char *name = "Pixel");
            virtual ~Pixel();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 4; }
#           include "Pixel_Variables.h"
#           include "Pixel_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::Pixel *CLM_Create_Pixel(int mid, const char *name);
}

#endif // defined(clfsm_machine_Pixel_)
