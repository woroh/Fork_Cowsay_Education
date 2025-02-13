#ifndef FIELD_H
#define FIELD_H

#include <string>
using std::string;

#include "Cow.hpp"
#include "Cloud.hpp"
class Parser;

class Field {

    Cow cow;
    Cloud cloud;
    char sun;
    char fill; 
    string message;
    string tongue;


public:

    Field(Parser& parser);
    ~Field();

    void print();

};

#endif
