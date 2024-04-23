import http from "k6/http";
import { Trend, Rate, Counter } from "k6/metrics";
import { check, sleep } from "k6";

export const TrendRTT = new Trend("RTT");
export const RateContentOK = new Rate("ContentOK");
export const CounterErrors = new Counter("Errors");
export const options = {
  thresholds: {
    http_req_failed: [
      {
        threshold: "rate<0.01",
        abortOnFail: true,
        delayAbortEval: "10s",
      },
    ],

    http_req_duration: [
      {
        threshold: "p(95)<1000",
        abortOnFail: true,
        delayAbortEval: "10s",
      },
    ],
  },
  stages: [
    { duration: "2m", target: 2000 },
    { duration: "1m", target: 0 },
  ],
};

export default function () {
  const res = http.get("https://app.lostops.notmuji.com");
  const contentOk = check(res, { "status was 200": (r) => r.status == 200 });

  TrendRTT.add(res.timings.duration);
  RateContentOK.add(contentOk);
  CounterErrors.add(!contentOk);

  sleep(1);
}
