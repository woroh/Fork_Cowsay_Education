#include "Cow.hpp"
#include <filesystem>
#include <string>
#include <iostream>
using std::cout;
using std::endl;
static std::string findpath(const std::string& subdir, const std::string& filename){
	std::string syspath="/usr/share/cowsay/"+subdir+"/"+filename;
	if (std::filesystem::exists(syspath))
		return syspath;
	std::string localpath="./"+subdir+"/"+filename;
	return localpath;
}
Cow::Cow(string tongue, string fname) : ASCIIPicture(findpath("cows", fname + ".cow")), tongue(tongue)
{
}

Cow::~Cow() {}

void Cow::print(unsigned int left, char fill, unsigned int width)
{
    unsigned int cowWidth = getWidth();
    for (int i = 0; i < picture.size(); i++)
    {
        for (int j = 0; j < width - cowWidth - left; j++)
            cout << fill;
        for (int j = 0; j < picture[i].size(); j++)
            // *.cow file must include a $t substring which
            // will be replaced with given tongue chars
            if (j+1 < picture[i].size() && picture[i][j] == '$'
                && picture[i][j+1] == 't')
            {
                cout << tongue;
                j++;
            }
            else 
            {
                cout << picture[i][j];
            }

        for (int j = width - cowWidth - left + picture[i].size(); j < width; j++)
            cout << fill;
        cout << endl;
    }
    for (int i = 0; i < width; i++)
        cout << fill;
    cout << endl;
}
