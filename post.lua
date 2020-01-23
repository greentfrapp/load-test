-- example HTTP POST script which demonstrates setting the
-- HTTP method, body, and adding a header

wrk.method = "POST"
wrk.body = os.getenv("POST_BODY")
wrk.headers["Content-Type"] = "application/json"
