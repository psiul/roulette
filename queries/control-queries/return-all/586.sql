select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,customer c,household_demographics hd,reason r
where ws.ws_order_number = wr.wr_order_number and wr.wr_refunded_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and wr.wr_reason_sk = r.r_reason_sk and ws.ws_hash >= 142 and ws.ws_hash <= 542 and c.c_hash >= 204 and c.c_hash <= 954 and hd.hd_hash >= 172 and hd.hd_hash <= 505
;
