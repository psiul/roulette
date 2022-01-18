select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,customer c,item i
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 535 and ws.ws_hash <= 868 and c.c_hash >= 40 and c.c_hash <= 790 and i.i_hash >= 484 and i.i_hash <= 884
;
