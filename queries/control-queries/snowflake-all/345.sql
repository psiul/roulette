select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer_demographics cd,customer c,household_demographics hd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 24 and cd.cd_hash <= 774 and c.c_hash >= 438 and c.c_hash <= 838 and hd.hd_hash >= 644 and hd.hd_hash <= 977
;
