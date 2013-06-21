package com.rcuinfomanager;

import junit.framework.Assert;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.ByteArrayBody;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.junit.Test;

import java.io.File;
import java.io.IOException;

public class UploadImgTest {

    @Test
    public void uploadImgTest() throws IOException {
        HttpClient client = new DefaultHttpClient();
        HttpPost post = new HttpPost("http://localhost:8080/api/1/img/234324234");

        MultipartEntity entity = new MultipartEntity();

        entity.addPart("file", new ByteArrayBody("simple test".getBytes(),"test"));
        //entity.addPart("file", new FileBody(new File("d:/1.jpg")));

        post.setEntity(entity);

        HttpResponse response = client.execute(post);
        Assert.assertNotNull(response);
    }
}
