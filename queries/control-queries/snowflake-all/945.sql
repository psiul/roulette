select count(ws.ws_item_sk)
from web_sales ws,item i,warehouse w,household_demographics hd,customer c
where ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 162 and ws.ws_hash <= 495 and i.i_hash >= 183 and i.i_hash <= 933 and c.c_hash >= 507 and c.c_hash <= 907
;
