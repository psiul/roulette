select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer c,warehouse w,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 591 and ws.ws_hash <= 924 and hd.hd_hash >= 248 and hd.hd_hash <= 648 and c.c_hash >= 148 and c.c_hash <= 898
;
