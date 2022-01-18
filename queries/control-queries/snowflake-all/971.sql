select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,warehouse w,customer c
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and d.d_hash >= 23 and d.d_hash <= 773 and hd.hd_hash >= 205 and hd.hd_hash <= 605 and c.c_hash >= 98 and c.c_hash <= 431
;
