#ifndef COLORPRINTER_HPP
#define COLORPRINTER_HPP

#include <string>

class ColorPrinter {
public:
    static void setColor(const std::string& colorName);
    static void resetColor();
};

#endif
