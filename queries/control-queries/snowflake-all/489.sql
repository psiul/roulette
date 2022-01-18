select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer c,household_demographics hd,item i
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 208 and ws.ws_hash <= 958 and c.c_hash >= 452 and c.c_hash <= 852 and hd.hd_hash >= 104 and hd.hd_hash <= 437
;
