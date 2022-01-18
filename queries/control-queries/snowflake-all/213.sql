select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,warehouse w,date_dim d,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and hd.hd_hash >= 665 and hd.hd_hash <= 998 and d.d_hash >= 486 and d.d_hash <= 886 and c.c_hash >= 81 and c.c_hash <= 831
;
