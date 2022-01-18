select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,customer c,household_demographics hd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 58 and ws.ws_hash <= 391 and d.d_hash >= 207 and d.d_hash <= 957 and hd.hd_hash >= 254 and hd.hd_hash <= 654
;
