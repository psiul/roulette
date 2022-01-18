select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,date_dim d,customer c,household_demographics hd
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 547 and ws.ws_hash <= 880 and d.d_hash >= 5 and d.d_hash <= 755 and hd.hd_hash >= 259 and hd.hd_hash <= 659
;
