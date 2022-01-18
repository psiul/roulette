select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,item i,customer c,warehouse w
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 75 and ws.ws_hash <= 408 and i.i_hash >= 596 and i.i_hash <= 996 and c.c_hash >= 239 and c.c_hash <= 989
;
