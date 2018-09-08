/***
Pix  Copyright (C) 2018  Camilo Higuita
This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
This is free software, and you are welcome to redistribute it
under certain conditions; type `show c' for details.

 This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
***/

#include "kdeconnect.h"
#include <QProcess>

KdeConnect::KdeConnect(QObject *parent) : QObject(parent)
{
}

QVariantList KdeConnect::getDevices()
{
    QVariantList devices;

    QProcess process;
    process.start("kdeconnect-cli -a");
    process.waitForFinished();
    // auto output = process->readAllStandardOutput();

    process.setReadChannel(QProcess::StandardOutput);

    while (process.canReadLine())
    {
        QString line = QString::fromLocal8Bit(process.readLine());
        if(line.contains("(paired and reachable)"))
        {
            QVariantMap _devices;
            QStringList items = line.split(" ");
            auto serviceKey = QString(items.at(2));
            auto serviceLabel = QString(items.at(1)).replace(":","");

            _devices.insert("serviceKey", serviceKey);
            _devices.insert("label", serviceLabel);

            devices.append(_devices);
        }
    }

    return  devices;
}

bool KdeConnect::sendToDevice(const QString &device, const QString &id, const QString &url)
{
    QString deviceName = device;
    QString deviceKey = id;

    auto process = new QProcess();
    connect(process, static_cast<void(QProcess::*)(int, QProcess::ExitStatus)>(&QProcess::finished),
            [=](int exitCode, QProcess::ExitStatus exitStatus)
    {
        //        BabeWindow::nof->notify("Song sent to " + deviceName,title +" by "+ artist);
//        process->deleteLater();
    });

    process->start("kdeconnect-cli -d " +deviceKey+ " --share " +"\""+ url+"\"");

    return true;
}
