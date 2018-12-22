//
// ColourReader.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_ColourReader_
#define clfsm_machine_ColourReader_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class ColourReader: public CLMachine
        {
            CLState *_states[1];
        public:
            ColourReader(int mid  = 0, const char *name = "ColourReader");
            virtual ~ColourReader();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 1; }
#           include "ColourReader_Variables.h"
#           include "ColourReader_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::ColourReader *CLM_Create_ColourReader(int mid, const char *name);
}

#endif // defined(clfsm_machine_ColourReader_)
