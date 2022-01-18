select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,household_demographics hd,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 26 and ws.ws_hash <= 359 and d.d_hash >= 108 and d.d_hash <= 508 and c.c_hash >= 8 and c.c_hash <= 758
;
