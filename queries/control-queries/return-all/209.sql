select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,warehouse w,customer c
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and d.d_hash >= 0 and d.d_hash <= 750 and hd.hd_hash >= 30 and hd.hd_hash <= 363 and c.c_hash >= 473 and c.c_hash <= 873
;
