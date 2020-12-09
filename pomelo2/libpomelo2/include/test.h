//
//  test.h
//  pomelo2
//
//  Created by 谢华 on 12/4/20.
//  Copyright © 2020 谢华. All rights reserved.
//

#ifndef test_h
#define test_h


#include <stdlib.h>

#define PC_TEST_ASSERT(expr)                                          \
    do {                                                         \
        if (!(expr)) {                                           \
            fprintf(stderr,                                      \
                    "Assertion failed in %s on line %d: %s\n",   \
                    __FILE__,                                    \
                    __LINE__,                                    \
                    #expr);                                      \
            abort();                                             \
        }                                                        \
    } while (0)


#endif /* test_h */
