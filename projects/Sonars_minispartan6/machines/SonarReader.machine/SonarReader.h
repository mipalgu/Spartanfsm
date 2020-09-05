//
// SonarReader.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_SonarReader_
#define clfsm_machine_SonarReader_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class SonarReader: public CLMachine
        {
            CLState *_states[20];
        public:
            SonarReader(int mid  = 0, const char *name = "SonarReader");
            virtual ~SonarReader();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 20; }
#           include "SonarReader_Variables.h"
#           include "SonarReader_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::SonarReader *CLM_Create_SonarReader(int mid, const char *name);
}

#endif // defined(clfsm_machine_SonarReader_)
