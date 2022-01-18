select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,customer c,household_demographics hd,customer_demographics cd
where ws.ws_order_number = wr.wr_order_number and ws.ws_bill_customer_sk = c.c_customer_sk and wr.wr_returning_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 61 and ws.ws_hash <= 461 and hd.hd_hash >= 54 and hd.hd_hash <= 804 and cd.cd_hash >= 396 and cd.cd_hash <= 729
;
