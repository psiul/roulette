select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,customer_demographics cd,warehouse w
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 124 and ws.ws_hash <= 874 and c.c_hash >= 336 and c.c_hash <= 736 and hd.hd_hash >= 666 and hd.hd_hash <= 999
;
