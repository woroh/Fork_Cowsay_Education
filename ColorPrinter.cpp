#include "ColorPrinter.hpp"
#include <iostream>

void ColorPrinter::setColor(const std::string& colorName) {
    if (colorName == "red") {
        std::cout << "\033[31m";
    } else if (colorName == "green") {
        std::cout << "\033[32m";
    } else if (colorName == "yellow") {
        std::cout << "\033[33m";
    } else if (colorName == "blue") {
        std::cout << "\033[34m";
    } else if (colorName == "magenta") {
        std::cout << "\033[35m";
    } else if (colorName == "cyan") {
        std::cout << "\033[36m";
    } else if (colorName == "white") {
        std::cout << "\033[37m";
    }
}

void ColorPrinter::resetColor() {
    std::cout << "\033[0m";
}
