select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,warehouse w,household_demographics hd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 106 and ws.ws_hash <= 856 and d.d_hash >= 477 and d.d_hash <= 877 and c.c_hash >= 610 and c.c_hash <= 943
;
