//
// State_CompareDigitSelect.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SonarReader_State_CompareDigitSelect_h
#define clfsm_SonarReader_State_CompareDigitSelect_h

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
        class CompareDigitSelect: public CLState
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
                    Transition_0(int toState = 8): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 9): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_2: public CLTransition
                {
                public:
                    Transition_2(int toState = 10): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[3];

                public:
                    CompareDigitSelect(const char *name = "CompareDigitSelect");
                    virtual ~CompareDigitSelect();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 3; }

#                   include "State_CompareDigitSelect_Variables.h"
#                   include "State_CompareDigitSelect_Methods.h"
            };
        }
      }
    }
}

#endif
