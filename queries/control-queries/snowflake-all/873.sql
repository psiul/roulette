select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,item i,date_dim d
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 359 and ws.ws_hash <= 692 and i.i_hash >= 91 and i.i_hash <= 491 and d.d_hash >= 198 and d.d_hash <= 948
;
