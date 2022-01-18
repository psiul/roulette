select count(ws.ws_item_sk)
from web_sales ws,item i,warehouse w,household_demographics hd,customer c
where ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 374 and ws.ws_hash <= 707 and hd.hd_hash >= 224 and hd.hd_hash <= 974 and c.c_hash >= 408 and c.c_hash <= 808
;
