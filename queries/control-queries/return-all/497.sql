select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,web_returns wr,customer c,household_demographics hd
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_customer_sk = c.c_customer_sk and wr.wr_returning_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 53 and ws.ws_hash <= 386 and c.c_hash >= 215 and c.c_hash <= 965 and hd.hd_hash >= 389 and hd.hd_hash <= 789
;
