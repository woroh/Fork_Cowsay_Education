#include <iostream>
#include <string>

#include "Parser.hpp"
#include "Field.hpp"
#include "ColorPrinter.hpp"

int main(int argc, char *argv[]) {
    Parser parser(argc, argv);

    std::string color = parser.getColor();
    if (!color.empty()) {
        ColorPrinter::setColor(color);
    }

    Field field(parser);
    field.print();

    if (!color.empty()) {
        ColorPrinter::resetColor();
    }

    return 0;
}
