select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer c,date_dim d,household_demographics hd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 372 and c.c_hash <= 772 and d.d_hash >= 168 and d.d_hash <= 918 and hd.hd_hash >= 37 and hd.hd_hash <= 370
;
