select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,customer c,household_demographics hd,customer_demographics cd
where ws.ws_order_number = wr.wr_order_number and ws.ws_bill_customer_sk = c.c_customer_sk and wr.wr_returning_hdemo_sk = hd.hd_demo_sk and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 298 and ws.ws_hash <= 698 and c.c_hash >= 54 and c.c_hash <= 804 and hd.hd_hash >= 203 and hd.hd_hash <= 536
;
