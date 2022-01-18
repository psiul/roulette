select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer c,item i,household_demographics hd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 220 and c.c_hash <= 970 and i.i_hash >= 76 and i.i_hash <= 409 and hd.hd_hash >= 434 and hd.hd_hash <= 834
;
