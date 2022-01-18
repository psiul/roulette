select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,customer c,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 323 and ws.ws_hash <= 723 and d.d_hash >= 129 and d.d_hash <= 879 and c.c_hash >= 662 and c.c_hash <= 995
;
