#ifndef ITEM_H
#define ITEM_H

struct Item { 
    double upper; 
    int label; 
};

struct KeyValue {
    char* key;
    char* value;
};

#ifdef __cplusplus
#include <vector>
extern std::vector<Item> records;
extern std::vector<KeyValue> keyvalues;
#else
extern void* records;  /* placeholder for C */
extern void* keyvalues;  /* placeholder for C */
#endif

#endif
