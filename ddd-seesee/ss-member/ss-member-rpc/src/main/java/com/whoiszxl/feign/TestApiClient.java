package com.whoiszxl.feign;

import com.whoiszxl.api.TestApi;
import com.whoiszxl.config.OAuth2FeignConfig;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;

@FeignClient(
        name = "ss-member",
        contextId = "TestApiClient",
        fallback = TestApiClient.AccessFallback.class,
        configuration = OAuth2FeignConfig.class
)
public interface TestApiClient extends TestApi {

    @Component
    class AccessFallback implements TestApiClient {

        @Override
        public String getById(String id) {
            return "fallback";
        }
    }
}
