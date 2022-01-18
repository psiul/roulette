select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,item i,warehouse w
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 342 and ws.ws_hash <= 742 and c.c_hash >= 15 and c.c_hash <= 765 and i.i_hash >= 412 and i.i_hash <= 745
;
