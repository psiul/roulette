select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer_demographics cd,customer c,web_returns wr
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 609 and ws.ws_hash <= 942 and hd.hd_hash >= 99 and hd.hd_hash <= 849 and c.c_hash >= 455 and c.c_hash <= 855
;
