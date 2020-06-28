package com.paypal.payments;

import com.paypal.http.HttpResponse;
import com.paypal.http.HttpClient;
import com.paypal.http.serializer.Json;
import com.paypal.TestHarness;
import java.io.File;
import java.nio.file.Paths;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import org.testng.annotations.Test;

import java.io.IOException;

import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertNotNull;
import static org.testng.Assert.fail;

public class AuthorizationsGetTest extends TestHarness {

    @Test(enabled=false)
    public void testAuthorizationsGetRequest() throws IOException {
        AuthorizationsGetRequest request = new AuthorizationsGetRequest("AUTHORIZATION-ID");

        HttpResponse<Authorization> response = client().execute(request);
        assertEquals(response.statusCode(), 200);
        assertNotNull(response.result());
    }
}
