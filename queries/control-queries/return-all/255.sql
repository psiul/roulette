select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,customer_demographics cd,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 227 and ws.ws_hash <= 560 and hd.hd_hash >= 378 and hd.hd_hash <= 778 and d.d_hash >= 174 and d.d_hash <= 924
;
