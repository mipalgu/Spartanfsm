//
// CellularAutomaton.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_machine_CellularAutomaton_
#define clfsm_machine_CellularAutomaton_

#include "CLMachine.h"

namespace FSM
{
    class CLState;

    namespace CLM
    {
        class CellularAutomaton: public CLMachine
        {
            CLState *_states[5];
        public:
            CellularAutomaton(int mid  = 0, const char *name = "CellularAutomaton");
            virtual ~CellularAutomaton();
            virtual CLState * const * states() const { return _states; }
            virtual int numberOfStates() const { return 5; }
#           include "CellularAutomaton_Variables.h"
#           include "CellularAutomaton_Methods.h"
        };
    }
}

extern "C"
{
    FSM::CLM::CellularAutomaton *CLM_Create_CellularAutomaton(int mid, const char *name);
}

#endif // defined(clfsm_machine_CellularAutomaton_)
