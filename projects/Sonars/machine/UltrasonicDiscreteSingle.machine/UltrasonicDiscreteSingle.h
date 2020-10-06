//
// UltrasonicDiscreteSingle.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_UltrasonicDiscreteSingle_
#define clfsm_machine_UltrasonicDiscreteSingle_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class UltrasonicDiscreteSingle: public CLMachine
        {
            CLState *_states[10];
        public:
            UltrasonicDiscreteSingle(int mid  = 0, const char *name = "UltrasonicDiscreteSingle");
            virtual ~UltrasonicDiscreteSingle();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 10; }
#           include "UltrasonicDiscreteSingle_Variables.h"
#           include "UltrasonicDiscreteSingle_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::UltrasonicDiscreteSingle *CLM_Create_UltrasonicDiscreteSingle(int mid, const char *name);
}

#endif // defined(clfsm_machine_UltrasonicDiscreteSingle_)
