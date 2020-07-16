version = "1.0"

train {
    step wrk2 {
        image = "bootjp/wrk2"
        script = [
            {sh = [
                "wrk -U -t $THREAD -c $CONNECTIONS -R $THROUGHPUT -d $RUN_TIME -s post.lua $ENDPOINT_URL || true"
            ]}
        ]

        resources {
            cpu = "2G"
            memory = "2G"
        }
    }

    parameters {
        ENDPOINT_URL = "https://still-bar-9470.playground.bdrk.ai"
        POST_BODY = "{"State": "ME", "Area_Code": 408, "Intl_Plan": 1, "VMail_Plan": 1, "VMail_Message": 21, "CustServ_Calls": 4, "Day_Mins": 156.5, "Day_Calls": 122, "Eve_Mins": 209.2, "Eve_Calls": 125, "Night_Mins": 158.7, "Night_Calls": 81, "Intl_Mins": 11.1, "Intl_Calls": 3}"
        THREAD = "4"
        CONNECTIONS = "8"
        THROUGHPUT = "1000"
        RUN_TIME = "5m"
    }
}
