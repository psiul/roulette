select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,warehouse w,household_demographics hd,customer c
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 91 and ws.ws_hash <= 841 and cd.cd_hash >= 528 and cd.cd_hash <= 928 and hd.hd_hash >= 154 and hd.hd_hash <= 487
;
