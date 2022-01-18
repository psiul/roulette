select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,warehouse w,item i,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 92 and ws.ws_hash <= 425 and hd.hd_hash >= 198 and hd.hd_hash <= 598 and c.c_hash >= 115 and c.c_hash <= 865
;
