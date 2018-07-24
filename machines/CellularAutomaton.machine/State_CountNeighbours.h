//
// State_CountNeighbours.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_CellularAutomaton_State_CountNeighbours_h
#define clfsm_CellularAutomaton_State_CountNeighbours_h

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
            class CountNeighbours: public CLState
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
                    Transition_0(int toState = 1): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 1): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_2: public CLTransition
                {
                public:
                    Transition_2(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[3];

                public:
                    CountNeighbours(const char *name = "CountNeighbours");
                    virtual ~CountNeighbours();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 3; }

#                   include "State_CountNeighbours_Variables.h"
#                   include "State_CountNeighbours_Methods.h"
            };
        }
      }
    }
}

#endif
