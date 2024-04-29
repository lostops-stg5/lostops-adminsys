import http from "k6/http";
import { Trend, Rate, Counter } from "k6/metrics";
import { check, sleep } from "k6";

export const TrendRTT = new Trend("RTT");
export const RateConnectOk = new Rate("ContentOK");
export const CounterErrors = new Counter("Errors");

export const options = {
  stages: [
    { duration: "4m", target: 10 },
    { duration: "1m", target: 0 },
  ],
};

export default function () {
  const res = http.get("https://app.lostops.notmuji.com/toto");
  const connectOk = check(res, { "status was 404": (r) => r.status == 404 });

  TrendRTT.add(res.timings.duration);
  RateConnectOk.add(connectOk);
  CounterErrors.add(!connectOk);

  sleep(1);
}
