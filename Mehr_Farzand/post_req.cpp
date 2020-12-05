#include "post_req.h"
#include <QQmlEngine>
#include <QQmlContext>
#include <QtQuick/QQuickImageProvider>
#include <QDebug>
#include <QFileInfo>


POST_REQ::POST_REQ()
{

}

void POST_REQ::upload(const QString &firstN,const QString &lastN,const QString& dateTime,const QString &addr,const QString &contactn,const QString &lat, const QString &lon)
{
    //==================================
    qDebug()<< lat << lon << dateTime;//  << pathImage;


    //=========================

    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);

    //firstname
    QHttpPart firstname1;
    //latitude.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("text/plain"));
    firstname1.setHeader(QNetworkRequest::ContentDispositionHeader,
                       QVariant("form-data; name=\"firstname\""));
    firstname1.setBody(firstN.toUtf8());

    //lastname
    QHttpPart lastname1;
    //latitude.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("text/plain"));
    lastname1.setHeader(QNetworkRequest::ContentDispositionHeader,
                       QVariant("form-data; name=\"lastname\""));
    lastname1.setBody(lastN.toUtf8());

    //date of birth
    QHttpPart date;
    //date.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("text/plain"));
    date.setHeader(QNetworkRequest::ContentDispositionHeader,  QVariant("form-data; name=\"date_of_birth\""));
    date.setBody(dateTime.toUtf8());

    //address1
    QHttpPart address1;
    //latitude.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("text/plain"));
    address1.setHeader(QNetworkRequest::ContentDispositionHeader,
                       QVariant("form-data; name=\"address\""));
    address1.setBody(addr.toUtf8());

    //contact_number
    QHttpPart contact_number1;
    //latitude.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("text/plain"));
    contact_number1.setHeader(QNetworkRequest::ContentDispositionHeader,
                       QVariant("form-data; name=\"contact_number\""));
    contact_number1.setBody(contactn.toUtf8());

    //lat
    QHttpPart latitude;
    //latitude.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("text/plain"));
    latitude.setHeader(QNetworkRequest::ContentDispositionHeader,
                       QVariant("form-data; name=\"lat\""));
    latitude.setBody(lat.toUtf8());

    //lon
    QHttpPart longitude;
    //longitude.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("text/plain"));
    longitude.setHeader(QNetworkRequest::ContentDispositionHeader,
                        QVariant("form-data; name=\"longt\""));
    longitude.setBody(lon.toUtf8());

    multiPart->append(firstname1);
    multiPart->append(lastname1);
    multiPart->append(date);
    multiPart->append(address1);
    multiPart->append(contact_number1);
    multiPart->append(latitude);
    multiPart->append(longitude);



    QUrl url("http://192.168.0.105:5000/add");
    QNetworkRequest request(url);
    QNetworkAccessManager *networkManager= new QNetworkAccessManager;
    QNetworkReply *reply = networkManager->post(request,multiPart);
    multiPart->setParent(reply);


    connect(networkManager,SIGNAL(finished(QNetworkReply*)),this,SLOT(replyfinished(QNetworkReply*)));
    connect(reply, SIGNAL(uploadProgress(qint64, qint64)),
            this, SLOT  (uploadProgress(qint64, qint64)));
}

void POST_REQ::uploadProgress(qint64 bytesSent, qint64 bytesTotal)
{
    qDebug() << "---------Uploaded--------------" << bytesSent<< "of" <<bytesTotal;
}

void POST_REQ::replyfinished(QNetworkReply* reply1)
{
    qDebug() << QString(reply1->readAll());
    qDebug() << QString(reply1->errorString());
}
