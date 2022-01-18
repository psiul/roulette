select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,customer c,customer_demographics cd
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 499 and hd.hd_hash <= 899 and d.d_hash >= 31 and d.d_hash <= 781 and c.c_hash >= 105 and c.c_hash <= 438
;
