select count(ws.ws_item_sk)
from web_sales ws,customer c,warehouse w,customer_demographics cd,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 188 and ws.ws_hash <= 938 and c.c_hash >= 295 and c.c_hash <= 695 and cd.cd_hash >= 202 and cd.cd_hash <= 535
;
