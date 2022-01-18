select count(ws.ws_item_sk)
from web_sales ws,warehouse w,household_demographics hd,date_dim d,customer c
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 140 and ws.ws_hash <= 890 and hd.hd_hash >= 407 and hd.hd_hash <= 807 and d.d_hash >= 530 and d.d_hash <= 863
;
