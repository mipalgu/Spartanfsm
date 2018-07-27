//
// State_Initial.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_CellularAutomaton_State_Initial_h
#define clfsm_CellularAutomaton_State_Initial_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMCellularAutomaton
      {
        namespace State
        {
            class Initial: public CLState
            {
                class OnEntry: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class OnExit: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class Internal: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wzero-length-array"
                CLTransition *_transitions[0];
#pragma clang diagnostic pop


                public:
                    Initial(const char *name = "Initial");
                    virtual ~Initial();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_Initial_Variables.h"
#                   include "State_Initial_Methods.h"
            };
        }
      }
    }
}

#endif
