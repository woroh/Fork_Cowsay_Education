<<<<<<< HEAD
#include <iostream>
#include <string>

#include "Parser.hpp"
#include "Field.hpp"

int main(int argc, char *argv[])
{
    Parser parser(argc, argv);
    Field field(parser);
    field.print();
    return 0;
}
=======
#include "Cow.hpp"
#include "Parser.hpp"
#include "Field.hpp"
#include <iostream>

int main(int argc, char* argv[]) {
    Parser parser(argc, argv);

    // Field сам создаёт корову при своём создании
    Field field(parser);

    field.print();

    return 0;
}
>>>>>>> 2950fbd7305ea0124a3df78dad168402eb3c9c25
