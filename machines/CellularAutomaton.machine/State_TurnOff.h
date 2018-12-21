//
// State_TurnOff.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_CellularAutomaton_State_TurnOff_h
#define clfsm_CellularAutomaton_State_TurnOff_h

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
            class TurnOff: public CLState
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

                class Transition_0: public CLTransition
                {
                public:
                    Transition_0(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    TurnOff(const char *name = "TurnOff");
                    virtual ~TurnOff();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_TurnOff_Variables.h"
#                   include "State_TurnOff_Methods.h"
            };
        }
      }
    }
}

#endif
