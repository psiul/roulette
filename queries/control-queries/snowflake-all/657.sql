select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,customer c,household_demographics hd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 221 and d.d_hash <= 971 and c.c_hash >= 134 and c.c_hash <= 534 and hd.hd_hash >= 463 and hd.hd_hash <= 796
;
