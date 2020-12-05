import QtQuick 2.0
import QtMultimedia 5.12

Item {
    Camera {
        id: camera
        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash
        captureMode: Camera.CaptureStillImage

        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }

        flash.mode: Camera.FlashRedEyeReduction

        imageCapture {
            id: imageSaved
            onImageSaved:  {

                //photoPreview.source = preview
                photoString=path
                //demo.processImage(preview);
            }
        }
    }

    VideoOutput {
        source: camera
        //anchors.fill: parent
        //focus : visible // to receive focus and capture key events when visible
    }

}
