#include <iostream>
#include <cmath>
#include "SineWave.h"

std::vector<uint8_t> getSamples()
{
    /*TODO: Generate 512 8-bit samples for a Sine Wave*/
    std::vector<uint8_t> ans;
    double val= (2*M_PI)/512;
    double angle=0;
    double senofangel=sin(angle);   
    uint8_t res=127.5*sin(angle)+127.5;
    ans.push_back(res);
    for(int x=0;x<511;x++){
        angle=angle+val;
        res=127.5*sin(angle)+127.5;
        ans.push_back(res);
    }

    return ans;
}
