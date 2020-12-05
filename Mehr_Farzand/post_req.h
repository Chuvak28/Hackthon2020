#ifndef POST_REQ_H
#define POST_REQ_H

#include <QObject>
#include <QNetworkReply>
#include <QHttpMultiPart>
#include <QFile>
#include <QNetworkAccessManager>
#include <QQuickImageProvider>

class POST_REQ : public QObject//, public QQuickImageProvider
{
    Q_OBJECT
public:
    POST_REQ();
    Q_INVOKABLE void upload(const QString &firstN,const QString &lastN,const QString &addr,const QString &contactn,const QString& dateTime,const QString &lat, const QString &lon);
    //Q_INVOKABLE void processImage(const QString& path);


private slots:
   void replyfinished(QNetworkReply* reply);
   void uploadProgress(qint64 bytesSent, qint64 bytesTotal);
};

#endif // POST_REQ_H
