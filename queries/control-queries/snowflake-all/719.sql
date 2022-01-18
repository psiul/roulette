select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer_demographics cd,household_demographics hd,customer c
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 53 and ws.ws_hash <= 386 and cd.cd_hash >= 365 and cd.cd_hash <= 765 and c.c_hash >= 134 and c.c_hash <= 884
;
