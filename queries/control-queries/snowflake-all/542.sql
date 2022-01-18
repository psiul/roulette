select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,customer c,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 201 and d.d_hash <= 951 and c.c_hash >= 468 and c.c_hash <= 868 and cd.cd_hash >= 482 and cd.cd_hash <= 815
;
