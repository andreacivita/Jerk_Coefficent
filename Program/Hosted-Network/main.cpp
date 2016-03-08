#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cstring>

using namespace std;

int main()
{
    inizio:
    cout << "=============================" << endl;
    cout << "Gestione reti Wireless hosted" << endl;
    cout << "=============================" << endl;
    cout << "1)Crea nuova rete hosted" << endl;
    cout << "2)Mostra parametri connessione rete hosted (ssid & password)" << endl;
    cout << "3)Avvia rete hosted" << endl;
    cout << "4)Stoppa rete hosted" << endl;
    cout << "5)Mostra IP" << endl;
    int risp;
    cin >> risp;
    if (risp==1){
        cout << "Inserisci nome della rete wireless" << endl;
        string ssid;
        cin >> ssid;
        string password;
        bool cond=true;
        while(cond){
            cout << "Inserisci una password valida (almeno 8 caratteri)" << endl;
            cin >> password;
            if (password.length()>7)
                cond=false;
        }
        string command="netsh wlan set hostednetwork mode=allow ssid=" + string(ssid) + " key=" +string(password)+" keyUsage=persistent";
        system(command.c_str());
        system("netsh wlan start hostednetwork");
        system("pause");
        system("cls");
        goto inizio;
    }
    if (risp==2){
        system("netsh wlan show hostednetwork");
        system("pause");
        system("cls");
        goto inizio;
    }
    if (risp==3){
        system("netsh wlan start hostednetwork");
        system("pause");
        system("cls");
        goto inizio;
    }
    if (risp==4){
        system("netsh wlan stop hostednetwork");
        system("pause");
        system("cls");
        goto inizio;
    }
    if (risp==5){
        system("ipconfig");
        system("pause");
        system("cls");
        goto inizio;
    }


    return 0;
}
