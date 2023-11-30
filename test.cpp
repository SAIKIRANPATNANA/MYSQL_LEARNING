#include <iostream>
#include <vector>
#include <list>
#include <algorithm>
using namespace std;
vector <list<int>> graph;
vector <int> flag;
void add_to_graph(int src, int destiny){
    graph[src].push_back(destiny);
    graph[destiny].push_back(src);
}int checkCycle(int src, int parent,vector <int> trace){
    if(!flag[src] and find(trace.begin(),trace.end(),src)!=trace.end()){
        return 1;
    }flag[src] = 0;
    int ans = 0;
    trace.push_back(src);
    for(auto val: graph[src]){
        if(parent!=val){
            ans = checkCycle(val,src,trace);
        }if(ans){
            break;
        }
    }return ans;
}int main(){
    int e,src,destiny;
    cin>>e;
    graph.resize(e+1);
    flag.resize(e+1,1);
    vector <int> trace;
    while(e--){
        cin>>src>>destiny;
        add_to_graph(src,destiny);
    }cout<<checkCycle(0,0,trace);
    return 0;
}



