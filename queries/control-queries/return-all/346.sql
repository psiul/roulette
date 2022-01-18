select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,reason r,household_demographics hd,customer_demographics cd
where ws.ws_order_number = wr.wr_order_number and wr.wr_reason_sk = r.r_reason_sk and wr.wr_returning_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 153 and ws.ws_hash <= 553 and hd.hd_hash >= 239 and hd.hd_hash <= 989 and cd.cd_hash >= 448 and cd.cd_hash <= 781
;
