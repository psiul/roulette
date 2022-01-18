select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,warehouse w,customer_demographics cd,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 130 and ws.ws_hash <= 880 and hd.hd_hash >= 208 and hd.hd_hash <= 608 and c.c_hash >= 264 and c.c_hash <= 597
;
