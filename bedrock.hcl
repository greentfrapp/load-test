version = "1.0"

train {
    step wrk2 {
        image = "bootjp/wrk2"
        script = [
            {sh = [
                "wrk -U -t $THREAD -c $CONNECTIONS -R $THROUGHPUT -d $RUN_TIME -s post.lua $ENDPOINT_URL || true"
            ]}
        ]
    }

    parameters {
        ENDPOINT_URL = "https://"
        THREAD = "4"
        CONNECTIONS = "16"
        THROUGHPUT = "1000"
        RUN_TIME = "5m"
    }

    secrets = [
        "DUMMY_SECRET_A",
        "DUMMY_SECRET_B"
    ]
}
