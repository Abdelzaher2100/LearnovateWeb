package com.paypal.orders;

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

public class OrdersCaptureTest extends TestHarness {

    @Test(enabled = false)
    public void testOrdersCaptureRequest() throws IOException {
        String orderId = "";
        OrdersCaptureRequest request = new OrdersCaptureRequest(orderId);

        HttpResponse<Order> response = client().execute(request);
        assertEquals(response.statusCode(), 200);
        assertNotNull(response.result());
        Order order = response.result();
        assertEquals(order.id(), orderId);
        assertEquals(order.status(), "COMPLETED");
    }
}
