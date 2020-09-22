//
// State_SelectDistance.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SonarReader_State_SelectDistance_h
#define clfsm_SonarReader_State_SelectDistance_h

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
  namespace CLM
  {
    namespace FSMSonarReader
    {
      namespace State
      {
        class SelectDistance: public CLState
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
          
          class OnSuspend: public CLAction
          {
            virtual void perform(CLMachine *, CLState *) const;
          };
          
          class OnResume: public CLAction
          {
            virtual void perform(CLMachine *, CLState *) const;
          };
                          class Transition_0: public CLTransition
                {
                public:
                    Transition_0(int toState = 4): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 6): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_2: public CLTransition
                {
                public:
                    Transition_2(int toState = 7): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[3];

                public:
                    SelectDistance(const char *name = "SelectDistance");
                    virtual ~SelectDistance();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 3; }

#                   include "State_SelectDistance_Variables.h"
#                   include "State_SelectDistance_Methods.h"
            };
        }
      }
    }
}

#endif
