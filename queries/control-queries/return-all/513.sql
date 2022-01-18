select count(ws.ws_item_sk)
from web_sales ws,item i,customer c,date_dim d,household_demographics hd
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 133 and ws.ws_hash <= 533 and i.i_hash >= 9 and i.i_hash <= 759 and c.c_hash >= 219 and c.c_hash <= 552
;
