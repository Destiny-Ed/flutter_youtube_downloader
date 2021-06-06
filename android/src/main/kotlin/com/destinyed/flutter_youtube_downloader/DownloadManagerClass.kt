package com.example.tubmate.Constants

import android.app.DownloadManager
import android.content.Context
import android.content.Context.DOWNLOAD_SERVICE
import android.net.Uri
import android.os.Environment
import android.widget.Toast
import androidx.core.content.ContextCompat.getSystemService


class DownloadManagerClass(val ctx: Context) {

    var downloadManager = ctx.getSystemService(DOWNLOAD_SERVICE) as DownloadManager
    private var downloadID: Long? = null

    fun download(nTitle: String, nDescription: String, nUrl: String) {

        try {
            val request = DownloadManager.Request(Uri.parse(nUrl))

            //Setting title of request
            request.setTitle(nTitle)

            //Setting description of request
            request.setDescription(nDescription)

            //set notification when download completed
            request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)

            //Set the local destination for the downloaded file to a path within the application's external files directory
//            request.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, "$nTitle.mp4")
            request.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS,"/" + nTitle + "mp4")
            request.allowScanningByMediaScanner()


            //Enqueue download and save the referenceId
            downloadID = downloadManager.enqueue(request)

            Toast.makeText(ctx, "Video is downloading... Slide down to see progress", Toast.LENGTH_LONG).show()

        } catch (e: IllegalArgumentException) {
            Toast.makeText(ctx, "${e.message} Download link is broken or not available for download", Toast.LENGTH_LONG).show()

        }


    }

}