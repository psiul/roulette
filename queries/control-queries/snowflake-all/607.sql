select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,warehouse w,customer c
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 70 and ws.ws_hash <= 820 and d.d_hash >= 394 and d.d_hash <= 794 and c.c_hash >= 442 and c.c_hash <= 775
;
