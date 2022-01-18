select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,item i,warehouse w
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 296 and ws.ws_hash <= 629 and c.c_hash >= 2 and c.c_hash <= 752 and i.i_hash >= 440 and i.i_hash <= 840
;
