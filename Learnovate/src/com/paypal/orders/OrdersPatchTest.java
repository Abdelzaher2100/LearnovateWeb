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

import static org.testng.Assert.*;

public class OrdersPatchTest extends TestHarness {
    private List<Patch> buildRequestBody() throws IOException {
        List<Patch> patches = new ArrayList<>();
        patches.add(new Patch()
                        .op("add")
                        .path("/purchase_units/@reference_id=='test_ref_id1'/description")
                        .value("added_description"));
        patches.add(new Patch()
                        .op("replace")
                        .path("/purchase_units/@reference_id=='test_ref_id1'/amount")
                        .value(new AmountWithBreakdown()
                                .currencyCode("USD")
                                .value("200.00")));
        return patches;
    }

    @Test
    public void testOrdersPatchRequest() throws IOException {
        Order order = OrdersCreateTest.createOrder(client());
        OrdersPatchRequest request = new OrdersPatchRequest(order.id());
        request.requestBody(buildRequestBody());
        HttpResponse<Void> response = client().execute(request);
        assertEquals(response.statusCode(), 204);

        OrdersGetRequest getRequest = new OrdersGetRequest(order.id());

        HttpResponse<Order> getResponse = client().execute(getRequest);
        assertEquals(getResponse.statusCode(), 200);
        assertNotNull(getResponse.result());

        order = getResponse.result();

        assertNotNull(order.id());

        assertEquals(order.checkoutPaymentIntent(), "CAPTURE");

        assertNotNull(order.purchaseUnits());
        assertEquals(order.purchaseUnits().size(), 1);
        PurchaseUnit firstPurchaseUnit = order.purchaseUnits().get(0);
        assertEquals(firstPurchaseUnit.referenceId(), "test_ref_id1");
        assertEquals(firstPurchaseUnit.amountWithBreakdown().currencyCode(), "USD");
        assertEquals(firstPurchaseUnit.amountWithBreakdown().value(), "200.00");
        assertEquals(firstPurchaseUnit.description(), "added_description");


        assertNotNull(order.createTime());

        assertNotNull(order.links());
        boolean foundApprovalURL = false;
        for (LinkDescription linkDescription :order.links()) {
            if ("approve".equals(linkDescription.rel())) {
                foundApprovalURL = true;
                assertNotNull(linkDescription.href());
                assertEquals(linkDescription.method(), "GET");
            }
        }
        assertTrue(foundApprovalURL);

        assertEquals(order.status(), "CREATED");

    }
}
