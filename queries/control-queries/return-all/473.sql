select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,warehouse w,customer_demographics cd
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 66 and ws.ws_hash <= 399 and c.c_hash >= 76 and c.c_hash <= 826 and hd.hd_hash >= 270 and hd.hd_hash <= 670
;
